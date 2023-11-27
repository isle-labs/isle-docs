# IPoolConfiguratorEvents

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces/pool)

## Events

### Initialized

Emitted when a pool configurator is initialized

```solidity
event Initialized(address indexed poolAdmin_, address indexed asset_, address pool_);
```

### BuyerSet

Emitted when the buyer of a pool is set

```solidity
event BuyerSet(address indexed buyer_);
```

### ValidSellerSet

Emitted when a valid seller is set

```solidity
event ValidSellerSet(address indexed seller_, bool isValid_);
```

### ValidLenderSet

Emitted when a valid lender is set

```solidity
event ValidLenderSet(address indexed lender_, bool isValid_);
```

### AdminFeeSet

Emitted when an admin fee rate is set

```solidity
event AdminFeeSet(uint256 adminFee_);
```

### OpenToPublicSet

Emitted when the pool is set as open to the public

```solidity
event OpenToPublicSet(bool isOpenToPublic_);
```

### GracePeriodSet

Emitted when the grace period of the pool is set

```solidity
event GracePeriodSet(uint256 gracePeriod_);
```

### RedeemProcessed

Emitted when a redeem is processed

```solidity
event RedeemProcessed(address indexed owner_, uint256 redeemableShares_, uint256 resultingAssets_);
```

### CoverDeposited

Emitted when the pool cover is deposited

```solidity
event CoverDeposited(uint256 amount_);
```

### CoverWithdrawn

Emitted when the pool cover is withdrawn

```solidity
event CoverWithdrawn(uint256 amount_);
```

### RedeemRequested

Emitted when an owner requests a redemption

```solidity
event RedeemRequested(address indexed owner_, uint256 shares_);
```

### SharesRemoved

Emitted when an owner removes shares from their withdrawal request

```solidity
event SharesRemoved(address indexed owner_, uint256 shares_);
```

### CoverLiquidated

Emitted when the pool cover is liquidated

```solidity
event CoverLiquidated(uint256 toPool_);
```
