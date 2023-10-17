# PoolDeployer

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference/libraries)

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
