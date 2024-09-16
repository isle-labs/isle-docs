# PoolAddressesProvider

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/PoolAddressesProvider.sol)

**Inherits:**
[IPoolAddressesProvider](/docs/reference/interfaces/IPoolAddressesProvider.md)

## State Variables

### \_marketId

```solidity
string private _marketId;
```

### \_addresses

```solidity
mapping(bytes32 => address) private _addresses;
```

### POOL_CONFIGURATOR

```solidity
bytes32 private constant POOL_CONFIGURATOR = "POOL_CONFIGURATOR";
```

### ISLE_GLOBALS

```solidity
bytes32 private constant ISLE_GLOBALS = "ISLE_GLOBALS";
```

### LOAN_MANAGER

```solidity
bytes32 private constant LOAN_MANAGER = "LOAN_MANAGER";
```

### WITHDRAWAL_MANAGER

```solidity
bytes32 private constant WITHDRAWAL_MANAGER = "WITHDRAWAL_MANAGER";
```

## Functions

### onlyGovernor

```solidity
modifier onlyGovernor();
```

### constructor

```solidity
constructor(string memory marketId_, IIsleGlobals globals_);
```

### getMarketId

```solidity
function getMarketId() external view override returns (string memory marketId_);
```

### setMarketId

```solidity
function setMarketId(string memory newMarketId_) external override onlyGovernor;
```

### getPoolConfigurator

Retrieves the address of the PoolConfigurator proxy.

```solidity
function getPoolConfigurator() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                                |
| -------- | --------- | ------------------------------------------ |
| `<none>` | `address` | The address of the PoolConfigurator proxy. |

### setPoolConfiguratorImpl

Sets or initializes the PoolConfigurator proxy with a new implementation.

```solidity
function setPoolConfiguratorImpl(
    address newPoolConfiguratorImpl,
    bytes calldata params
)
    external
    override
    onlyGovernor;
```

**Parameters**

| Name                      | Type      | Description                                             |
| ------------------------- | --------- | ------------------------------------------------------- |
| `newPoolConfiguratorImpl` | `address` | The address of the new PoolConfigurator implementation. |
| `params`                  | `bytes`   | The initialization parameters for the PoolConfigurator. |

### getLoanManager

Retrieves the address of the LoanManager proxy.

```solidity
function getLoanManager() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                           |
| -------- | --------- | ------------------------------------- |
| `<none>` | `address` | The address of the LoanManager proxy. |

### setLoanManagerImpl

Sets or initializes the LoanManager proxy with a new implementation.

```solidity
function setLoanManagerImpl(address newLoanManagerImpl, bytes calldata params) external override onlyGovernor;
```

**Parameters**

| Name                 | Type      | Description                                        |
| -------------------- | --------- | -------------------------------------------------- |
| `newLoanManagerImpl` | `address` | The address of the new LoanManager implementation. |
| `params`             | `bytes`   | The initialization parameters for the LoanManager. |

### getWithdrawalManager

Retrieves the address of the WithdrawalManager proxy.

```solidity
function getWithdrawalManager() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                                 |
| -------- | --------- | ------------------------------------------- |
| `<none>` | `address` | The address of the WithdrawalManager proxy. |

### setWithdrawalManagerImpl

Sets or initializes the WithdrawalManager proxy with a new implementation.

```solidity
function setWithdrawalManagerImpl(
    address newWithdrawalManagerImpl,
    bytes calldata params
)
    external
    override
    onlyGovernor;
```

**Parameters**

| Name                       | Type      | Description                                              |
| -------------------------- | --------- | -------------------------------------------------------- |
| `newWithdrawalManagerImpl` | `address` | The address of the new WithdrawalManager implementation. |
| `params`                   | `bytes`   | The initialization parameters for the WithdrawalManager. |

### setAddressAsProxy

Updates or initializes a proxy for a given identifier with a new implementation address.

_Use with caution for identifiers without dedicated setter functions to prevent unintended effects._

```solidity
function setAddressAsProxy(
    bytes32 id,
    address newImplementationAddress,
    bytes calldata params
)
    external
    override
    onlyGovernor;
