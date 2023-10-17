# IPoolConfiguratorStorage

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces/pool)

## Functions

### asset

```solidity
function asset() external view returns (address asset_);
```

### pool

```solidity
function pool() external view returns (address pool_);
```

### buyer

```solidity
function buyer() external view returns (address buyer_);
```

### config

```solidity
function config() external view returns (bool openToPublic_, uint24 adminFee_, uint32 gracePeriod_, uint96 baseRate_);
```

### poolCover

```solidity
function poolCover() external view returns (uint256 poolCover_);
```

### isSeller

```solidity
function isSeller(address seller_) external view returns (bool isSeller_);
```

### isLender

```solidity
function isLender(address lender_) external view returns (bool isLender_);
```
