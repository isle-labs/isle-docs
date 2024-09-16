# IIsleGlobalsEvents

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/interfaces/IIsleGlobalsEvents.sol)

## Events

### Initialized

_The IsleGlobals contract has been initialized._

```solidity
event Initialized(address governor_);
```

**Parameters**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `governor_` | `address` | The address of the governor. |

### IsleVaultSet

_The address for the Isle vault has been set._

```solidity
event IsleVaultSet(address indexed previousVault_, address indexed newVault_);
```

**Parameters**

| Name             | Type      | Description         |
| ---------------- | --------- | ------------------- |
| `previousVault_` | `address` | The previous vault. |
| `newVault_`      | `address` | The new vault.      |

### ProtocolPausedSet

_The protocol pause was set to a new state._

```solidity
event ProtocolPausedSet(address indexed caller_, bool protocolPaused_);
```

**Parameters**

| Name              | Type      | Description                                                              |
| ----------------- | --------- | ------------------------------------------------------------------------ |
| `caller_`         | `address` | The address of the security admin or governor that performed the action. |
| `protocolPaused_` | `bool`    | The protocol paused state.                                               |

### ContractPausedSet

_Emitted when a contract is paused or unpaused._

```solidity
event ContractPausedSet(address indexed caller_, address indexed contract_, bool contractPaused_);
```

**Parameters**

| Name              | Type      | Description                                           |
| ----------------- | --------- | ----------------------------------------------------- |
| `caller_`         | `address` | The address that performed the action.                |
| `contract_`       | `address` | The address of the contract being paused or unpaused. |
| `contractPaused_` | `bool`    | The new paused state of the contract.                 |

### FunctionUnpausedSet

_Emitted when a function is unpaused or paused._

```solidity
event FunctionUnpausedSet(
    address indexed caller_, address indexed contract_, bytes4 indexed sig_, bool functionUnpaused_
);
```

**Parameters**

| Name                | Type      | Description                             |
| ------------------- | --------- | --------------------------------------- |
| `caller_`           | `address` | The address that performed the action.  |
| `contract_`         | `address` | The address of the contract.            |
| `sig_`              | `bytes4`  | The function signature.                 |
| `functionUnpaused_` | `bool`    | The new unpaused state of the function. |

### ProtocolFeeSet

_Emitted when the protocol fee has been set._

```solidity
event ProtocolFeeSet(uint24 protocolFee_);
```

**Parameters**

| Name           | Type     | Description                 |
| -------------- | -------- | --------------------------- |
| `protocolFee_` | `uint24` | The new protocol fee value. |

### ValidReceivableAssetSet

_A valid asset was set._

```solidity
event ValidReceivableAssetSet(address indexed receivableAsset_, bool isValid_);
```

**Parameters**

| Name               | Type      | Description                           |
| ------------------ | --------- | ------------------------------------- |
| `receivableAsset_` | `address` | The address of the receivable asset.  |
| `isValid_`         | `bool`    | The validity of the receivable asset. |

### ValidPoolAssetSet

_A valid asset was set._

```solidity
event ValidPoolAssetSet(address indexed poolAsset_, bool isValid_);
```

**Parameters**

| Name         | Type      | Description                |
| ------------ | --------- | -------------------------- |
| `poolAsset_` | `address` | The address of the asset.  |
| `isValid_`   | `bool`    | The validity of the asset. |

### ValidPoolAdminSet

_Emitted when a valid pool admin is set._

```solidity
event ValidPoolAdminSet(address indexed poolAdmin_, bool isValid_);
```

**Parameters**

| Name         | Type      | Description                     |
| ------------ | --------- | ------------------------------- |
| `poolAdmin_` | `address` | The address of the pool admin.  |
| `isValid_`   | `bool`    | The validity of the pool admin. |
