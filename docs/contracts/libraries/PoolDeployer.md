# PoolDeployer

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/libraries/PoolDeployer.sol)

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
