# IsleGlobals

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference)

**Inherits:**
[IIsleGlobals](/docs/reference/interfaces/IIsleGlobals.md), [VersionedInitializable](/docs/reference/libraries/upgradability/VersionedInitializable.md), [Adminable](/docs/reference/abstracts/Adminable.md), UUPSUpgradeable

## State Variables

### ISLE_GLOBALS_REVISION

```solidity
uint256 public constant ISLE_GLOBALS_REVISION = 0x1;
```

### HUNDRED\_

```solidity
uint256 public constant HUNDRED_ = 1_000_000;
```

### protocolFee

```solidity
uint24 public override protocolFee;
```

### isleVault

```solidity
address public override isleVault;
```

### protocolPaused

```solidity
bool public override protocolPaused;
```

### isContractPaused

```solidity
mapping(address => bool) public override isContractPaused;
```

### isFunctionUnpaused

```solidity
mapping(address => mapping(bytes4 => bool)) public override isFunctionUnpaused;
```

### poolConfigurators

```solidity
mapping(address => Globals.PoolConfigurator) public override poolConfigurators;
```

### isPoolAdmin

```solidity
mapping(address => bool) public override isPoolAdmin;
```

### isCollateralAsset

```solidity
mapping(address => bool) public override isCollateralAsset;
```

### isPoolAsset

```solidity
mapping(address => bool) public override isPoolAsset;
```

## Functions

### \_authorizeUpgrade

```solidity
function _authorizeUpgrade(address newImplementation_) internal override onlyAdmin;
```

### getImplementation

```solidity
function getImplementation() external view override returns (address implementation_);
```

### getRevision

Returns the revision number of the contract

_Needs to be defined in the inherited class as a constant._

```solidity
function getRevision() internal pure virtual override returns (uint256 revision_);
```

**Returns**

| Name        | Type      | Description         |
| ----------- | --------- | ------------------- |
| `revision_` | `uint256` | The revision number |

### initialize

Initializes the contract

```solidity
function initialize(address governor_) external override initializer;
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `governor_` | `address` | The address of the governor |

### setIsleVault

Sets the address of the Isle vault.

```solidity
function setIsleVault(address vault_) external override onlyAdmin;
```

**Parameters**

| Name     | Type      | Description |
| -------- | --------- | ----------- |
| `vault_` | `address` |             |

### setProtocolPaused

Sets the protocol pause.

```solidity
function setProtocolPaused(bool protocolPaused_) external override onlyAdmin;
```

**Parameters**

| Name              | Type   | Description                                            |
| ----------------- | ------ | ------------------------------------------------------ |
| `protocolPaused_` | `bool` | A boolean indicating the status of the protocol pause. |

### setContractPaused

Sets the pause status of a specific contract

```solidity
function setContractPaused(address contract_, bool contractPaused_) external override onlyAdmin;
```

**Parameters**

| Name              | Type      | Description                                             |
| ----------------- | --------- | ------------------------------------------------------- |
| `contract_`       | `address` | The address of the contract to set the pause status for |
| `contractPaused_` | `bool`    | A boolean indicating the pause status of the contract   |

### setFunctionUnpaused

Sets the unpause status of a specific function in a contract

```solidity
function setFunctionUnpaused(address contract_, bytes4 sig_, bool functionUnpaused_) external override onlyAdmin;
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
function setProtocolFee(uint24 protocolFee_) external override onlyAdmin;
```

**Parameters**

| Name           | Type     | Description                          |
| -------------- | -------- | ------------------------------------ |
| `protocolFee_` | `uint24` | A uint24 indicating the protocol fee |

### setValidCollateralAsset

Sets the validity of a collateral asset.

```solidity
function setValidCollateralAsset(address collateralAsset_, bool isValid_) external override onlyAdmin;
```

**Parameters**

| Name               | Type      | Description                                                  |
| ------------------ | --------- | ------------------------------------------------------------ |
| `collateralAsset_` | `address` | The address of the collateral asset to set the validity for. |
| `isValid_`         | `bool`    | A boolean indicating the validity of the collateral asset.   |

### setValidPoolAsset

Sets the validity of the pool asset.

```solidity
function setValidPoolAsset(address poolAsset_, bool isValid_) external override onlyAdmin;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `poolAsset_` | `address` | The address of the pool asset to set the validity for. |
| `isValid_`   | `bool`    | A boolean indicating the validity of the pool asset.   |

