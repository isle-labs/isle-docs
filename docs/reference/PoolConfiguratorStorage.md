# PoolConfiguratorStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/PoolConfiguratorStorage.sol)

**Inherits:**
[IPoolConfiguratorStorage](/docs/reference/interfaces/IPoolConfiguratorStorage.md)

## State Variables

### \_config

```solidity
PoolConfigurator.Config internal _config;
```

### admin

```solidity
address public override admin;
```

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
