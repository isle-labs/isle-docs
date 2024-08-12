# IIsleGlobals

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/interfaces/IIsleGlobals.sol)

**Inherits:** [IIsleGlobalsEvents](/docs/reference/interfaces/IIsleGlobalsEvents.md),
[IGovernable](/docs/reference/interfaces/IGovernable.md)

Interface for the IsleGlobals contract.

This interface provides functions to manage the global configurations of the Isle Protocol.

## Functions

### initialize

Initializes the contract.

```solidity
function initialize(address governor_) external;
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `governor_` | `address` | The address of the governor. |

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

Pause or unpause the protocol.

```solidity
function setProtocolPaused(bool protocolPaused_) external;
```

**Parameters**

| Name              | Type   | Description                                            |
| ----------------- | ------ | ------------------------------------------------------ |
| `protocolPaused_` | `bool` | A boolean indicating the status of the protocol pause. |

### setContractPaused

Pause or unpause a specific contract.

```solidity
function setContractPaused(address contract_, bool contractPaused_) external;
```

**Parameters**

| Name              | Type      | Description                                              |
| ----------------- | --------- | -------------------------------------------------------- |
| `contract_`       | `address` | The address of the contract to set the pause status for. |
| `contractPaused_` | `bool`    | A boolean indicating the pause status of the contract.   |

### setFunctionUnpaused

Unpause or ununpause a specific function in a contract.

Normally used to unpause specific functions when a contract is paused.

```solidity
function setFunctionUnpaused(address contract_, bytes4 sig_, bool functionUnpaused_) external;
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
function setProtocolFee(uint24 protocolFee_) external;
```

**Parameters**

| Name           | Type     | Description                                                                   |
| -------------- | -------- | ----------------------------------------------------------------------------- |
| `protocolFee_` | `uint24` | A uint24 indicating the protocol fee (100.0000% = 1e6 (6 decimal precision)). |

### setValidReceivableAsset

Sets the validity of a receivable asset (should match ERC-721).

```solidity
function setValidReceivableAsset(address receivableAsset_, bool isValid_) external;
```

**Parameters**

| Name               | Type      | Description                                                  |
| ------------------ | --------- | ------------------------------------------------------------ |
| `receivableAsset_` | `address` | The address of the receivable asset to set the validity for. |
| `isValid_`         | `bool`    | A boolean indicating the validity of the receivable asset.   |

### setValidPoolAsset

Sets the validity of the pool asset (should match ERC-20).

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

### protocolFee

Returns the protocol fee.

```solidity
function protocolFee() external view returns (uint24 protocolFee_);
```

**Returns**

| Name           | Type     | Description                           |
| -------------- | -------- | ------------------------------------- |
| `protocolFee_` | `uint24` | A uint24 indicating the protocol fee. |

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

| Name              | Type   | Description                                          |
| ----------------- | ------ | ---------------------------------------------------- |
| `protocolPaused_` | `bool` | A boolean indicating whether the protocol is paused. |

### isContractPaused

Returns the pause status of a specific contract.

```solidity
function isContractPaused(address contract_) external view returns (bool contractPaused_);
```

**Parameters**

| Name        | Type      | Description                           |
| ----------- | --------- | ------------------------------------- |
| `contract_` | `address` | The address of the contract to check. |

**Returns**

| Name              | Type   | Description                                        |
| ----------------- | ------ | -------------------------------------------------- |
| `contractPaused_` | `bool` | A boolean indicating whether a contract is paused. |

### isFunctionUnpaused

Returns the unpause status of a specific function in a contract.

```solidity
function isFunctionUnpaused(address contract_, bytes4 sig_) external view returns (bool functionUnpaused_);
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `contract_` | `address` | The address of the contract. |
| `sig_`      | `bytes4`  | The function signature.      |

**Returns**

| Name                | Type   | Description                                            |
| ------------------- | ------ | ------------------------------------------------------ |
| `functionUnpaused_` | `bool` | A boolean indicating whether the function is unpaused. |

### isPoolAdmin

Returns if the account is a valid poolAdmin.

```solidity
function isPoolAdmin(address account_) external view returns (bool isPoolAdmin_);
```

**Parameters**

| Name       | Type      | Description                          |
| ---------- | --------- | ------------------------------------ |
| `account_` | `address` | The address of the account to check. |

**Returns**

| Name           | Type   | Description                               |
| -------------- | ------ | ----------------------------------------- |
| `isPoolAdmin_` | `bool` | Whether the account is a valid poolAdmin. |

### isReceivableAsset

Gets the validity of a receivable asset.

```solidity
function isReceivableAsset(address receivableAsset_) external view returns (bool isReceivableAsset_);
```

**Parameters**

| Name               | Type      | Description                                  |
| ------------------ | --------- | -------------------------------------------- |
| `receivableAsset_` | `address` | The address of the receivableAsset to query. |

**Returns**

| Name                 | Type   | Description                                                |
| -------------------- | ------ | ---------------------------------------------------------- |
| `isReceivableAsset_` | `bool` | A boolean indicating the validity of the receivable asset. |

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

### isFunctionPaused

Returns the pause status of a specific function in a contract.

```solidity
function isFunctionPaused(address contract_, bytes4 sig_) external view returns (bool isFunctionPaused_);
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `contract_` | `address` | The address of the contract. |
| `sig_`      | `bytes4`  | The function signature.      |

**Returns**

| Name                | Type   | Description                                            |
| ------------------- | ------ | ------------------------------------------------------ |
| `isFunctionPaused_` | `bool` | A boolean indicating the pause status of the function. |

### isFunctionPaused

Returns the pause status of a specific function in the caller contract.

```solidity
function isFunctionPaused(bytes4 sig_) external view returns (bool isFunctionPaused_);
```

**Parameters**

| Name   | Type     | Description             |
| ------ | -------- | ----------------------- |
| `sig_` | `bytes4` | The function signature. |

**Returns**

| Name                | Type   | Description                                            |
| ------------------- | ------ | ------------------------------------------------------ |
| `isFunctionPaused_` | `bool` | A boolean indicating the pause status of the function. |
