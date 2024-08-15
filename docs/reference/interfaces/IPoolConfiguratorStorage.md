# IPoolConfiguratorStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/interfaces/IPoolConfiguratorStorage.sol)

## Functions

### admin

Returns the addres of the pool admin.

```solidity
function admin() external view returns (address admin_);
```

**Returns**

| Name     | Type      | Description                    |
| -------- | --------- | ------------------------------ |
| `admin_` | `address` | The address of the pool admin. |

### asset

Retrieves the ERC20 asset used for the pool.

```solidity
function asset() external view returns (address asset_);
```

**Returns**

| Name     | Type      | Description               |
| -------- | --------- | ------------------------- |
| `asset_` | `address` | The address of the asset. |

### pool

Retrieves the pool that is under the management of the pool configurator.

```solidity
function pool() external view returns (address pool_);
```

**Returns**

| Name    | Type      | Description              |
| ------- | --------- | ------------------------ |
| `pool_` | `address` | The address of the pool. |

### buyer

Retrives the address of the buyer.

_Each pool only has one buyer but can have multiple suppliers._

```solidity
function buyer() external view returns (address buyer_);
```

**Returns**

| Name     | Type      | Description               |
| -------- | --------- | ------------------------- |
| `buyer_` | `address` | The address of the buyer. |

### poolCover

Retrieves the amount of pool cover in {PoolConfigurator}.

```solidity
function poolCover() external view returns (uint256 poolCover_);
```

**Returns**

| Name         | Type      | Description                                           |
| ------------ | --------- | ----------------------------------------------------- |
| `poolCover_` | `uint256` | The amount of pool cover deposited by the pool admin. |

### isSeller

Returns whether the seller is a valid seller.

```solidity
function isSeller(address seller_) external view returns (bool isSeller_);
```

**Returns**

| Name        | Type   | Description                           |
| ----------- | ------ | ------------------------------------- |
| `isSeller_` | `bool` | Whether the seller is a valid seller. |

### isLender

Returns whether the lender is a valid lender.

_Only valid lenders can deposit when the pool is not open to public._

```solidity
function isLender(address lender_) external view returns (bool isLender_);
```

**Returns**

| Name        | Type   | Description                           |
| ----------- | ------ | ------------------------------------- |
| `isLender_` | `bool` | Whether the lender is a valid lender. |