### setValidPoolAdmin

Sets the validity of a pool admin.

```solidity
function setValidPoolAdmin(address poolAdmin_, bool isValid_) external override onlyAdmin;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `poolAdmin_` | `address` | The address of the pool admin to set the validity for. |
| `isValid_`   | `bool`    | A boolean indicating the validity of the pool admin.   |

### setMaxCoverLiquidation

Sets the max cover liquidation that is applied for the pool admin

```solidity
function setMaxCoverLiquidation(address poolConfigurator_, uint24 maxCoverLiquidation_) external override onlyAdmin;
```

**Parameters**

| Name                   | Type      | Description                                                  |
| ---------------------- | --------- | ------------------------------------------------------------ |
| `poolConfigurator_`    | `address` | The address of the pool admin                                |
| `maxCoverLiquidation_` | `uint24`  | The max cover liquidation as a percentage for the pool admin |

### setMinCover

Sets the min cover required for the pool admin.

```solidity
function setMinCover(address poolConfigurator_, uint104 minCover_) external override onlyAdmin;
```

**Parameters**

| Name                | Type      | Description                                |
| ------------------- | --------- | ------------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool admin.             |
| `minCover_`         | `uint104` | The min cover required for the pool admin. |

### setPoolLimit

Sets the pool limit for the pool configurator

```solidity
function setPoolLimit(address poolConfigurator_, uint104 poolLimit_) external override onlyAdmin;
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |
| `poolLimit_`        | `uint104` | The size limit of the pool           |

### governor

Returns the address of the governor

```solidity
function governor() external view override returns (address governor_);
```

**Returns**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `governor_` | `address` | The address of the governor |

### isFunctionPaused

Returns the pause status of a specific function in a contract

```solidity
function isFunctionPaused(address contract_, bytes4 sig_) public view override returns (bool functionIsPaused_);
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `contract_` | `address` | The address of the contract |
| `sig_`      | `bytes4`  | The function signature      |

**Returns**

| Name                | Type   | Description                                                              |
| ------------------- | ------ | ------------------------------------------------------------------------ |
| `functionIsPaused_` | `bool` | isFunctionPaused\_ A boolean indicating the pause status of the function |

### isFunctionPaused

Returns the pause status of a specific function in a contract

```solidity
function isFunctionPaused(bytes4 sig_) external view override returns (bool functionIsPaused_);
```

**Parameters**

| Name   | Type     | Description            |
| ------ | -------- | ---------------------- |
| `sig_` | `bytes4` | The function signature |

**Returns**

| Name                | Type   | Description                                                              |
| ------------------- | ------ | ------------------------------------------------------------------------ |
| `functionIsPaused_` | `bool` | isFunctionPaused\_ A boolean indicating the pause status of the function |

### maxCoverLiquidation

Returns the max cover liquidation as a percentage for the pool configurator

```solidity
function maxCoverLiquidation(address poolConfigurator_) external view override returns (uint24 maxCoverLiqduidation_);
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |

**Returns**

| Name                    | Type     | Description                                                                               |
| ----------------------- | -------- | ----------------------------------------------------------------------------------------- |
| `maxCoverLiqduidation_` | `uint24` | maxCoverLiquidation\_ The max cover liquidation as a percentage for the pool configurator |

### minCover

Returns the min cover required for a pool configurator

```solidity
function minCover(address poolConfigurator_) external view override returns (uint104 minCover_);
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
function poolLimit(address poolConfigurator_) external view override returns (uint104 poolLimit_);
```

**Parameters**

| Name                | Type      | Description                          |
| ------------------- | --------- | ------------------------------------ |
| `poolConfigurator_` | `address` | The address of the pool configurator |

**Returns**

| Name         | Type      | Description                                        |
| ------------ | --------- | -------------------------------------------------- |
| `poolLimit_` | `uint104` | The limit for the pool under the pool configurator |
