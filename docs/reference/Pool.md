# Pool

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference)

**Inherits:**
[IPool](/docs/reference/interfaces/IPool.md), ERC20Permit

See the documentation in {IPool}.

## State Variables

### configurator

```solidity
address public configurator;
```

### \_asset

```solidity
ERC20Permit private immutable _asset;
```

### \_underlyingDecimals

```solidity
uint8 private immutable _underlyingDecimals;
```

## Functions

### constructor

```solidity
constructor(
    address configurator_,
    address asset_,
    string memory name_,
    string memory symbol_
)
    ERC20Permit(name_)
    ERC20(name_, symbol_);
```

### depositWithPermit

Deposits assets into the pool with the permit signature

```solidity
function depositWithPermit(
    uint256 assets_,
    address receiver_,
    uint256 deadline_,
    uint8 v_,
    bytes32 r_,
    bytes32 s_
)
    external
    returns (uint256 shares_);
```

**Parameters**

| Name        | Type      | Description |
| ----------- | --------- | ----------- |
| `assets_`   | `uint256` |             |
| `receiver_` | `address` |             |
| `deadline_` | `uint256` |             |
| `v_`        | `uint8`   |             |
| `r_`        | `bytes32` |             |
| `s_`        | `bytes32` |             |

**Returns**

| Name      | Type      | Description                               |
| --------- | --------- | ----------------------------------------- |
| `shares_` | `uint256` | The corresponding amount of shares minted |

### mintWithPermit

Mints shares from the pool with the permit signature

```solidity
function mintWithPermit(
    uint256 shares_,
    address receiver_,
    uint256 maxAssets_,
    uint256 deadline_,
    uint8 v_,
    bytes32 r_,
    bytes32 s_
)
    external
    returns (uint256 assets_);
```

**Parameters**

| Name         | Type      | Description |
| ------------ | --------- | ----------- |
| `shares_`    | `uint256` |             |
| `receiver_`  | `address` |             |
| `maxAssets_` | `uint256` |             |
| `deadline_`  | `uint256` |             |
| `v_`         | `uint8`   |             |
| `r_`         | `bytes32` |             |
| `s_`         | `bytes32` |             |

**Returns**

| Name      | Type      | Description                                  |
| --------- | --------- | -------------------------------------------- |
| `assets_` | `uint256` | The corresponding amount of assets deposited |

### removeShares

Remove shares from the pool

