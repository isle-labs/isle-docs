# PoolConfiguratorStorage

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference)

**Inherits:**
[IPoolConfiguratorStorage](/docs/reference/interfaces/pool/IPoolConfiguratorStorage.md)

## State Variables

### asset

```solidity
address public override asset;
```

### pool

```solidity
address public override pool;
```

### buyer

```solidity
address public override buyer;
```

### config

```solidity
Config public override config;
```

### poolCover

```solidity
uint256 public override poolCover;
```

### isSeller

```solidity
mapping(address => bool) public override isSeller;
```

### isLender

```solidity
mapping(address => bool) public override isLender;
```

## Structs

### Config

```solidity
struct Config {
    bool openToPublic;
    uint24 adminFee;
    uint32 gracePeriod;
    uint96 baseRate;
}
```
