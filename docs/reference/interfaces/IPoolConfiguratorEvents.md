# IPoolConfiguratorEvents

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/interfaces/IPoolConfiguratorEvents.sol)

## Events

### Initialized

Emitted when a pool configurator is initialized.

```solidity
event Initialized(address indexed poolAdmin_, address indexed asset_, address pool_);
```

**Parameters**

| Name         | Type      | Description                                |
| ------------ | --------- | ------------------------------------------ |
| `poolAdmin_` | `address` | The address of the pool admin.             |
| `asset_`     | `address` | The address of the base asset of the pool. |
| `pool_`      | `address` | The address of the pool.                   |

### TransferAdmin

Emitted when the admin is transferred.

```solidity
event TransferAdmin(address indexed oldAdmin_, address indexed newAdmin_);
```

**Parameters**

| Name        | Type      | Description                   |
| ----------- | --------- | ----------------------------- |
| `oldAdmin_` | `address` | The address of the old admin. |
| `newAdmin_` | `address` | The address of the new admin. |

### MaxCoverLiquidationSet

Emitted when the max cover liquidation is set.

```solidity
event MaxCoverLiquidationSet(uint24 maxCoverLiquidation_);
```

**Parameters**

| Name                   | Type     | Description                                |
| ---------------------- | -------- | ------------------------------------------ |
| `maxCoverLiquidation_` | `uint24` | The max cover liquidation as a percentage. |

### MinCoverSet

Emitted when the min cover is set.

```solidity
event MinCoverSet(uint104 minCover_);
```

**Parameters**

| Name        | Type      | Description             |
| ----------- | --------- | ----------------------- |
| `minCover_` | `uint104` | The min cover required. |

### PoolLimitSet

Emitted when the pool limit is set.

```solidity
event PoolLimitSet(uint104 poolLimit_);
```

**Parameters**

| Name         | Type      | Description     |
| ------------ | --------- | --------------- |
| `poolLimit_` | `uint104` | The pool limit. |

### BuyerSet

Emitted when the buyer of the pool is set.

```solidity
event BuyerSet(address indexed buyer_);
```

**Parameters**

| Name     | Type      | Description               |
| -------- | --------- | ------------------------- |
| `buyer_` | `address` | The address of the buyer. |

### ValidSellerSet

Emitted when a valid seller is set.

```solidity
event ValidSellerSet(address indexed seller_, bool isValid_);
```

**Parameters**

| Name       | Type      | Description                  |
| ---------- | --------- | ---------------------------- |
| `seller_`  | `address` | The address of the seller.   |
| `isValid_` | `bool`    | Whether the seller is valid. |

### ValidLenderSet

Emitted when a valid lender is set.

```solidity
event ValidLenderSet(address indexed lender_, bool isValid_);
```

**Parameters**

| Name       | Type      | Description                  |
| ---------- | --------- | ---------------------------- |
| `lender_`  | `address` | The address of the lender.   |
| `isValid_` | `bool`    | Whether the lender is valid. |

### AdminFeeSet

Emitted when an admin fee rate is set.

```solidity
event AdminFeeSet(uint256 adminFee_);
```

**Parameters**

| Name        | Type      | Description             |
| ----------- | --------- | ----------------------- |
| `adminFee_` | `uint256` | The new admin fee rate. |

### OpenToPublicSet

Emitted when the pool is set as open to the public.

```solidity
event OpenToPublicSet(bool isOpenToPublic_);
```

**Parameters**

| Name              | Type   | Description                             |
| ----------------- | ------ | --------------------------------------- |
| `isOpenToPublic_` | `bool` | Whether the pool is open to the public. |

### RedeemProcessed

Emitted when a redeem is processed.

```solidity
event RedeemProcessed(address indexed owner_, uint256 redeemableShares_, uint256 resultingAssets_);
```

**Parameters**

| Name                | Type      | Description                                     |
| ------------------- | --------- | ----------------------------------------------- |
| `owner_`            | `address` | The address of the owner.                       |
| `redeemableShares_` | `uint256` | The amount of redeemable shares.                |
| `resultingAssets_`  | `uint256` | The amount of assets resulting from the redeem. |

### CoverDeposited

Emitted when the pool cover is deposited.

```solidity
event CoverDeposited(uint256 amount_);
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `amount_` | `uint256` | The amount of cover deposited. |

### CoverWithdrawn

Emitted when the pool cover is withdrawn.

```solidity
event CoverWithdrawn(uint256 amount_);
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `amount_` | `uint256` | The amount of cover withdrawn. |

### RedeemRequested

Emitted when an owner requests a redemption.

```solidity
event RedeemRequested(address indexed owner_, uint256 shares_);
```

**Parameters**

| Name      | Type      | Description                                                  |
| --------- | --------- | ------------------------------------------------------------ |
| `owner_`  | `address` | The address of the owner.                                    |
| `shares_` | `uint256` | The amount of shares that is used to request for redemption. |

### SharesRemoved

Emitted when an owner removes shares from their withdrawal request.

```solidity
event SharesRemoved(address indexed owner_, uint256 shares_);
```

**Parameters**

| Name      | Type      | Description                           |
| --------- | --------- | ------------------------------------- |
| `owner_`  | `address` | The address of the owner.             |
| `shares_` | `uint256` | The amount of shares that is removed. |

### CoverLiquidated

Emitted when the pool cover is liquidated.

```solidity
event CoverLiquidated(uint256 toPool_);
```

**Parameters**

| Name      | Type      | Description                                   |
| --------- | --------- | --------------------------------------------- |
| `toPool_` | `uint256` | The amount of funds that is sent to the pool. |
