# Pool

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/Pool.sol)

**Inherits:** [IPool](/docs/reference/interfaces/IPool.md), ERC20Permit

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

Deposits assets into the pool with the permit signature.

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

| Name        | Type      | Description                           |
| ----------- | --------- | ------------------------------------- |
| `assets_`   | `uint256` | The amount of assets to deposit.      |
| `receiver_` | `address` | The address of the receiver.          |
| `deadline_` | `uint256` | The deadline of the permit signature. |
| `v_`        | `uint8`   | The v of the permit signature.        |
| `r_`        | `bytes32` | The r of the permit signature.        |
| `s_`        | `bytes32` | The s of the permit signature.        |

**Returns**

| Name      | Type      | Description                                |
| --------- | --------- | ------------------------------------------ |
| `shares_` | `uint256` | The corresponding amount of shares minted. |

### mintWithPermit

Mints shares from the pool with the permit signature.

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

| Name         | Type      | Description                              |
| ------------ | --------- | ---------------------------------------- |
| `shares_`    | `uint256` | The amount of shares to mint.            |
| `receiver_`  | `address` | The address of the receiver.             |
| `maxAssets_` | `uint256` | The maximum amount of assets to deposit. |
| `deadline_`  | `uint256` | The deadline of the permit signature.    |
| `v_`         | `uint8`   | The v of the permit signature.           |
| `r_`         | `bytes32` | The r of the permit signature.           |
| `s_`         | `bytes32` | The s of the permit signature.           |

**Returns**

| Name      | Type      | Description                                   |
| --------- | --------- | --------------------------------------------- |
| `assets_` | `uint256` | The corresponding amount of assets deposited. |

### removeShares

Remove shares from the pool.

```solidity
function removeShares(uint256 shares_, address owner_) external override returns (uint256 sharesReturned_);
```

**Parameters**

| Name      | Type      | Description                     |
| --------- | --------- | ------------------------------- |
| `shares_` | `uint256` | The amount of shares to remove. |
| `owner_`  | `address` | The owner of the shares.        |

**Returns**

| Name              | Type      | Description                    |
| ----------------- | --------- | ------------------------------ |
| `sharesReturned_` | `uint256` | The amount of shares returned. |

### requestRedeem

Request the redemption of shares from the pool.

```solidity
function requestRedeem(uint256 shares_, address owner_) external override;
```

**Parameters**

| Name      | Type      | Description                     |
| --------- | --------- | ------------------------------- |
| `shares_` | `uint256` | The amount of shares to redeem. |
| `owner_`  | `address` | The owner of the shares.        |

### balanceOfAssets

Returns of the balance of the account.

```solidity
function balanceOfAssets(address account_) public view override returns (uint256 balanceOfAssets_);
```

**Parameters**

| Name       | Type      | Description                 |
| ---------- | --------- | --------------------------- |
| `account_` | `address` | The address of the account. |

**Returns**

| Name               | Type      | Description                    |
| ------------------ | --------- | ------------------------------ |
| `balanceOfAssets_` | `uint256` | assets\_ The amount of assets. |

### convertToExitAssets

Returns the amount of assets that can be withdrawn for the amount of shares.

```solidity
function convertToExitAssets(uint256 shares_) public view override returns (uint256 assets_);
```

**Parameters**

| Name      | Type      | Description           |
| --------- | --------- | --------------------- |
| `shares_` | `uint256` | The amount of shares. |

**Returns**

| Name      | Type      | Description           |
| --------- | --------- | --------------------- |
| `assets_` | `uint256` | The amount of assets. |

### convertToExitShares

Returns the amount of shares that will be burned to withdraw the amount of assets.

```solidity
function convertToExitShares(uint256 assets_) public view override returns (uint256 shares_);
```

**Parameters**

| Name      | Type      | Description                       |
| --------- | --------- | --------------------------------- |
| `assets_` | `uint256` | The amount of assets to withdraw. |

**Returns**

| Name      | Type      | Description           |
| --------- | --------- | --------------------- |
| `shares_` | `uint256` | The amount of shares. |

### unrealizedLosses

Returns the unrealized losses of the pool.

```solidity
function unrealizedLosses() public view override returns (uint256 unrealizedLosses_);
```

**Returns**

| Name                | Type      | Description            |
| ------------------- | --------- | ---------------------- |
| `unrealizedLosses_` | `uint256` | The unrealized losses. |

### deposit

Mints shares Vault shares to receiver by depositing exactly amount of underlying tokens.

*   MUST emit the Deposit event.
*   MAY support an additional flow in which the underlying tokens are owned by the Vault contract before the deposit
    execution, and are accounted for during deposit.
*   MUST revert if all of assets cannot be deposited (due to deposit limit being reached, slippage, the user not
    approving enough underlying tokens to the Vault contract, etc). 
    
