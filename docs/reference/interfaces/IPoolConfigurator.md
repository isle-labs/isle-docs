# IPoolConfigurator

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

**Inherits:**
[IPoolConfiguratorStorage](/docs/reference/interfaces/pool/IPoolConfiguratorStorage.md), [IPoolConfiguratorEvents](/docs/reference/interfaces/pool/IPoolConfiguratorEvents.md), [IAdminable](/docs/reference/interfaces/IAdminable.md)

## Functions

### initialize

The initializer function for the pool configurator (must be called straight after deployment)

```solidity
function initialize(
    IPoolAddressesProvider provider_,
    address poolAdmin_,
    address asset_,
    string memory name_,
    string memory symbol_
)
    external;
```

**Parameters**

| Name         | Type                     | Description                                       |
| ------------ | ------------------------ | ------------------------------------------------- |
| `provider_`  | `IPoolAddressesProvider` | The address of the pool addresses provider.       |
| `poolAdmin_` | `address`                | The address of the pool admin                     |
| `asset_`     | `address`                | The funds asset used in the pool (e.g. DAI, USDC) |
| `name_`      | `string`                 | The name of the asset                             |
| `symbol_`    | `string`                 | The symbol of the asset                           |

### setBuyer

assigns a pool buyer to the pool

```solidity
function setBuyer(address buyer_) external;
```

**Parameters**

| Name     | Type      | Description                            |
| -------- | --------- | -------------------------------------- |
| `buyer_` | `address` | The address of the buyer for this pool |

### setValidSeller

Sets the status of a seller

```solidity
function setValidSeller(address seller_, bool isValid_) external;
```

**Parameters**

| Name       | Type      | Description                 |
| ---------- | --------- | --------------------------- |
| `seller_`  | `address` | The address of the seller   |
| `isValid_` | `bool`    | Whether the seller is valid |

### setValidLender

Sets the status of a lender (LPs)

```solidity
function setValidLender(address lender_, bool isValid_) external;
```

**Parameters**

| Name       | Type      | Description                 |
| ---------- | --------- | --------------------------- |
| `lender_`  | `address` | The address of the lender   |
| `isValid_` | `bool`    | Whether the lender is valid |

### setOpenToPublic

Sets whether the pool is open to the public (permissioned or permissionless)

```solidity
function setOpenToPublic(bool isOpenToPublic_) external;
```

**Parameters**

| Name              | Type   | Description                            |
| ----------------- | ------ | -------------------------------------- |
| `isOpenToPublic_` | `bool` | Whether the pool is open to the public |

### setAdminFee

Sets the admin fee rate that would be applied to the pool

```solidity
function setAdminFee(uint24 adminFee_) external;
```

**Parameters**

| Name        | Type     | Description       |
| ----------- | -------- | ----------------- |
| `adminFee_` | `uint24` | The new admin fee |

### setGracePeriod

Sets the grace period for the pool

```solidity
function setGracePeriod(uint32 gracePeriod_) external;
```

**Parameters**

| Name           | Type     | Description          |
| -------------- | -------- | -------------------- |
| `gracePeriod_` | `uint32` | The new grace period |

### setBaseRate

Sets the base rate for the pool

```solidity
function setBaseRate(uint96 baseRate_) external;
```

**Parameters**

| Name        | Type     | Description       |
| ----------- | -------- | ----------------- |
| `baseRate_` | `uint96` | The new base rate |

### requestFunds

Request funds from the pool and fund the loan manager

```solidity
function requestFunds(uint256 principal_) external;
```

**Parameters**

| Name         | Type      | Description                        |
| ------------ | --------- | ---------------------------------- |
| `principal_` | `uint256` | The amount of principal to request |

### triggerDefault

Triggers the defaults of a specific loan in the loan manager

```solidity
function triggerDefault(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description                  |
| --------- | -------- | ---------------------------- |
| `loanId_` | `uint16` | The ID of the defaulted loan |

### requestRedeem

Requests to redeem shares

```solidity
function requestRedeem(uint256 shares_, address owner_, address sender_) external;
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `shares_` | `uint256` | The amount of shares to redeem |
| `owner_`  | `address` | The owner of the shares        |
| `sender_` | `address` | The sender of the request      |

### processRedeem

Processes the redemption of shares for a specific owner

```solidity
function processRedeem(
    uint256 shares_,
    address owner_,
    address sender_
)
    external
    returns (uint256 redeemableShares_, uint256 resultingAssets_);
```

**Parameters**

| Name      | Type      | Description                       |
| --------- | --------- | --------------------------------- |
| `shares_` | `uint256` | The amount of shares to redeem    |
| `owner_`  | `address` | The owner of the shares           |
| `sender_` | `address` | The sender of the process request |

**Returns**

| Name                | Type      | Description                                                   |
| ------------------- | --------- | ------------------------------------------------------------- |
| `redeemableShares_` | `uint256` | The amount of redeemable shares                               |
| `resultingAssets_`  | `uint256` | The corresponding amount of assets with the redeemable shares |

### removeShares

