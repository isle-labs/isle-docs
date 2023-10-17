#!/usr/bin/env bash

# Pre-requisites:
# - foundry (https://getfoundry.sh/)
# - rsync (https://github.com/WayneD/rsync)
# - pnpm (https://pnpm.io)
# - sd (https://github.com/chmln/sd)

# Strict mode: https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

run() {
    # This is either "core" or "periphery"
    repo=$1

    # cd into the repo
    cd .repo/$repo

    # Delete the previously generated docs
    rm -rf ./docs

    # Auto-generate the documents with Forge
    forge doc

    # Go back to the root
    cd ../../

    # Define the reference directory
    reference=contracts/interfaces

    # Delete the current V2 reference
    find $reference -type f -name "*.md" -delete

    pwd

    ls .repos/$repo/docs

    # Copy over the auto-generated files
    rsync --archive \
    --exclude "README.md" \
    --exclude "SUMMARY.md" \
    .repos/$repo/docs/src/contracts/* \
    $reference

    # Move all Markdown files one level up
    find $reference -type f -name "*.md" -execdir mv {} .. \;

    # Delete empty *.sol directories
    find $reference -type d -empty -delete

    # # The Periphery has certain references to the Core
    # sd "\{SablierV2LockupDynamic\}" "[SablierV2LockupDynamic]($core/contract.SablierV2LockupDynamic.md)" $(find $reference -type f -name "*.md")
    # sd "\{SablierV2LockupLinear\}" "[SablierV2LockupLinear]($core/contract.SablierV2LockupLinear.md)" $(find $reference -type f -name "*.md")

    # # Replace the interface references, e.g. {ISablierV2Lockup}, with hyperlinks
    # sd "\{I(\w+)\}" "[I\$1](/$reference/interfaces/interface.I\$1.md)" $(find $reference -type f -name "*.md")

    # # Replace the contract references, e.g. {SablierV2LockupLinear}, with hyperlinks
    # # Note: abstract contracts won't work
    # sd "\{SablierV2(\w+)\}" "[SablierV2\$1](/$reference/contract.SablierV2\$1.md)" $(find $reference -type f -name "*.md")
}

# Generate the raw docs with Forge
run "isle"

# Format the docs with Prettier
pnpm prettier --loglevel silent --write $all

# Remove the italic asterisks added by `forge doc`: https://github.com/foundry-rs/foundry/issues/4540
sd --string-mode "\*" "" $(find $all -type f -name "*.md")

# Re-format the docs with Prettier
pnpm prettier --loglevel silent --write $all