```solidity
function removeShares(uint256 shares_, address owner_) external override returns (uint256 sharesReturned_);
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
function requestRedeem(uint256 shares_, address owner_) external override;
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `shares_` | `uint256` | The amount of shares to redeem |
| `owner_`  | `address` | The owner of the shares        |

### balanceOfAssets

Returns of the balance of the account

```solidity
function balanceOfAssets(address account_) public view override returns (uint256 balanceOfAssets_);
```

**Parameters**

| Name       | Type      | Description                |
| ---------- | --------- | -------------------------- |
| `account_` | `address` | The address of the account |

**Returns**

| Name               | Type      | Description                   |
| ------------------ | --------- | ----------------------------- |
| `balanceOfAssets_` | `uint256` | assets\_ The amount of assets |

### convertToExitAssets

Returns the amount of assets that can be withdrawn for the amount of shares

```solidity
function convertToExitAssets(uint256 shares_) public view override returns (uint256 assets_);
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
function convertToExitShares(uint256 assets_) public view override returns (uint256 shares_);
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
function unrealizedLosses() public view override returns (uint256 unrealizedLosses_);
```

**Returns**

| Name                | Type      | Description           |
| ------------------- | --------- | --------------------- |
| `unrealizedLosses_` | `uint256` | The unrealized losses |

### deposit

_See {IERC4626-deposit}._

```solidity
function deposit(uint256 assets, address receiver) public override returns (uint256);
```

### mint

_See {IERC4626-mint}.
As opposed to {deposit}, minting is allowed even if the vault is in a state where the price of a share is zero.
In this case, the shares will be minted without requiring any assets to be deposited._

```solidity
function mint(uint256 shares, address receiver) public override returns (uint256);
```

### withdraw

_See {IERC4626-withdraw}._

```solidity
function withdraw(uint256 assets_, address receiver_, address owner_) public pure override returns (uint256 shares_);
```

### redeem

_See {IERC4626-redeem}._

```solidity
function redeem(uint256 shares_, address receiver_, address owner_) public override returns (uint256 assets_);
```

### maxDeposit

_See {IERC4626-maxDeposit}._

```solidity
function maxDeposit(address receiver_) public view override returns (uint256 maxAssets_);
```

### maxMint

_See {IERC4626-maxMint}._

```solidity
function maxMint(address receiver_) public view override returns (uint256 maxShares_);
```

### maxWithdraw

_See {IERC4626-maxWithdraw}._

```solidity
function maxWithdraw(address owner_) public pure override returns (uint256 maxAssets_);
```

### maxRedeem

_See {IERC4626-maxRedeem}._

```solidity
function maxRedeem(address owner_) public view override returns (uint256 maxShares_);
```

### previewWithdraw

_See {IERC4626-previewWithdraw}._

```solidity
function previewWithdraw(uint256 assets_) public pure override returns (uint256 shares_);
```

### previewRedeem

_See {IERC4626-previewRedeem}._

```solidity
function previewRedeem(uint256 shares_) public view override returns (uint256 assets_);
```

### convertToShares

_See {IERC4626-convertToShares}._

```solidity
function convertToShares(uint256 assets_) public view override returns (uint256 shares_);
```

### convertToAssets

_See {IERC4626-convertToAssets}._

```solidity
function convertToAssets(uint256 shares_) public view override returns (uint256 assets_);
```

### previewDeposit

_See {IERC4626-previewDeposit}._

```solidity
function previewDeposit(uint256 assets_) public view override returns (uint256 shares_);
```

### previewMint

_See {IERC4626-previewMint}._

```solidity
function previewMint(uint256 shares_) public view override returns (uint256 assets_);
```

### decimals

_Decimals are computed by adding the decimal offset on top of the underlying asset's decimals. This
"original" value is cached during construction of the vault contract. If this read operation fails (e.g., the
asset has not been created yet), a default of 18 is used to represent the underlying asset's decimals._

```solidity
function decimals() public view override(IERC20Metadata, ERC20) returns (uint8);
```

### asset

_See {IERC4626-asset}._

```solidity
function asset() public view override returns (address);
```

### totalAssets

_See {IERC4626-totalAssets}._

```solidity
function totalAssets() public view override returns (uint256);
```

### \_deposit

_Deposit/mint common workflow._

```solidity
function _deposit(address caller, address receiver, uint256 assets, uint256 shares) internal;
```

### \_withdraw

_Withdraw/redeem common workflow._

```solidity
function _withdraw(address caller, address receiver, address owner, uint256 assets, uint256 shares) internal;
```

### \_decimalsOffset

```solidity
function _decimalsOffset() internal pure returns (uint8);
```

### \_convertToShares

```solidity
function _convertToShares(uint256 assets_, Math.Rounding rounding_) internal view virtual returns (uint256 shares_);
```

### \_convertToExitShares

```solidity
function _convertToExitShares(
    uint256 assets_,
    Math.Rounding rounding_
)
    internal
    view
    virtual
    returns (uint256 shares_);
```

### \_convertToAssets

```solidity
function _convertToAssets(uint256 shares_, Math.Rounding rounding_) internal view virtual returns (uint256 assets_);
```

### \_convertToExitAssets

```solidity
function _convertToExitAssets(
    uint256 shares_,
    Math.Rounding rounding_
)
    internal
    view
    virtual
    returns (uint256 assets_);
```
