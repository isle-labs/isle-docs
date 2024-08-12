# IsleGlobals

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/IsleGlobals.sol)

**Inherits:** [IIsleGlobals](/docs/reference/interfaces/IIsleGlobals.md),
[VersionedInitializable](/docs/reference/libraries/upgradability/VersionedInitializable.md),
[Governable](/docs/reference/abstracts/Governable.md), UUPSUpgradeable

## State Variables

### ISLE_GLOBALS_REVISION

```solidity
uint256 private constant ISLE_GLOBALS_REVISION = 0x1;
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

### isPoolAdmin

```solidity
mapping(address => bool) public override isPoolAdmin;
```

### isReceivableAsset

```solidity
mapping(address => bool) public override isReceivableAsset;
```

### isPoolAsset

```solidity
mapping(address => bool) public override isPoolAsset;
```

## Functions

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

### \_authorizeUpgrade

```solidity
function _authorizeUpgrade(address newImplementation_) internal override onlyGovernor;
```

### initialize

Initializes the contract.

```solidity
function initialize(address governor_) external override initializer;
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `governor_` | `address` | The address of the governor. |

### setIsleVault

Sets the address of the Isle vault.

```solidity
function setIsleVault(address vault_) external override onlyGovernor;
```

**Parameters**

| Name     | Type      | Description                    |
| -------- | --------- | ------------------------------ |
| `vault_` | `address` | The address of the Isle vault. |

### setProtocolPaused

Pause or unpause the protocol.

```solidity
function setProtocolPaused(bool protocolPaused_) external override onlyGovernor;
```

**Parameters**

| Name              | Type   | Description                                            |
| ----------------- | ------ | ------------------------------------------------------ |
| `protocolPaused_` | `bool` | A boolean indicating the status of the protocol pause. |

### setContractPaused

Pause or unpause a specific contract.

```solidity
function setContractPaused(address contract_, bool contractPaused_) external override onlyGovernor;
```

**Parameters**

| Name              | Type      | Description                                              |
| ----------------- | --------- | -------------------------------------------------------- |
| `contract_`       | `address` | The address of the contract to set the pause status for. |
| `contractPaused_` | `bool`    | A boolean indicating the pause status of the contract.   |

### setFunctionUnpaused

Unpause or ununpause a specific function in a contract.

```solidity
function setFunctionUnpaused(address contract_, bytes4 sig_, bool functionUnpaused_) external override onlyGovernor;
```

**Parameters**

| Name                | Type      | Description                                            |
| ------------------- | --------- | ------------------------------------------------------ |
| `contract_`         | `address` | The address of the contract.                           |
| `sig_`              | `bytes4`  | The function signature.                                |
| `functionUnpaused_` | `bool`    | A boolean indicating whether the function is unpaused. |

### setProtocolFee

Sets the protocol fee.

```solidity
function setProtocolFee(uint24 protocolFee_) external override onlyGovernor;
```

**Parameters**

| Name           | Type     | Description                                                                   |
| -------------- | -------- | ----------------------------------------------------------------------------- |
| `protocolFee_` | `uint24` | A uint24 indicating the protocol fee (100.0000% = 1e6 (6 decimal precision)). |

### setValidReceivableAsset

Sets the validity of a receivable asset (should match ERC-721).

```solidity
function setValidReceivableAsset(address receivableAsset_, bool isValid_) external override onlyGovernor;
```

**Parameters**

| Name               | Type      | Description                                                  |
| ------------------ | --------- | ------------------------------------------------------------ |
| `receivableAsset_` | `address` | The address of the receivable asset to set the validity for. |
| `isValid_`         | `bool`    | A boolean indicating the validity of the receivable asset.   |

### setValidPoolAsset

Sets the validity of the pool asset (should match ERC-20).

```solidity
function setValidPoolAsset(address poolAsset_, bool isValid_) external override onlyGovernor;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `poolAsset_` | `address` | The address of the pool asset to set the validity for. |
| `isValid_`   | `bool`    | A boolean indicating the validity of the pool asset.   |

### setValidPoolAdmin

Sets the validity of a pool admin.

```solidity
function setValidPoolAdmin(address poolAdmin_, bool isValid_) external override onlyGovernor;
```

**Parameters**

| Name         | Type      | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| `poolAdmin_` | `address` | The address of the pool admin to set the validity for. |
| `isValid_`   | `bool`    | A boolean indicating the validity of the pool admin.   |

### isFunctionPaused

Returns the pause status of a specific function in a contract.

```solidity
function isFunctionPaused(address contract_, bytes4 sig_) public view override returns (bool functionIsPaused_);
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `contract_` | `address` | The address of the contract. |
| `sig_`      | `bytes4`  | The function signature.      |

**Returns**

| Name                | Type   | Description                                                               |
| ------------------- | ------ | ------------------------------------------------------------------------- |
| `functionIsPaused_` | `bool` | isFunctionPaused\_ A boolean indicating the pause status of the function. |

### isFunctionPaused

Returns the pause status of a specific function in a contract.

```solidity
function isFunctionPaused(bytes4 sig_) external view override returns (bool functionIsPaused_);
```

**Parameters**

| Name   | Type     | Description             |
| ------ | -------- | ----------------------- |
| `sig_` | `bytes4` | The function signature. |

**Returns**

| Name                | Type   | Description                                                               |
| ------------------- | ------ | ------------------------------------------------------------------------- |
| `functionIsPaused_` | `bool` | isFunctionPaused\_ A boolean indicating the pause status of the function. |
