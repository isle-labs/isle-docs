# PoolDeployer

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/libraries/PoolDeployer.sol)

Library containing the logic to deploy a pool contract.

## Functions

### createPool

Deploys a new pool contract.

```solidity
function createPool(
    address configurator_,
    address asset_,
    string memory name_,
    string memory symbol_
)
    public
    returns (address pool_);
```
