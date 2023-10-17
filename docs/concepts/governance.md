---
description: Manages protocol-wide configurations
---

# Governance

The community DAO is in charge of managing governance. It has the ability to perform maintenance functions and parameter adjustments to the protocol via decentralized voting, including:

* Deploying and upgrading pools
* Changing protocol configurations and parameters
* Pausing protocol activity in the event of an emergency

Anyone can participate in governance by making proposals, discussing them, and participating in Snapshot votes.

## Participation

### Governance Forum

This is a place where community members can make and discuss proposals.

## Governance Council

The governance council of Isle has been set up to execute on-chain transactions on behalf of the results of community votes. The Isle Council is a 3-of-5 multisig with 5 members representing all stakeholders participating in the protocol.

Members of the governance council will be released after the protocol launches officially.

## Governance Parameters

{% hint style="info" %}
Different from pool parameters which are managed by **Pool Admins**. These parameters are set to be protocol-wide and affect each pool.
{% endhint %}

The following parameters that are configured by the governor.

### PoolAdmin

* `ownedPoolConfigurator`: the pool configurators associated with each pool admin

### Pool Configurator

* `maxCoverLiquidation`: the max liquidation of the pool admin's cover
* `minCover`: the minimum cover required for the pool&#x20;
* `poolLimit`: The maximum size of the pool

### Global

* `isCollateralAsset`: a whitelist of valid collateral assets
* `isPoolAsset`: a whitelist of valid pool assets
* `isleVault`: address of the **Isle vault**
* `protocolFee`: the global fee as a percentage of interest that is charged
