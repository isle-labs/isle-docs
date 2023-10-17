# IIsleGlobals

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

**Inherits:**
[IIsleGlobalsEvents](/docs/reference/interfaces/IIsleGlobalsEvents.md)

Interface for the IsleGlobals contract

This interface provides functions for managing the global settings of the Isle protocol

## Functions

### initialize

Initializes the contract

```solidity
function initialize(address governor_) external;
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `governor_` | `address` | The address of the governor |

### setIsleVault

Sets the address of the Isle vault.

```solidity
function setIsleVault(address isleVault_) external;
```

**Parameters**

| Name         | Type      | Description                    |
| ------------ | --------- | ------------------------------ |
| `isleVault_` | `address` | The address of the Isle vault. |

### setProtocolPaused

Sets the protocol pause.

```solidity
function setProtocolPaused(bool protocolPaused_) external;
```

**Parameters**

| Name              | Type   | Description                                            |
| ----------------- | ------ | ------------------------------------------------------ |
| `protocolPaused_` | `bool` | A boolean indicating the status of the protocol pause. |

### setContractPaused

Sets the pause status of a specific contract

```solidity
function setContractPaused(address contract_, bool contractPaused_) external;
```

**Parameters**

| Name              | Type      | Description                                             |
| ----------------- | --------- | ------------------------------------------------------- |
| `contract_`       | `address` | The address of the contract to set the pause status for |
| `contractPaused_` | `bool`    | A boolean indicating the pause status of the contract   |

### setFunctionUnpaused

Sets the unpause status of a specific function in a contract

```solidity
function setFunctionUnpaused(address contract_, bytes4 sig_, bool functionUnpaused_) external;
```

**Parameters**

| Name                | Type      | Description                                             |
| ------------------- | --------- | ------------------------------------------------------- |
| `contract_`         | `address` | The address of the contract                             |
| `sig_`              | `bytes4`  | The function signature                                  |
| `functionUnpaused_` | `bool`    | A boolean indicating the unpause status of the function |

### setProtocolFee

Sets the protocol fee

```solidity
function setProtocolFee(uint24 protocolFee_) external;
```

**Parameters**

| Name           | Type     | Description                          |
| -------------- | -------- | ------------------------------------ |
| `protocolFee_` | `uint24` | A uint24 indicating the protocol fee |

### setValidCollateralAsset

Sets the validity of a collateral asset.

```solidity
function setValidCollateralAsset(address collateralAsset_, bool isValid_) external;
```

**Parameters**

| Name               | Type      | Description                                                  |
| ------------------ | --------- | ------------------------------------------------------------ |
| `collateralAsset_` | `address` | The address of the collateral asset to set the validity for. |
| `isValid_`         | `bool`    | A boolean indicating the validity of the collateral asset.   |

### setValidPoolAsset

Sets the validity of the pool asset.

```solidity
function setValidPoolAsset(address poolAsset_, bool isValid_) external;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `poolAsset_` | `address` | The address of the pool asset to set the validity for. |
| `isValid_`   | `bool`    | A boolean indicating the validity of the pool asset.   |

### setValidPoolAdmin

Sets the validity of a pool admin.

```solidity
function setValidPoolAdmin(address poolAdmin_, bool isValid_) external;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `poolAdmin_` | `address` | The address of the pool admin to set the validity for. |
| `isValid_`   | `bool`    | A boolean indicating the validity of the pool admin.   |

### setMaxCoverLiquidation

Sets the max cover liquidation that is applied for the pool admin

```solidity
function setMaxCoverLiquidation(address poolConfigurator_, uint24 maxCoverLiquidation_) external;
```

**Parameters**

| Name                   | Type      | Description                                                  |
| ---------------------- | --------- | ------------------------------------------------------------ |
| `poolConfigurator_`    | `address` | The address of the pool admin                                |
| `maxCoverLiquidation_` | `uint24`  | The max cover liquidation as a percentage for the pool admin |

### setMinCover

Sets the min cover required for the pool admin.

```solidity
function setMinCover(address poolConfigurator_, uint104 minCover_) external;
```

**Parameters**

| Name                | Type      | Description                                |
| ------------------- | --------- | ------------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool admin.             |
| `minCover_`         | `uint104` | The min cover required for the pool admin. |

### setPoolLimit

Sets the pool limit for the pool configurator

```solidity
function setPoolLimit(address poolConfigurator_, uint104 poolLimit_) external;
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |
| `poolLimit_`        | `uint104` | The size limit of the pool           |

### protocolFee

Returns the protocol fee

```solidity
function protocolFee() external view returns (uint24 protocolFee_);
```

**Returns**

| Name           | Type     | Description                          |
| -------------- | -------- | ------------------------------------ |
| `protocolFee_` | `uint24` | A uint24 indicating the protocol fee |

### isleVault

Gets isle vault address.

```solidity
function isleVault() external view returns (address isleVault_);
```

**Returns**

| Name         | Type      | Description                    |
| ------------ | --------- | ------------------------------ |
| `isleVault_` | `address` | The address of the isle vault. |

### protocolPaused

Gets the status of the protocol pause.

```solidity
function protocolPaused() external view returns (bool protocolPaused_);
```

**Returns**

| Name              | Type   | Description                                            |
| ----------------- | ------ | ------------------------------------------------------ |
| `protocolPaused_` | `bool` | A boolean indicating the status of the protocol pause. |

### isContractPaused

Returns the pause status of a specific contract

```solidity
function isContractPaused(address contract_) external view returns (bool contractPaused_);
```

**Parameters**

| Name        | Type      | Description                          |
| ----------- | --------- | ------------------------------------ |
| `contract_` | `address` | The address of the contract to check |

