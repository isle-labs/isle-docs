# PoolConfigurator

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/libraries/types/DataTypes.sol)

Namespace for the structs used in
[PoolConfigurator](/docs/reference/libraries/types/PoolConfigurator.md)

## Structs

### Config

```solidity
struct Config {
    bool openToPublic;
    uint24 adminFee;
    uint24 maxCoverLiquidation;
    uint104 minCover;
    uint104 poolLimit;
}
```
