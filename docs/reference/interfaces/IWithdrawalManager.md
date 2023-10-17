# IWithdrawalManager

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

**Inherits:**
[IWithdrawalManagerStorage](/docs/reference/interfaces/IWithdrawalManagerStorage.md)

## Functions

### initialize

Initializes the Withdrawal Manager.

_Function is invoked by the proxy contract when the Withdrawal Manager Contract is added to the
PoolAddressesProvider of the market_

```solidity
function initialize(IPoolAddressesProvider provider_, uint256 cycleDuration_, uint256 windowDuration_) external;
```

**Parameters**

| Name              | Type                     | Description                              |
| ----------------- | ------------------------ | ---------------------------------------- |
| `provider_`       | `IPoolAddressesProvider` | The address of the PoolAddressesProvider |
| `cycleDuration_`  | `uint256`                | The total duration of a withdrawal cycle |
| `windowDuration_` | `uint256`                | The duration of the withdrawal window    |

### setExitConfig

Pool admin sets a new configuration for the withdrawal manager

```solidity
function setExitConfig(uint256 cycleDuration_, uint256 windowDuration_) external;
```

**Parameters**

| Name              | Type      | Description                               |
| ----------------- | --------- | ----------------------------------------- |
| `cycleDuration_`  | `uint256` | The total duration of a withdrawal cycle  |
| `windowDuration_` | `uint256` | The total duration of a withdrawal window |

### addShares

Add more shares for withdrawal

```solidity
function addShares(uint256 shares_, address owner_) external;
```

**Parameters**

| Name      | Type      | Description                 |
| --------- | --------- | --------------------------- |
| `shares_` | `uint256` | The amount of shares to add |
| `owner_`  | `address` | The owner of the shares     |

### removeShares

Remove shares from withdrawal

```solidity
function removeShares(uint256 shares_, address owner_) external returns (uint256 sharesReturned_);
```

**Parameters**

| Name      | Type      | Description                                    |
| --------- | --------- | ---------------------------------------------- |
| `shares_` | `uint256` | The amount of shares to remove from withdrawal |
| `owner_`  | `address` | The owner of the shares                        |

### processExit

Process the exit of requested shares of a owner

```solidity
function processExit(
    uint256 requestedShares_,
    address owner_
)
    external
    returns (uint256 redeemableShares_, uint256 resultingAssets_);
```

### isInExitWindow

Checks if the owner has a withdrawal request in the exit window

```solidity
function isInExitWindow(address owner_) external view returns (bool isInExitWindow_);
```

**Parameters**

| Name     | Type      | Description                |
| -------- | --------- | -------------------------- |
| `owner_` | `address` | The owner address to check |

**Returns**

| Name              | Type   | Description                                                   |
| ----------------- | ------ | ------------------------------------------------------------- |
| `isInExitWindow_` | `bool` | True if the owner has a withdrawal request in the exit window |

### lockedLiquidity

Gets the total amount of liquidity locked in the current cycle

```solidity
function lockedLiquidity() external view returns (uint256 lockedLiquidity_);
```

**Returns**

| Name               | Type      | Description                                               |
| ------------------ | --------- | --------------------------------------------------------- |
| `lockedLiquidity_` | `uint256` | The total amount of liquidity locked in the current cycle |

### previewRedeem

Previews the amount of shares and assets that can be redeemed

```solidity
function previewRedeem(
    address owner_,
    uint256 shares_
)
    external
    view
    returns (uint256 redeemableShares_, uint256 resultingAssets_);
```

**Parameters**

| Name      | Type      | Description                    |
| --------- | --------- | ------------------------------ |
| `owner_`  | `address` | The owner of the shares        |
| `shares_` | `uint256` | The amount of shares to redeem |

**Returns**

| Name                | Type      | Description                                                   |
| ------------------- | --------- | ------------------------------------------------------------- |
| `redeemableShares_` | `uint256` | The amount of redeemable shares                               |
| `resultingAssets_`  | `uint256` | The corresponding amount of assets with the redeemable shares |

### getCycleConfig

Gets the configuration of a config id

```solidity
function getCycleConfig(uint256 configId_) external view returns (WithdrawalManager.CycleConfig memory config_);
```

**Parameters**

| Name        | Type      | Description          |
| ----------- | --------- | -------------------- |
| `configId_` | `uint256` | The id of the config |

**Returns**

