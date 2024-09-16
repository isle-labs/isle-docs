---
description: Manages protocol-wide configurations
---

# Governance

The community DAO is in charge of managing governance. It has the ability to perform maintenance functions and parameter adjustments to the protocol via decentralized voting, including:

- Deploying and upgrading pools
- Changing protocol configurations and parameters
- Pausing protocol activity in the event of an emergency

Anyone can participate in governance by making proposals, discussing them, and participating in Snapshot votes.

## Participation

### Governance Forum

This is a place where community members can make and discuss proposals.

### Governance Council

The governance council of Isle has been set up to execute on-chain transactions on behalf of the results of community votes. The Isle Council is a 3-of-5 multisig with 5 members representing all stakeholders participating in the protocol.

Members of the governance council will be released after the protocol launches officially.

## Governance Parameters

These are the list of parameters that will be managed and set by the governor

### Pool Configuration

- `maxCoverLiquidation`: the maximum liquidation of the pool admin's cover in the event of a default (e.g. 10% means the protocol liquidate at most 10% of the pool cover at the event of a default)
- `minCover`: the minimum pool cover size required for the pool
- `poolLimit`: The maximum size of the pool

### Global Configuration

- `isReceivableAsset`: a whitelist of valid receivable assets
- `isPoolAsset`: a whitelist of valid pool assets
- `isPoolAdmin`: a whitelist of valid pool admins
- `isleVault`: address of the **Isle vault**
- `protocolFee`: the global fee as a percentage of interest earned
- Emergency pausing
  - `contractPaused`: whether the contract is paused
  - `isFunctionPaused`: whether the function of a contract is paused
