# IPool

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

**Inherits:**
IERC4626

## Functions

### configurator

Returns the address of the pool configurator

```solidity
function configurator() external view returns (address configurator_);
```

**Returns**

| Name            | Type      | Description                          |
| --------------- | --------- | ------------------------------------ |
| `configurator_` | `address` | The address of the pool configurator |

### depositWithPermit

Deposits assets into the pool with the permit signature

```solidity
function depositWithPermit(
    uint256 assets,
    address receiver,
    uint256 deadline,
    uint8 v,
    bytes32 r,
    bytes32 s
)
    external
    returns (uint256 shares_);
```

**Parameters**

| Name       | Type      | Description                          |
| ---------- | --------- | ------------------------------------ |
| `assets`   | `uint256` | The amount of assets to deposit      |
| `receiver` | `address` | The address of the receiver          |
| `deadline` | `uint256` | The deadline of the permit signature |
| `v`        | `uint8`   | The v of the permit signature        |
| `r`        | `bytes32` | The r of the permit signature        |
| `s`        | `bytes32` | The s of the permit signature        |

**Returns**

| Name      | Type      | Description                               |
| --------- | --------- | ----------------------------------------- |
| `shares_` | `uint256` | The corresponding amount of shares minted |

### mintWithPermit

Mints shares from the pool with the permit signature

```solidity
function mintWithPermit(
    uint256 shares,
    address receiver,
    uint256 maxAssets,
    uint256 deadline,
    uint8 v,
    bytes32 r,
    bytes32 s
)
    external
    returns (uint256 assets_);
```

**Parameters**

| Name        | Type      | Description                             |
| ----------- | --------- | --------------------------------------- |
| `shares`    | `uint256` | The amount of shares to mint            |
| `receiver`  | `address` | The address of the receiver             |
| `maxAssets` | `uint256` | The maximum amount of assets to deposit |
| `deadline`  | `uint256` | The deadline of the permit signature    |
| `v`         | `uint8`   | The v of the permit signature           |
| `r`         | `bytes32` | The r of the permit signature           |
| `s`         | `bytes32` | The s of the permit signature           |

**Returns**

| Name      | Type      | Description                                  |
| --------- | --------- | -------------------------------------------- |
| `assets_` | `uint256` | The corresponding amount of assets deposited |

### removeShares

Remove shares from the pool

```solidity
function removeShares(uint256 shares_, address owner_) external returns (uint256 sharesReturned_);
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `shares_` | `uint256` | The amount of shares to remove |
| `owner_`  | `address` | The owner of the shares        |

**Returns**

| Name              | Type      | Description                   |
| ----------------- | --------- | ----------------------------- |
| `sharesReturned_` | `uint256` | The amount of shares returned |

### requestRedeem

Request the redemption of shares from the pool

```solidity
function requestRedeem(uint256 shares_, address owner_) external;
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `shares_` | `uint256` | The amount of shares to redeem |
| `owner_`  | `address` | The owner of the shares        |

### balanceOfAssets

Returns of the balance of the account

```solidity
function balanceOfAssets(address account_) external view returns (uint256 assets_);
```

**Parameters**

| Name       | Type      | Description                |
| ---------- | --------- | -------------------------- |
| `account_` | `address` | The address of the account |

**Returns**

| Name      | Type      | Description          |
| --------- | --------- | -------------------- |
| `assets_` | `uint256` | The amount of assets |

### convertToExitAssets

Returns the amount of assets that can be withdrawn for the amount of shares

```solidity
function convertToExitAssets(uint256 shares_) external view returns (uint256 assets_);
```

**Parameters**

| Name      | Type      | Description          |
| --------- | --------- | -------------------- |
| `shares_` | `uint256` | The amount of shares |

**Returns**

| Name      | Type      | Description          |
| --------- | --------- | -------------------- |
| `assets_` | `uint256` | The amount of assets |

### convertToExitShares

Returns the amount of shares that will be burned to withdraw the amount of assets

```solidity
function convertToExitShares(uint256 assets_) external view returns (uint256 shares_);
```

**Parameters**

| Name      | Type      | Description                      |
| --------- | --------- | -------------------------------- |
| `assets_` | `uint256` | The amount of assets to withdraw |

**Returns**

| Name      | Type      | Description          |
| --------- | --------- | -------------------- |
| `shares_` | `uint256` | The amount of shares |

### unrealizedLosses

Returns the unrealized losses of the pool

```solidity
function unrealizedLosses() external view returns (uint256 unrealizedLosses_);
```

**Returns**

| Name                | Type      | Description           |
| ------------------- | --------- | --------------------- |
| `unrealizedLosses_` | `uint256` | The unrealized losses |