| Name      | Type                            | Description |
| --------- | ------------------------------- | ----------- |
| `config_` | `WithdrawalManager.CycleConfig` | The config  |

### getConfigAtId

Gets the configuration of a given cycle id

```solidity
function getConfigAtId(uint256 cycleId_) external view returns (WithdrawalManager.CycleConfig memory config_);
```

**Parameters**

| Name       | Type      | Description  |
| ---------- | --------- | ------------ |
| `cycleId_` | `uint256` | The cycle id |

**Returns**

| Name      | Type                            | Description                            |
| --------- | ------------------------------- | -------------------------------------- |
| `config_` | `WithdrawalManager.CycleConfig` | The configuration used at the cycle id |

### getCurrentConfig

Gets the configuration of the current cycle id

```solidity
function getCurrentConfig() external view returns (WithdrawalManager.CycleConfig memory config_);
```

**Returns**

| Name      | Type                            | Description                                    |
| --------- | ------------------------------- | ---------------------------------------------- |
| `config_` | `WithdrawalManager.CycleConfig` | The configuration used at the current cycle id |

### getCurrentCycleId

Gets the current cycle id

```solidity
function getCurrentCycleId() external view returns (uint256 cycleId_);
```

**Returns**

| Name       | Type      | Description                 |
| ---------- | --------- | --------------------------- |
| `cycleId_` | `uint256` | The id of the current cycle |

### getWindowStart

Gets the starting time of a window for a given cycle id

```solidity
function getWindowStart(uint256 cycleId_) external view returns (uint64 windowStart_);
```

**Parameters**

| Name       | Type      | Description         |
| ---------- | --------- | ------------------- |
| `cycleId_` | `uint256` | The id of the cycle |

**Returns**

| Name           | Type     | Description                     |
| -------------- | -------- | ------------------------------- |
| `windowStart_` | `uint64` | The starting time of the window |

### getWindowAtId

Gets the start and end time of a window for a given cycle id

```solidity
function getWindowAtId(uint256 cycleId_) external view returns (uint64 windowStart_, uint64 windowEnd_);
```

**Parameters**

| Name       | Type      | Description         |
| ---------- | --------- | ------------------- |
| `cycleId_` | `uint256` | The id of the cycle |

**Returns**

| Name           | Type     | Description                     |
| -------------- | -------- | ------------------------------- |
| `windowStart_` | `uint64` | The starting time of the window |
| `windowEnd_`   | `uint64` | The ending time of the window   |

### getRedeemableAmounts

Gets the redeemable amount of an owner based in the current cycle

```solidity
function getRedeemableAmounts(
    uint256 lockedShares_,
    address owner_
)
    external
    view
    returns (uint256 redeemableShares_, uint256 resultingAssets_, bool partialLiquidity_);
```

**Parameters**

| Name            | Type      | Description                                 |
| --------------- | --------- | ------------------------------------------- |
| `lockedShares_` | `uint256` | The amount of locked shares under the owner |
| `owner_`        | `address` | The address of the owner                    |

**Returns**

| Name                | Type      | Description                                                   |
| ------------------- | --------- | ------------------------------------------------------------- |
| `redeemableShares_` | `uint256` | The amount of redeemable shares                               |
| `resultingAssets_`  | `uint256` | The corresponding amount of assets with the redeemable shares |
| `partialLiquidity_` | `bool`    | True if there is only partial liquidity                       |

## Events

### Initialized

Emitted when a withdrawal manager is initialized

```solidity
event Initialized(address poolAddressesProvider_, uint256 cycleDuration_, uint256 windowDuration_);
```

### ConfigurationUpdated

Emitted when the configuration of the withdrawal manager is updated

```solidity
event ConfigurationUpdated(
    uint256 indexed configId_,
    uint64 initialCycleId_,
    uint64 initialCycleTime_,
    uint64 cycleDuration_,
    uint64 windowDuration_
);
```

### WithdrawalCancelled

Emitted when a withdrawal is cancelled

```solidity
event WithdrawalCancelled(address indexed account_);
```

### WithdrawalProcessed

Emitted when a withdrawal is processed

```solidity
event WithdrawalProcessed(address indexed account_, uint256 sharesToRedeem_, uint256 assetsToWithdraw_);
```

### WithdrawalUpdated

Emitted when a withdrawal is updated

```solidity
event WithdrawalUpdated(address indexed account_, uint256 lockedShares_, uint64 windowStart_, uint64 windowEnd_);
```
