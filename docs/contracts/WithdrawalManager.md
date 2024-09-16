# WithdrawalManager

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/WithdrawalManager.sol)

**Inherits:** [WithdrawalManagerStorage](/docs/reference/WithdrawalManagerStorage.md),
[IWithdrawalManager](/docs/reference/interfaces/IWithdrawalManager.md),
[VersionedInitializable](/docs/reference/libraries/upgradability/VersionedInitializable.md)

## State Variables

### WITHDRAWAL_MANAGER_REVISION

```solidity
uint256 public constant WITHDRAWAL_MANAGER_REVISION = 0x1;
```

### ADDRESSES_PROVIDER

```solidity
IPoolAddressesProvider public immutable ADDRESSES_PROVIDER;
```

## Functions

### onlyPoolAdmin

```solidity
modifier onlyPoolAdmin();
```

### onlyPoolConfigurator

```solidity
modifier onlyPoolConfigurator();
```

### whenProtocolNotPaused

```solidity
modifier whenProtocolNotPaused();
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

### constructor

```solidity
constructor(IPoolAddressesProvider provider_);
```

### initialize

Initializes the Withdrawal Manager.

_Function is invoked by the proxy contract when the Withdrawal Manager Contract is added to the PoolAddressesProvider of
the market._

```solidity
function initialize(
    IPoolAddressesProvider provider_,
    uint256 cycleDuration_,
    uint256 windowDuration_
)
    external
    override
    initializer;
```

**Parameters**

| Name              | Type                     | Description                               |
| ----------------- | ------------------------ | ----------------------------------------- |
| `provider_`       | `IPoolAddressesProvider` | The address of the PoolAddressesProvider. |
| `cycleDuration_`  | `uint256`                | The total duration of a withdrawal cycle. |
| `windowDuration_` | `uint256`                | The duration of the withdrawal window.    |

### setExitConfig

Pool admin sets a new configuration for the withdrawal manager.

```solidity
function setExitConfig(uint256 cycleDuration_, uint256 windowDuration_) external override whenProtocolNotPaused;
```

**Parameters**

| Name              | Type      | Description                                |
| ----------------- | --------- | ------------------------------------------ |
| `cycleDuration_`  | `uint256` | The total duration of a withdrawal cycle.  |
| `windowDuration_` | `uint256` | The total duration of a withdrawal window. |

### addShares

Add more shares for withdrawal.

```solidity
function addShares(uint256 shares_, address owner_) external override onlyPoolConfigurator;
```

**Parameters**

| Name      | Type      | Description                  |
| --------- | --------- | ---------------------------- |
| `shares_` | `uint256` | The amount of shares to add. |
| `owner_`  | `address` | The owner of the shares.     |

### removeShares

Remove shares from withdrawal.

```solidity
function removeShares(
    uint256 shares_,
    address owner_
)
    external
    override
    onlyPoolConfigurator
    returns (uint256 sharesReturned_);
```

**Parameters**

| Name      | Type      | Description                                     |
| --------- | --------- | ----------------------------------------------- |
| `shares_` | `uint256` | The amount of shares to remove from withdrawal. |
| `owner_`  | `address` | The owner of the shares.                        |

### processExit

Process the exit of requested shares of a owner.

```solidity
function processExit(
    uint256 requestedShares_,
    address owner_
)
    external
    override
    onlyPoolConfigurator
    returns (uint256 redeemableShares_, uint256 resultingAssets_);
```

**Parameters**

| Name               | Type      | Description                     |
| ------------------ | --------- | ------------------------------- |
| `requestedShares_` | `uint256` | The amount of shares to redeem. |
| `owner_`           | `address` | The owner of the shares.        |

**Returns**

| Name                | Type      | Description                                                    |
| ------------------- | --------- | -------------------------------------------------------------- |
| `redeemableShares_` | `uint256` | The amount of redeemable shares.                               |
| `resultingAssets_`  | `uint256` | The corresponding amount of assets with the redeemable shares. |

### isInExitWindow

Checks if the owner has a withdrawal request in the exit window.

```solidity
function isInExitWindow(address owner_) external view override returns (bool isInExitWindow_);
```

**Parameters**

| Name     | Type      | Description                 |
| -------- | --------- | --------------------------- |
| `owner_` | `address` | The owner address to check. |

**Returns**

| Name              | Type   | Description                                                    |
| ----------------- | ------ | -------------------------------------------------------------- |
| `isInExitWindow_` | `bool` | True if the owner has a withdrawal request in the exit window. |

### lockedLiquidity

Gets the total amount of liquidity locked in the current cycle.

```solidity
function lockedLiquidity() external view override returns (uint256 lockedLiquidity_);
```

**Returns**

| Name               | Type      | Description                                                |
| ------------------ | --------- | ---------------------------------------------------------- |
| `lockedLiquidity_` | `uint256` | The total amount of liquidity locked in the current cycle. |

### previewRedeem

Previews the amount of shares and assets that can be redeemed.

```solidity
function previewRedeem(
    address owner_,
    uint256 shares_
)
    external
    view
    override
    returns (uint256 redeemableShares_, uint256 resultingAssets_);