Removes shares from its withdrawal request

```solidity
function removeShares(uint256 shares_, address owner_) external returns (uint256 sharesReturned_);
```

**Parameters**

| Name      | Type      | Description                                    |
| --------- | --------- | ---------------------------------------------- |
| `shares_` | `uint256` | The amount of shares to remove from withdrawal |
| `owner_`  | `address` | The owner of the shares                        |

**Returns**

| Name              | Type      | Description                   |
| ----------------- | --------- | ----------------------------- |
| `sharesReturned_` | `uint256` | The amount of shares returned |

### depositCover

Pool admin deposits pool cover

```solidity
function depositCover(uint256 amount_) external;
```

**Parameters**

| Name      | Type      | Description                                         |
| --------- | --------- | --------------------------------------------------- |
| `amount_` | `uint256` | The amount of assets to deposit as first-loss cover |

### withdrawCover

Pool admin withdraws from pool cover

```solidity
function withdrawCover(uint256 amount_, address recipient_) external;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `amount_`    | `uint256` | The amount of assets to withdraw from first-loss cover |
| `recipient_` | `address` | The address of the recipient                           |

### openToPublic

Returns whether the pool is open to public

```solidity
function openToPublic() external view returns (bool openToPublic_);
```

**Returns**

| Name            | Type   | Description                        |
| --------------- | ------ | ---------------------------------- |
| `openToPublic_` | `bool` | Whether the pool is open to public |

### adminFee

Returns the admin fee of the pool

```solidity
function adminFee() external view returns (uint24 adminFee_);
```

**Returns**

| Name        | Type     | Description               |
| ----------- | -------- | ------------------------- |
| `adminFee_` | `uint24` | The admin fee of the pool |

### gracePeriod

Returns the grace period of the pool

```solidity
function gracePeriod() external view returns (uint32 gracePeriod_);
```

**Returns**

| Name           | Type     | Description                  |
| -------------- | -------- | ---------------------------- |
| `gracePeriod_` | `uint32` | The grace period of the pool |

### baseRate

Returns the base rate of the pool

```solidity
function baseRate() external view returns (uint96 baseRate_);
```

**Returns**

| Name        | Type     | Description               |
| ----------- | -------- | ------------------------- |
| `baseRate_` | `uint96` | The base rate of the pool |

### maxDeposit

Returns the max deposit amount of a receiver

```solidity
function maxDeposit(address receiver_) external view returns (uint256 maxAssets_);
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `receiver_` | `address` | The address of the receiver |

**Returns**

| Name         | Type      | Description                                    |
| ------------ | --------- | ---------------------------------------------- |
| `maxAssets_` | `uint256` | The max amount of assets that can be deposited |

### maxMint

Returns the max mint amount of a receiver

```solidity
function maxMint(address receiver_) external view returns (uint256 maxShares_);
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `receiver_` | `address` | The address of the receiver |

**Returns**

| Name         | Type      | Description                                 |
| ------------ | --------- | ------------------------------------------- |
| `maxShares_` | `uint256` | The max amount of shares that can be minted |

### maxRedeem

Returns the max redeem amount of an owner

```solidity
function maxRedeem(address owner_) external view returns (uint256 maxShares_);
```

**Parameters**

| Name     | Type      | Description              |
| -------- | --------- | ------------------------ |
| `owner_` | `address` | The address of the owner |

**Returns**

| Name         | Type      | Description                                   |
| ------------ | --------- | --------------------------------------------- |
| `maxShares_` | `uint256` | The max amount of shares that can be redeemed |

### previewRedeem

Previews the amount of assets that can be redeemed for the amount of shares specified

```solidity
function previewRedeem(address owner_, uint256 shares_) external view returns (uint256 assets_);
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `owner_`  | `address` | The address of the owner       |
| `shares_` | `uint256` | The amount of shares to redeem |

**Returns**

| Name      | Type      | Description                                 |
| --------- | --------- | ------------------------------------------- |
| `assets_` | `uint256` | The amount of assets that would be received |

### totalAssets

Returns the total amount of assets in the pool

```solidity
function totalAssets() external view returns (uint256 totalAssets_);
```

**Returns**

| Name           | Type      | Description                            |
| -------------- | --------- | -------------------------------------- |
| `totalAssets_` | `uint256` | The total amount of assets in the pool |

### hasSufficientCover

Returns whether the pool currently has sufficient cover

```solidity
function hasSufficientCover() external view returns (bool hasSufficientCover_);
```

**Returns**

| Name                  | Type   | Description                                     |
| --------------------- | ------ | ----------------------------------------------- |
| `hasSufficientCover_` | `bool` | Whether the pool currently has sufficient cover |

### unrealizedLosses

Returns the current amount of unrealized losses of the pool

```solidity
function unrealizedLosses() external view returns (uint256 unrealizedLosses_);
```

**Returns**

| Name                | Type      | Description                                         |
| ------------------- | --------- | --------------------------------------------------- |
| `unrealizedLosses_` | `uint256` | The current amount of unrealized losses of the pool |