NOTE: most implementations will require pre-approval of the Vault with the Vault’s underlying asset token.

```solidity
function deposit(uint256 assets, address receiver) public override returns (uint256 shares);
```

### mint

As opposed to [deposit](/contracts/Pool.sol/contract.Pool.md#deposit), minting is allowed even if the vault is in a
state where the price of a share is zero. In this case, the shares will be minted without requiring any assets to be
deposited.

*   MUST emit the Deposit event.
*   MAY support an additional flow in which the underlying tokens are owned by the Vault contract before the mint
    execution, and are accounted for during mint.
*   MUST revert if all of shares cannot be minted (due to deposit limit being reached, slippage, the user not approving
    enough underlying tokens to the Vault contract, etc).

NOTE: most implementations will require pre-approval of the Vault with the Vault’s underlying asset token.

```solidity
function mint(uint256 shares, address receiver) public override returns (uint256 assets);
```

### withdraw

Withdraw functions not implemented

*   MUST emit the Withdraw event.
*   MAY support an additional flow in which the underlying tokens are owned by the Vault contract before the withdraw
    execution, and are accounted for during withdraw.
*   MUST revert if all of assets cannot be withdrawn (due to withdrawal limit being reached, slippage, the owner not
    having enough shares, etc). Note that some implementations will require pre-requesting to the Vault before a
    withdrawal may be performed. Those methods should be performed separately.

```solidity
function withdraw(uint256 assets_, address receiver_, address owner_) public pure override returns (uint256 shares_);
```

### redeem

Burns exactly shares from owner and sends assets of underlying tokens to receiver.

*   MUST emit the Withdraw event.
*   MAY support an additional flow in which the underlying tokens are owned by the Vault contract before the redeem
    execution, and are accounted for during redeem.
*   MUST revert if all of shares cannot be redeemed (due to withdrawal limit being reached, slippage, the owner not
    having enough shares, etc). 
    
NOTE: some implementations will require pre-requesting to the Vault before a withdrawal may be performed. Those methods should be performed separately.

```solidity
function redeem(uint256 shares_, address receiver_, address owner_) public override returns (uint256 assets_);
```

### maxDeposit

Returns the maximum amount of the underlying asset that can be deposited into the Vault for the receiver, through a
deposit call.

*   MUST return a limited value if receiver is subject to some deposit limit.
*   MUST return 2 \*\* 256 - 1 if there is no limit on the maximum amount of assets that may be deposited.
*   MUST NOT revert.

```solidity
function maxDeposit(address receiver_) public view override returns (uint256 maxAssets_);
```

### maxMint

Returns the maximum amount of the Vault shares that can be minted for the receiver, through a mint call.

*   MUST return a limited value if receiver is subject to some mint limit.
*   MUST return 2 \*\* 256 - 1 if there is no limit on the maximum amount of shares that may be minted.
*   MUST NOT revert.

```solidity
function maxMint(address receiver_) public view override returns (uint256 maxShares_);
```

### maxWithdraw

Returns the maximum amount of the underlying asset that can be withdrawn from the owner balance in the Vault, through a
withdraw call.

*   MUST return a limited value if owner is subject to some withdrawal limit or timelock.
*   MUST NOT revert.

```solidity
function maxWithdraw(address owner_) public pure override returns (uint256 maxAssets_);
```

### maxRedeem

Returns the maximum amount of Vault shares that can be redeemed from the owner balance in the Vault, through a redeem
call.

*   MUST return a limited value if owner is subject to some withdrawal limit or timelock.
*   MUST return balanceOf(owner) if owner is not subject to any withdrawal limit or timelock.
*   MUST NOT revert.

```solidity
function maxRedeem(address owner_) public view override returns (uint256 maxShares_);
```

### previewWithdraw

Allows an on-chain or off-chain user to simulate the effects of their withdrawal at the current block, given current
on-chain conditions.

*   MUST return as close to and no fewer than the exact amount of Vault shares that would be burned in a withdraw call
    in the same transaction. I.e. withdraw should return the same or fewer shares as previewWithdraw if called in the
    same transaction.
*   MUST NOT account for withdrawal limits like those returned from maxWithdraw and should always act as though the
    withdrawal would be accepted, regardless if the user has enough shares, etc.
*   MUST be inclusive of withdrawal fees. Integrators should be aware of the existence of withdrawal fees.
*   MUST NOT revert. 

NOTE: any unfavorable discrepancy between convertToShares and previewWithdraw SHOULD be considered slippage in share price or some other type of condition, meaning the depositor will lose assets by depositing.

```solidity
function previewWithdraw(uint256 assets_) public pure override returns (uint256 shares_);
```

### previewRedeem

Allows an on-chain or off-chain user to simulate the effects of their redeemption at the current block, given current
on-chain conditions.

*   MUST return as close to and no more than the exact amount of assets that would be withdrawn in a redeem call in the
    same transaction. I.e. redeem should return the same or more assets as previewRedeem if called in the same
    transaction.
*   MUST NOT account for redemption limits like those returned from maxRedeem and should always act as though the
    redemption would be accepted, regardless if the user has enough shares, etc.
*   MUST be inclusive of withdrawal fees. Integrators should be aware of the existence of withdrawal fees.
*   MUST NOT revert.

NOTE: any unfavorable discrepancy between convertToAssets and previewRedeem SHOULD be considered slippage in share price or some other type of condition, meaning the depositor will lose assets by redeeming.

```solidity
function previewRedeem(uint256 shares_) public view override returns (uint256 assets_);
```

### convertToShares

Returns the amount of shares that the Vault would exchange for the amount of assets provided, in an ideal scenario where
all the conditions are met.


*   MUST NOT be inclusive of any fees that are charged against assets in the Vault.
*   MUST NOT show any variations depending on the caller.
*   MUST NOT reflect slippage or other on-chain conditions, when performing the actual exchange.
*   MUST NOT revert. 


NOTE: This calculation MAY NOT reflect the “per-user” price-per-share, and instead should reflect
    the “average-user’s” price-per-share, meaning what the average user should expect to see when exchanging to and
    from.

```solidity
function convertToShares(uint256 assets_) public view override returns (uint256 shares_);
```

### convertToAssets

Returns the amount of assets that the Vault would exchange for the amount of shares provided, in an ideal scenario where
all the conditions are met.

*   MUST NOT be inclusive of any fees that are charged against assets in the Vault.
*   MUST NOT show any variations depending on the caller.
*   MUST NOT reflect slippage or other on-chain conditions, when performing the actual exchange.
*   MUST NOT revert. NOTE: This calculation MAY 

NOT reflect the “per-user” price-per-share, and instead should reflect
    the “average-user’s” price-per-share, meaning what the average user should expect to see when exchanging to and
    from.

```solidity
function convertToAssets(uint256 shares_) public view override returns (uint256 assets_);
```

### previewDeposit

Allows an on-chain or off-chain user to simulate the effects of their deposit at the current block, given current
on-chain conditions.

*   MUST return as close to and no more than the exact amount of Vault shares that would be minted in a deposit call in
    the same transaction. I.e. deposit should return the same or more shares as previewDeposit if called in the same
    transaction.
*   MUST NOT account for deposit limits like those returned from maxDeposit and should always act as though the deposit
    would be accepted, regardless if the user has enough tokens approved, etc.
*   MUST be inclusive of deposit fees. Integrators should be aware of the existence of deposit fees.
*   MUST NOT revert. 

NOTE: any unfavorable discrepancy between convertToShares and previewDeposit SHOULD be considered
    slippage in share price or some other type of condition, meaning the depositor will lose assets by depositing.

```solidity
function previewDeposit(uint256 assets_) public view override returns (uint256 shares_);
```

### previewMint

Allows an on-chain or off-chain user to simulate the effects of their mint at the current block, given current on-chain
conditions.

*   MUST return as close to and no fewer than the exact amount of assets that would be deposited in a mint call in the
    same transaction. I.e. mint should return the same or fewer assets as previewMint if called in the same transaction.
*   MUST NOT account for mint limits like those returned from maxMint and should always act as though the mint would be
    accepted, regardless if the user has enough tokens approved, etc.
*   MUST be inclusive of deposit fees. Integrators should be aware of the existence of deposit fees.
*   MUST NOT revert. 

NOTE: any unfavorable discrepancy between convertToAssets and previewMint SHOULD be considered
    slippage in share price or some other type of condition, meaning the depositor will lose assets by minting.

```solidity
function previewMint(uint256 shares_) public view override returns (uint256 assets_);
```

### decimals

_Decimals are computed by adding the decimal offset on top of the underlying asset's decimals. This "original" value is
cached during construction of the vault contract. If this read operation fails (e.g., the asset has not been created
yet), a default of 18 is used to represent the underlying asset's decimals._

```solidity
function decimals() public view override(IERC20Metadata, ERC20) returns (uint8);
```

### asset

Returns the address of the underlying token used for the Vault for accounting, depositing, and withdrawing.

*   MUST be an ERC-20 token contract.
*   MUST NOT revert.

```solidity
function asset() public view override returns (address);
```

### totalAssets

Returns the total amount of the underlying asset that is “managed” by Vault.

*   SHOULD include any compounding that occurs from yield.
*   MUST be inclusive of any fees that are charged against assets in the Vault.
*   MUST NOT revert.

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
