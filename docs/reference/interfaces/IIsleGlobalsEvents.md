# IIsleGlobalsEvents

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

## Events

### Initialized

```solidity
event Initialized();
```

### IsleVaultSet

_The address for the Isle vault has been set._

```solidity
event IsleVaultSet(address indexed previousIsleVault_, address indexed currentIsleVault_);
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

### ValidCollateralAssetSet

_A valid asset was set._

```solidity
event ValidCollateralAssetSet(address indexed collateralAsset_, bool isValid_);
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

### MaxCoverLiquidationSet

_The max liquidation percent for the given pool manager has been set._

```solidity
event MaxCoverLiquidationSet(address indexed poolManager_, uint24 maxCoverLiquidation_);
```

### MinCoverSet

_Emitted when the min cover value is set._

```solidity
event MinCoverSet(address indexed poolConfigurator_, uint104 indexed minCover_);
```

### PoolLimitSet

_Emitted when the pool limit is set._

```solidity
event PoolLimitSet(address indexed poolConfigurator_, uint104 poolLimit_);
```
