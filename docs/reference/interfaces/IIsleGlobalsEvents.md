# IIsleGlobalsEvents

[Git Source](https://github.com/isle-labs/isle-docs/tree/main/docs/reference/interfaces)

## Events

### Initialized

_The IsleGlobals contract has been initialized._

```solidity
event event Initialized(address governor_);
```

### IsleVaultSet

_The address for the Isle vault has been set._

```solidity
event IsleVaultSet(address indexed previousVault_, address indexed newVault_);
```

### ProtocolPausedSet

_The protocol pause was set to a new state._

```solidity
event ProtocolPausedSet(address indexed caller_, bool protocolPaused_);
```

### ContractPausedSet

_Emitted when a contract is paused or unpaused._

```solidity
event ContractPausedSet(address indexed caller_, address indexed contract_, bool contractPaused_);
```

### FunctionUnpausedSet

_Emitted when a function is unpaused or paused._

```solidity
event FunctionUnpausedSet(
    address indexed caller_, address indexed contract_, bytes4 indexed sig_, bool functionUnpaused_
);
```

### ProtocolFeeSet

_Emitted when the protocol fee has been set._

```solidity
event ProtocolFeeSet(uint24 protocolFee_);
```

### ValidReceivableAssetSet

_A valid asset was set._

```solidity
event ValidReceivableAssetSet(address indexed receivableAsset_, bool isValid_);
```

### ValidPoolAssetSet

_A valid asset was set._

```solidity
event ValidPoolAssetSet(address indexed poolAsset_, bool isValid_);
```

### ValidPoolAdminSet

_Emitted when a valid pool admin is set._

```solidity
event ValidPoolAdminSet(address indexed poolAdmin_, bool isValid_);
```