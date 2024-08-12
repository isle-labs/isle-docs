# PoolConfigurator

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/PoolConfigurator.sol)

**Inherits:**
[VersionedInitializable](/docs/reference/libraries/upgradability/VersionedInitializable.md),
[IPoolConfigurator](/docs/reference/interfaces/IPoolConfigurator.md),
[PoolConfiguratorStorage](/docs/reference/PoolConfiguratorStorage.md)

See the documentation in {IPoolConfigurator}.

## State Variables

### HUNDRED_PERCENT

```solidity
uint256 public constant HUNDRED_PERCENT = 1_000_000;
```

### POOL_CONFIGURATOR_REVISION

```solidity
uint256 public constant POOL_CONFIGURATOR_REVISION = 0x1;
```

### ADDRESSES_PROVIDER

```solidity
IPoolAddressesProvider public immutable ADDRESSES_PROVIDER;
```

## Functions

### whenNotPaused

```solidity
modifier whenNotPaused();
```

### onlyAdminOrGovernor

```solidity
modifier onlyAdminOrGovernor();
```

### onlyGovernor

```solidity
modifier onlyGovernor();
```

### onlyAdmin

```solidity
modifier onlyAdmin();
```

### onlyPool

```solidity
modifier onlyPool();
```

### constructor

```solidity
constructor(IPoolAddressesProvider provider_);
```

### getRevision

Returns the revision number of the contract

_Needs to be defined in the inherited class as a constant._

```solidity
function getRevision() public pure virtual override returns (uint256 revision_);
```

**Returns**

| Name        | Type      | Description         |
| ----------- | --------- | ------------------- |
| `revision_` | `uint256` | The revision number |

### initialize

The initializer function for the pool configurator (must be called directly after deployment).

```solidity
function initialize(
    IPoolAddressesProvider provider_,
    address poolAdmin_,
    address asset_,
    string calldata name_,
    string calldata symbol_
)
    external
    override
    initializer;
```

**Parameters**

| Name         | Type                     | Description                                 |
| ------------ | ------------------------ | ------------------------------------------- |
| `provider_`  | `IPoolAddressesProvider` | The address of the pool addresses provider. |
| `poolAdmin_` | `address`                | The address of the pool admin.              |
| `asset_`     | `address`                | The ERC20 asset used in the lending pool.   |
| `name_`      | `string`                 | The name of the pool token.                 |
| `symbol_`    | `string`                 | The symbol of the pool token.               |

### transferAdmin

Transfers to a new admin.

```solidity
function transferAdmin(address newAdmin_) external virtual override onlyGovernor;
```

**Parameters**

| Name        | Type      | Description                   |
| ----------- | --------- | ----------------------------- |
| `newAdmin_` | `address` | The address of the new admin. |

### setBuyer

Assigns a buyer to the pool.

```solidity
function setBuyer(address buyer_) external override whenNotPaused onlyAdmin;
```

**Parameters**

| Name     | Type      | Description                             |
| -------- | --------- | --------------------------------------- |
| `buyer_` | `address` | The address of the buyer for this pool. |

### setValidSeller

Sets the status of a seller.

```solidity
function setValidSeller(address seller_, bool isValid_) external override whenNotPaused onlyAdmin;
```

**Parameters**

| Name       | Type      | Description                  |
| ---------- | --------- | ---------------------------- |
| `seller_`  | `address` | The address of the seller.   |
| `isValid_` | `bool`    | Whether the seller is valid. |

### setValidLender

Sets the status of a lender (liquidity providers).

```solidity
function setValidLender(address lender_, bool isValid_) external override whenNotPaused onlyAdmin;
```

**Parameters**

| Name       | Type      | Description                  |
| ---------- | --------- | ---------------------------- |
| `lender_`  | `address` | The address of the lender.   |
| `isValid_` | `bool`    | Whether the lender is valid. |

### setAdminFee

Sets the admin fee rate that would be applied to the pool.

```solidity
function setAdminFee(uint24 adminFee_) external override whenNotPaused onlyAdmin;
```

**Parameters**

| Name        | Type     | Description        |
| ----------- | -------- | ------------------ |
| `adminFee_` | `uint24` | The new admin fee. |

### setOpenToPublic

Sets whether the pool is open to the public (permissioned or permissionless).

```solidity
function setOpenToPublic(bool isOpenToPublic_) external override whenNotPaused onlyAdmin;
```

**Parameters**

| Name              | Type   | Description                             |
| ----------------- | ------ | --------------------------------------- |
| `isOpenToPublic_` | `bool` | Whether the pool is open to the public. |

### setMaxCoverLiquidation

Sets the max cover liquidation for the pool configurator.

```solidity
function setMaxCoverLiquidation(uint24 maxCoverLiquidation_) external override whenNotPaused onlyGovernor;
```

**Parameters**

| Name                   | Type     | Description                                                   |
| ---------------------- | -------- | ------------------------------------------------------------- |
| `maxCoverLiquidation_` | `uint24` | The max cover liquidation as a percentage for the pool admin. |

