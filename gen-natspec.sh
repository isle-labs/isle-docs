#!/usr/bin/env bash

# Pre-requisites:
# - foundry (https://getfoundry.sh/)
# - rsync (https://github.com/WayneD/rsync)
# - pnpm (https://pnpm.io)
# - sd (https://github.com/chmln/sd)

# Strict mode: https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# Define the reference directory
reference=docs/reference

run() {
    # This is either "core" or "periphery"
    repo=$1

    # cd into the repo
    cd repo/$repo

    # Delete the previously generated docs
    rm -rf ./docs

    # Auto-generate the documents with Forge
    forge doc

    # Go back to the root
    cd ../../

    # Delete the current V2 reference
    find $reference -type f -name "*.md" -delete

    # Copy over the auto-generated files
    rsync --archive \
    --exclude "README.md" \
    --exclude "SUMMARY.md" \
    repo/$repo/docs/src/contracts/* \
    $reference

    # Move all Markdown files one level up and rename files to remove the "contract.", "interface.", "abstract." prefix
    find $reference -type f -name "*.md" -execdir bash -c 'mv -- "$1" "../${1#*.}"' bash {} \;

    # Delete empty *.sol directories
    find $reference -type d -empty -delete
}

generate_summary_markdown() {
    local path=$1
    local indent_level=$2
    local indent=""

    # Generate the required indentation
    for ((i=0; i<$indent_level; i++)); do
        indent="${indent}  "
    done

    # Iterate over all files and directories in the path
    for item in "$path"/*; do
        # If the item is a directory, print the directory name and recurse
        if [ -d "$item" ]; then
            echo "${indent}* $(basename "$item")"
            generate_summary_markdown "$item" $(($indent_level+1))
        # If the item is a file, print the markdown link
        elif [ -f "$item" ]; then
            echo "${indent}* [$(basename "$item" .md)]($item)"
        fi
    done
}

# Generate the raw docs with Forge
run "isle"

# Update the hyperlinks to use the directory structure of the docs website
sd "contracts/abstracts/\w+\.sol" $reference/abstracts $(find $reference -type f -name "*.md")
sd "contracts/interfaces/pool/\w+\.sol" $reference/interfaces/pool $(find $reference -type f -name "*.md")
sd "contracts/interfaces/\w+\.sol" $reference/interfaces $(find $reference -type f -name "*.md")
sd "contracts/libraries/\w+\.sol" $reference/libraries $(find $reference -type f -name "*.md")
sd "contracts/libraries/types/\w+\.sol" $reference/libraries/types $(find $reference -type f -name "*.md")
sd "contracts/libraries/upgradability/\w+\.sol" $reference/libraries/upgradability $(find $reference -type f -name "*.md")
sd "contracts/\w+\.sol" $reference $(find $reference -type f -name "*.md")

# Remove the "contract.", "interface.", "abstract." prefix from the file names
# e.g. interface.IPool.md => IPool.md
sd "(\w+).(\w+).md" "\$2.md" $(find $reference -type f -name "*.md")

# Format the docs with Prettier
pnpm prettier --loglevel silent --write $reference

# Remove the italic asterisks added by `forge doc`: https://github.com/foundry-rs/foundry/issues/4540
sd --string-mode "\*" "" $(find $reference -type f -name "*.md")

# Re-format the docs with Prettier
pnpm prettier --loglevel silent --write $reference


# Start the script
cd docs

# Generate the SUMMARY content
generate_summary_markdown "reference" 0 > temp.md

# Replace the section between the markers with the generated markdown links
perl -i -p0e 's/<!-- START -->(.*?)<!-- END -->/"<!-- START -->\n".`cat temp.md`."<!-- END -->"/gse' SUMMARY.md

rm temp.md

cd ..