**Returns**

| Name              | Type   | Description                                           |
| ----------------- | ------ | ----------------------------------------------------- |
| `contractPaused_` | `bool` | A boolean indicating the pause status of the contract |

### isFunctionUnpaused

Returns the unpause status of a specific function in a contract

```solidity
function isFunctionUnpaused(address contract_, bytes4 sig_) external view returns (bool functionUnpaused_);
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `contract_` | `address` | The address of the contract |
| `sig_`      | `bytes4`  | The function signature      |

**Returns**

| Name                | Type   | Description                                             |
| ------------------- | ------ | ------------------------------------------------------- |
| `functionUnpaused_` | `bool` | A boolean indicating the unpause status of the function |

### isCollateralAsset

Gets the validity of a collateral asset.

```solidity
function isCollateralAsset(address collateralAsset_) external view returns (bool isCollateralAsset_);
```

**Parameters**

| Name               | Type      | Description                                  |
| ------------------ | --------- | -------------------------------------------- |
| `collateralAsset_` | `address` | The address of the collateralAsset to query. |

**Returns**

| Name                 | Type   | Description                                                |
| -------------------- | ------ | ---------------------------------------------------------- |
| `isCollateralAsset_` | `bool` | A boolean indicating the validity of the collateral asset. |

### isPoolAsset

Gets the validity of a pool asset.

```solidity
function isPoolAsset(address poolAsset_) external view returns (bool isPoolAsset_);
```

**Parameters**

| Name         | Type      | Description                            |
| ------------ | --------- | -------------------------------------- |
| `poolAsset_` | `address` | The address of the poolAsset to query. |

**Returns**

| Name           | Type   | Description                                          |
| -------------- | ------ | ---------------------------------------------------- |
| `isPoolAsset_` | `bool` | A boolean indicating the validity of the pool asset. |

### governor

Returns the address of the governor

```solidity
function governor() external view returns (address governor_);
```

**Returns**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `governor_` | `address` | The address of the governor |

### getImplementation

Returns the address of the implementation contract

```solidity
function getImplementation() external view returns (address implementation_);
```

**Returns**

| Name              | Type      | Description                                |
| ----------------- | --------- | ------------------------------------------ |
| `implementation_` | `address` | The address of the implementation contract |

### isFunctionPaused

Returns the pause status of a specific function in a contract

```solidity
function isFunctionPaused(address contract_, bytes4 sig_) external view returns (bool isFunctionPaused_);
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `contract_` | `address` | The address of the contract |
| `sig_`      | `bytes4`  | The function signature      |

**Returns**

| Name                | Type   | Description                                           |
| ------------------- | ------ | ----------------------------------------------------- |
| `isFunctionPaused_` | `bool` | A boolean indicating the pause status of the function |

### isFunctionPaused

Returns the pause status of a specific function in the caller contract

```solidity
function isFunctionPaused(bytes4 sig_) external view returns (bool isFunctionPaused_);
```

**Parameters**

| Name   | Type     | Description            |
| ------ | -------- | ---------------------- |
| `sig_` | `bytes4` | The function signature |

**Returns**

| Name                | Type   | Description                                           |
| ------------------- | ------ | ----------------------------------------------------- |
| `isFunctionPaused_` | `bool` | A boolean indicating the pause status of the function |

### poolConfigurators

Returns the configuration info of a pool configurator

```solidity
function poolConfigurators(address poolConfigurator_)
    external
    view
    returns (uint24 maxCoverLiquidation_, uint104 minCover_, uint104 poolLimit_);
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |

**Returns**

| Name                   | Type      | Description                                                         |
| ---------------------- | --------- | ------------------------------------------------------------------- |
| `maxCoverLiquidation_` | `uint24`  | The max cover liquidation as a percentage for the pool configurator |
| `minCover_`            | `uint104` | The min cover required for the pool configurator                    |
| `poolLimit_`           | `uint104` | The limit for the pool under the pool configurator                  |

### isPoolAdmin

Returns if the account is a valid poolAdmin

```solidity
function isPoolAdmin(address account_) external view returns (bool isPoolAdmin_);
```

**Parameters**

| Name       | Type      | Description                         |
| ---------- | --------- | ----------------------------------- |
| `account_` | `address` | The address of the account to check |

**Returns**

| Name           | Type   | Description                              |
| -------------- | ------ | ---------------------------------------- |
| `isPoolAdmin_` | `bool` | Whether the account is a valid poolAdmin |

### maxCoverLiquidation

Returns the max cover liquidation as a percentage for the pool configurator

```solidity
function maxCoverLiquidation(address poolConfigurator_) external view returns (uint24 maxCoverLiquidation_);
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |

**Returns**

| Name                   | Type     | Description                                                         |
| ---------------------- | -------- | ------------------------------------------------------------------- |
| `maxCoverLiquidation_` | `uint24` | The max cover liquidation as a percentage for the pool configurator |

### minCover

Returns the min cover required for a pool configurator

```solidity
function minCover(address poolConfigurator_) external view returns (uint104 minCover_);
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |

**Returns**

| Name        | Type      | Description                                      |
| ----------- | --------- | ------------------------------------------------ |
| `minCover_` | `uint104` | The min cover required for the pool configurator |

### poolLimit

Returns the pool limit of the pool under the pool configurator

```solidity
function poolLimit(address poolConfigurator_) external view returns (uint104 poolLimit_);
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |

**Returns**

| Name         | Type      | Description                                        |
| ------------ | --------- | -------------------------------------------------- |
| `poolLimit_` | `uint104` | The limit for the pool under the pool configurator |