### setMinCover

Sets the min cover required for the pool configurator.

```solidity
function setMinCover(uint104 minCover_) external override whenNotPaused onlyGovernor;
```

**Parameters**

| Name        | Type      | Description                                |
| ----------- | --------- | ------------------------------------------ |
| `minCover_` | `uint104` | The min cover required for the pool admin. |

### setPoolLimit

Sets the pool limit for the pool configurator.

```solidity
function setPoolLimit(uint104 poolLimit_) external override whenNotPaused onlyGovernor;
```

**Parameters**

| Name         | Type      | Description                 |
| ------------ | --------- | --------------------------- |
| `poolLimit_` | `uint104` | The size limit of the pool. |

### requestFunds

Request funds from the pool and fund the loan manager.

```solidity
function requestFunds(uint256 principal_) external override whenNotPaused;
```

**Parameters**

| Name         | Type      | Description                         |
| ------------ | --------- | ----------------------------------- |
| `principal_` | `uint256` | The amount of principal to request. |

### triggerDefault

Triggers the defaults of a specific loan in the loan manager.

```solidity
function triggerDefault(uint16 loanId_) external override whenNotPaused onlyAdminOrGovernor;
```

**Parameters**

| Name      | Type     | Description                   |
| --------- | -------- | ----------------------------- |
| `loanId_` | `uint16` | The ID of the defaulted loan. |

### requestRedeem

Requests to redeem shares.

```solidity
function requestRedeem(uint256 shares_, address owner_) external override whenNotPaused onlyPool;
```

**Parameters**

| Name      | Type      | Description                     |
| --------- | --------- | ------------------------------- |
| `shares_` | `uint256` | The amount of shares to redeem. |
| `owner_`  | `address` | The owner of the shares.        |

### processRedeem

Processes the redemption of shares for a specific owner.

```solidity
function processRedeem(
    uint256 shares_,
    address owner_,
    address sender_
)
    external
    override
    whenNotPaused
    onlyPool
    returns (uint256 redeemableShares_, uint256 resultingAssets_);
```

**Parameters**

| Name      | Type      | Description                        |
| --------- | --------- | ---------------------------------- |
| `shares_` | `uint256` | The amount of shares to redeem.    |
| `owner_`  | `address` | The owner of the shares.           |
| `sender_` | `address` | The sender of the process request. |

**Returns**

| Name                | Type      | Description                                                    |
| ------------------- | --------- | -------------------------------------------------------------- |
| `redeemableShares_` | `uint256` | The amount of redeemable shares.                               |
| `resultingAssets_`  | `uint256` | The corresponding amount of assets with the redeemable shares. |

### removeShares

Removes shares from its withdrawal request.

```solidity
function removeShares(
    uint256 shares_,
    address owner_
)
    external
    override
    whenNotPaused
    onlyPool
    returns (uint256 sharesReturned_);
```

**Parameters**

| Name      | Type      | Description                                     |
| --------- | --------- | ----------------------------------------------- |
| `shares_` | `uint256` | The amount of shares to remove from withdrawal. |
| `owner_`  | `address` | The owner of the shares.                        |

**Returns**

| Name              | Type      | Description                    |
| ----------------- | --------- | ------------------------------ |
| `sharesReturned_` | `uint256` | The amount of shares returned. |

### depositCover

Pool admin deposits pool cover.

```solidity
function depositCover(uint256 amount_) external override whenNotPaused;
```

**Parameters**

| Name      | Type      | Description                                          |
| --------- | --------- | ---------------------------------------------------- |
| `amount_` | `uint256` | The amount of assets to deposit as first-loss cover. |

### withdrawCover

Pool admin withdraws from pool cover.

```solidity
function withdrawCover(uint256 amount_, address recipient_) external override whenNotPaused onlyAdmin;
```

**Parameters**

| Name         | Type      | Description                                             |
| ------------ | --------- | ------------------------------------------------------- |
| `amount_`    | `uint256` | The amount of assets to withdraw from first-loss cover. |
| `recipient_` | `address` | The address of the recipient.                           |

### openToPublic

Returns whether the pool is open to public.

```solidity
function openToPublic() external view override returns (bool openToPublic_);
```

**Returns**

| Name            | Type   | Description                         |
| --------------- | ------ | ----------------------------------- |
| `openToPublic_` | `bool` | Whether the pool is open to public. |

### adminFee

Returns the admin fee of the pool.

```solidity
function adminFee() external view override returns (uint24 adminFee_);
```

**Returns**

| Name        | Type     | Description                |
| ----------- | -------- | -------------------------- |
| `adminFee_` | `uint24` | The admin fee of the pool. |

### maxCoverLiquidation

Returns the max cover liquidation of the pool.

```solidity
function maxCoverLiquidation() external view returns (uint24 maxCoverLiquidation_);
```

**Returns**

| Name                   | Type     | Description                            |
| ---------------------- | -------- | -------------------------------------- |
| `maxCoverLiquidation_` | `uint24` | The max cover liquidation of the pool. |