```

**Parameters**

| Name                       | Type      | Description                                           |
| -------------------------- | --------- | ----------------------------------------------------- |
| `id`                       | `bytes32` | The identifier of the contract to update.             |
| `newImplementationAddress` | `address` | The address of the new implementation.                |
| `params`                   | `bytes`   | The initialization parameters for the proxy contract. |

### getIsleGlobals

Retrieves the address of IsleGlobals.

```solidity
function getIsleGlobals() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                 |
| -------- | --------- | --------------------------- |
| `<none>` | `address` | The address of IsleGlobals. |

### setIsleGlobals

Sets a new address for IsleGlobals, replacing the current address in the registry.

```solidity
function setIsleGlobals(address newIsleGlobals) external override onlyGovernor;
```

**Parameters**

| Name             | Type      | Description                      |
| ---------------- | --------- | -------------------------------- |
| `newIsleGlobals` | `address` | The new address for IsleGlobals. |

### getAddress

Fetches an address associated with a given identifier.

_Can return either a direct contract address or a proxy address._

```solidity
function getAddress(bytes32 id) public view override returns (address);
```

**Parameters**

| Name | Type      | Description                                 |
| ---- | --------- | ------------------------------------------- |
| `id` | `bytes32` | The identifier of the contract to retrieve. |

**Returns**

| Name     | Type      | Description                                           |
| -------- | --------- | ----------------------------------------------------- |
| `<none>` | `address` | The address associated with the specified identifier. |

### setAddress

Directly sets a new address for a given identifier, replacing the current address.

_Use with caution as this will overwrite the existing address without any checks._

```solidity
function setAddress(bytes32 id, address newAddress) external override onlyGovernor;
```

**Parameters**

| Name         | Type      | Description                                       |
| ------------ | --------- | ------------------------------------------------- |
| `id`         | `bytes32` | The identifier for which to set the address.      |
| `newAddress` | `address` | The new address to associate with the identifier. |

### \_updateImpl

Internal function to update the implementation of a specific proxied component of the protocol.

_If there is no proxy registered with the given identifier, it creates the proxy setting `newAddress` as implementation
and calls the initialize() function on the proxy_

_If there is already a proxy registered, it just updates the implementation to `newAddress` and calls the initialize()
function via upgradeToAndCall() in the proxy_

```solidity
function _updateImpl(bytes32 id, address newAddress) internal;
```

**Parameters**

| Name         | Type      | Description                           |
| ------------ | --------- | ------------------------------------- |
| `id`         | `bytes32` | The id of the proxy to be updated     |
| `newAddress` | `address` | The address of the new implementation |

### \_updateImpl

```solidity
function _updateImpl(bytes32 id, address newAddress, bytes memory params) internal;
```

### \_setMarketId

Updates the identifier of the Isle market.

```solidity
function _setMarketId(string memory newMarketId) internal;
```

**Parameters**

| Name          | Type     | Description              |
| ------------- | -------- | ------------------------ |
| `newMarketId` | `string` | The new id of the market |

### \_getProxyImplementation

Returns the the implementation contract of the proxy contract by its identifier.

_It returns ZERO if there is no registered address with the given id_

_It reverts if the registered address with the given id is not `InitializableImmutableAdminUpgradeabilityProxy`_

```solidity
function _getProxyImplementation(bytes32 id) internal view returns (address);
```

**Parameters**

| Name | Type      | Description |
| ---- | --------- | ----------- |
| `id` | `bytes32` | The id      |

**Returns**

| Name     | Type      | Description                                |
| -------- | --------- | ------------------------------------------ |
| `<none>` | `address` | The address of the implementation contract |