```

**Parameters**

| Name      | Type      | Description                     |
| --------- | --------- | ------------------------------- |
| `owner_`  | `address` | The owner of the shares.        |
| `shares_` | `uint256` | The amount of shares to redeem. |

**Returns**

| Name                | Type      | Description                                                    |
| ------------------- | --------- | -------------------------------------------------------------- |
| `redeemableShares_` | `uint256` | The amount of redeemable shares.                               |
| `resultingAssets_`  | `uint256` | The corresponding amount of assets with the redeemable shares. |

### getCycleConfig

Gets the configuration of a config id.

```solidity
function getCycleConfig(uint256 configId_) public view override returns (WM.CycleConfig memory config_);
```

**Parameters**

| Name        | Type      | Description           |
| ----------- | --------- | --------------------- |
| `configId_` | `uint256` | The id of the config. |

**Returns**

| Name      | Type             | Description |
| --------- | ---------------- | ----------- |
| `config_` | `WM.CycleConfig` | The config. |

### getConfigAtId

Gets the configuration of a given cycle id.

```solidity
function getConfigAtId(uint256 cycleId_) public view override returns (WM.CycleConfig memory config_);
```

**Parameters**

| Name       | Type      | Description   |
| ---------- | --------- | ------------- |
| `cycleId_` | `uint256` | The cycle id. |

**Returns**

| Name      | Type             | Description                             |
| --------- | ---------------- | --------------------------------------- |
| `config_` | `WM.CycleConfig` | The configuration used at the cycle id. |

### getCurrentConfig

Gets the configuration of the current cycle id.

```solidity
function getCurrentConfig() public view override returns (WM.CycleConfig memory config_);
```

**Returns**

| Name      | Type             | Description                                     |
| --------- | ---------------- | ----------------------------------------------- |
| `config_` | `WM.CycleConfig` | The configuration used at the current cycle id. |

### getCurrentCycleId

Gets the current cycle id.

```solidity
function getCurrentCycleId() public view override returns (uint256 cycleId_);
```

**Returns**

| Name       | Type      | Description                  |
| ---------- | --------- | ---------------------------- |
| `cycleId_` | `uint256` | The id of the current cycle. |

### getWindowStart

Gets the starting time of a window for a given cycle id.

```solidity
function getWindowStart(uint256 cycleId_) public view override returns (uint64 windowStart_);
```

**Parameters**

| Name       | Type      | Description          |
| ---------- | --------- | -------------------- |
| `cycleId_` | `uint256` | The id of the cycle. |

**Returns**

| Name           | Type     | Description                      |
| -------------- | -------- | -------------------------------- |
| `windowStart_` | `uint64` | The starting time of the window. |

### getWindowAtId

Gets the start and end time of a window for a given cycle id.

```solidity
function getWindowAtId(uint256 cycleId_) public view override returns (uint64 windowStart_, uint64 windowEnd_);
```

**Parameters**

| Name       | Type      | Description          |
| ---------- | --------- | -------------------- |
| `cycleId_` | `uint256` | The id of the cycle. |

**Returns**

| Name           | Type     | Description                      |
| -------------- | -------- | -------------------------------- |
| `windowStart_` | `uint64` | The starting time of the window. |
| `windowEnd_`   | `uint64` | The ending time of the window.   |

### getRedeemableAmounts

```solidity
function getRedeemableAmounts(
    uint256 lockedShares_,
    address owner_
)
    public
    view
    override
    returns (uint256 redeemableShares_, uint256 resultingAssets_, bool partialLiquidity_);
```

### \_poolConfigurator

```solidity
function _poolConfigurator() internal view returns (address poolConfigurator_);
```

### \_poolAdmin

```solidity
function _poolAdmin() internal view returns (address poolAdmin_);
```

### \_globals

```solidity
function _globals() internal view returns (address globals_);
```

### \_asset

```solidity
function _asset() internal view returns (address asset_);
```

### \_pool

```solidity
function _pool() internal view returns (address pool_);
```

### \_emitUpdate

```solidity
function _emitUpdate(address account_, uint256 lockedShares_, uint256 exitCycleId_) internal;
```

### \_emitProcess

```solidity
function _emitProcess(address account_, uint256 sharesToRedeem_, uint256 assetsToWithdraw_) internal;
```

### \_revertIfNotPoolAdmin

```solidity
function _revertIfNotPoolAdmin() internal view;
```

### \_revertIfNotPoolConfigurator

```solidity
function _revertIfNotPoolConfigurator() internal view;
```