### minCover

Returns the min cover required for the pool configurator.

```solidity
function minCover() external view returns (uint104 minCover_);
```

**Returns**

| Name        | Type      | Description                                |
| ----------- | --------- | ------------------------------------------ |
| `minCover_` | `uint104` | The min cover required for the pool admin. |

### poolLimit

Returns the pool limit of the pool configurator.

```solidity
function poolLimit() external view returns (uint104 poolLimit_);
```

**Returns**

| Name         | Type      | Description                 |
| ------------ | --------- | --------------------------- |
| `poolLimit_` | `uint104` | The size limit of the pool. |

### maxDeposit

Returns the max deposit amount of a receiver.

```solidity
function maxDeposit(address receiver_) external view virtual override returns (uint256 maxAssets_);
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `receiver_` | `address` | The address of the receiver. |

**Returns**

| Name         | Type      | Description                                     |
| ------------ | --------- | ----------------------------------------------- |
| `maxAssets_` | `uint256` | The max amount of assets that can be deposited. |

### maxMint

Returns the max mint amount of a receiver.

```solidity
function maxMint(address receiver_) external view virtual override returns (uint256 maxShares_);
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `receiver_` | `address` | The address of the receiver. |

**Returns**

| Name         | Type      | Description                                  |
| ------------ | --------- | -------------------------------------------- |
| `maxShares_` | `uint256` | The max amount of shares that can be minted. |

### maxRedeem

Returns the max redeem amount of an owner.

```solidity
function maxRedeem(address owner_) external view virtual override returns (uint256 maxShares_);
```

**Parameters**

| Name     | Type      | Description               |
| -------- | --------- | ------------------------- |
| `owner_` | `address` | The address of the owner. |

**Returns**

| Name         | Type      | Description                                    |
| ------------ | --------- | ---------------------------------------------- |
| `maxShares_` | `uint256` | The max amount of shares that can be redeemed. |

### previewRedeem

Previews the amount of assets that can be redeemed for the amount of shares specified.

```solidity
function previewRedeem(address owner_, uint256 shares_) external view virtual override returns (uint256 assets_);
```

**Parameters**

| Name      | Type      | Description                     |
| --------- | --------- | ------------------------------- |
| `owner_`  | `address` | The address of the owner.       |
| `shares_` | `uint256` | The amount of shares to redeem. |

**Returns**

| Name      | Type      | Description                                  |
| --------- | --------- | -------------------------------------------- |
| `assets_` | `uint256` | The amount of assets that would be received. |

### totalAssets

Returns the total amount of assets in the pool.

```solidity
function totalAssets() external view override returns (uint256 totalAssets_);
```

**Returns**

| Name           | Type      | Description                             |
| -------------- | --------- | --------------------------------------- |
| `totalAssets_` | `uint256` | The total amount of assets in the pool. |

### hasSufficientCover

Returns whether the pool currently has sufficient cover.

```solidity
function hasSufficientCover() external view override returns (bool hasSufficientCover_);
```

**Returns**

| Name                  | Type   | Description                                      |
| --------------------- | ------ | ------------------------------------------------ |
| `hasSufficientCover_` | `bool` | Whether the pool currently has sufficient cover. |

### unrealizedLosses

Returns the current amount of unrealized losses of the pool.

```solidity
function unrealizedLosses() external view override returns (uint256 unrealizedLosses_);
```

**Returns**

| Name                | Type      | Description                                          |
| ------------------- | --------- | ---------------------------------------------------- |
| `unrealizedLosses_` | `uint256` | The current amount of unrealized losses of the pool. |

### \_totalAssets

```solidity
function _totalAssets() internal view returns (uint256 totalAssets_);
```

### \_revertIfPaused

```solidity
function _revertIfPaused() internal view;
```

### \_revertIfNotAdmin

```solidity
function _revertIfNotAdmin() internal view;
```

### \_revertIfNotAdminOrGovernor

```solidity
function _revertIfNotAdminOrGovernor() internal view;
```

### \_revertIfNotGovernor

```solidity
function _revertIfNotGovernor() internal view;
```

### \_revertIfNotPool

```solidity
function _revertIfNotPool() internal view;
```

### \_hasSufficientCover

```solidity
function _hasSufficientCover() internal view returns (bool hasSufficientCover_);
```

### \_handleCover

```solidity
function _handleCover(uint256 losses_) internal;
```

### \_min

```solidity
function _min(uint256 a_, uint256 b_) internal pure returns (uint256 min_);
```

### \_getMaxAssets

```solidity
function _getMaxAssets(address receiver_, uint256 totalAssets_) internal view returns (uint256 maxAssets_);
```

### \_globals

```solidity
function _globals() internal view returns (IIsleGlobals globals_);
```

### \_loanManager

```solidity
function _loanManager() internal view returns (ILoanManager loanManager_);
```

### \_withdrawalManager

```solidity
function _withdrawalManager() internal view returns (IWithdrawalManager withdrawalManager_);
```
