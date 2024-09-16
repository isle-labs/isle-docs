# IPoolAddressesProvider

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/interfaces/IPoolAddressesProvider.sol)

Defines the basic interface for a Pool Addresses Provider.

## Functions

### getMarketId

Retrieves the identifier of the Isle market associated with this contract.

```solidity
function getMarketId() external view returns (string memory);
```

**Returns**

| Name     | Type     | Description                   |
| -------- | -------- | ----------------------------- |
| `<none>` | `string` | The identifier of the market. |

### setMarketId

Links a new market identifier to this PoolAddressesProvider.

_Useful for creating a registry of PoolAddressesProviders for multiple Isle markets._

```solidity
function setMarketId(string calldata newMarketId) external;
```

**Parameters**

| Name          | Type     | Description                |
| ------------- | -------- | -------------------------- |
| `newMarketId` | `string` | The new market identifier. |

### getAddress

Fetches an address associated with a given identifier.

_Can return either a direct contract address or a proxy address._

_Returns address(0) if no address is registered with the given identifier._

```solidity
function getAddress(bytes32 id) external view returns (address);
```

**Parameters**

| Name | Type      | Description                                 |
| ---- | --------- | ------------------------------------------- |
| `id` | `bytes32` | The identifier of the contract to retrieve. |

**Returns**

| Name     | Type      | Description                                           |
| -------- | --------- | ----------------------------------------------------- |
| `<none>` | `address` | The address associated with the specified identifier. |

### setAddressAsProxy

Updates or initializes a proxy for a given identifier with a new implementation address.

_Use with caution for identifiers without dedicated setter functions to prevent unintended effects._

_Only use for identifiers POOL_CONFIGURATOR, LOAN_MANAGER, WITHDRAWAL_MANAGER, or ISLE_GLOBALS._

```solidity
function setAddressAsProxy(bytes32 id, address newImplementationAddress, bytes calldata params) external;
```

**Parameters**

| Name                       | Type      | Description                                           |
| -------------------------- | --------- | ----------------------------------------------------- |
| `id`                       | `bytes32` | The identifier of the contract to update.             |
| `newImplementationAddress` | `address` | The address of the new implementation.                |
| `params`                   | `bytes`   | The initialization parameters for the proxy contract. |

### setAddress

Directly sets a new address for a given identifier, replacing the current address.

_Use with caution as this will overwrite the existing address without any checks._

_Only use for identifiers POOL_CONFIGURATOR, LOAN_MANAGER, WITHDRAWAL_MANAGER, or ISLE_GLOBALS._

```solidity
function setAddress(bytes32 id, address newAddress) external;
```

**Parameters**

| Name         | Type      | Description                                       |
| ------------ | --------- | ------------------------------------------------- |
| `id`         | `bytes32` | The identifier for which to set the address.      |
| `newAddress` | `address` | The new address to associate with the identifier. |

### getPoolConfigurator

Retrieves the address of the PoolConfigurator proxy.

```solidity
function getPoolConfigurator() external view returns (address);
```

**Returns**

| Name     | Type      | Description                                |
| -------- | --------- | ------------------------------------------ |
| `<none>` | `address` | The address of the PoolConfigurator proxy. |

### setPoolConfiguratorImpl

Sets or initializes the PoolConfigurator proxy with a new implementation.

```solidity
function setPoolConfiguratorImpl(address newPoolConfiguratorImpl, bytes calldata params) external;
```

**Parameters**

| Name                      | Type      | Description                                             |
| ------------------------- | --------- | ------------------------------------------------------- |
| `newPoolConfiguratorImpl` | `address` | The address of the new PoolConfigurator implementation. |
| `params`                  | `bytes`   | The initialization parameters for the PoolConfigurator. |

### getLoanManager

Retrieves the address of the LoanManager proxy.

```solidity
function getLoanManager() external view returns (address);
```

**Returns**

| Name     | Type      | Description                           |
| -------- | --------- | ------------------------------------- |
| `<none>` | `address` | The address of the LoanManager proxy. |

### setLoanManagerImpl

Sets or initializes the LoanManager proxy with a new implementation.

```solidity
function setLoanManagerImpl(address newLoanManagerImpl, bytes calldata params) external;
```

**Parameters**

| Name                 | Type      | Description                                        |
| -------------------- | --------- | -------------------------------------------------- |
| `newLoanManagerImpl` | `address` | The address of the new LoanManager implementation. |
| `params`             | `bytes`   | The initialization parameters for the LoanManager. |

### getWithdrawalManager

Retrieves the address of the WithdrawalManager proxy.

```solidity
function getWithdrawalManager() external view returns (address);
```

**Returns**

| Name     | Type      | Description                                 |
| -------- | --------- | ------------------------------------------- |
| `<none>` | `address` | The address of the WithdrawalManager proxy. |

### setWithdrawalManagerImpl

Sets or initializes the WithdrawalManager proxy with a new implementation.

```solidity
function setWithdrawalManagerImpl(address newWithdrawalManagerImpl, bytes calldata params) external;
```

**Parameters**

| Name                       | Type      | Description                                              |
| -------------------------- | --------- | -------------------------------------------------------- |
| `newWithdrawalManagerImpl` | `address` | The address of the new WithdrawalManager implementation. |
| `params`                   | `bytes`   | The initialization parameters for the WithdrawalManager. |

### getIsleGlobals

Retrieves the address of IsleGlobals.

```solidity
function getIsleGlobals() external view returns (address);
```

**Returns**

| Name     | Type      | Description                 |
| -------- | --------- | --------------------------- |
| `<none>` | `address` | The address of IsleGlobals. |

### setIsleGlobals

Sets a new address for IsleGlobals, replacing the current address in the registry.

```solidity
function setIsleGlobals(address newIsleGlobals) external;
```

**Parameters**

| Name             | Type      | Description                      |
| ---------------- | --------- | -------------------------------- |
| `newIsleGlobals` | `address` | The new address for IsleGlobals. |

## Events

### MarketIdSet

_Emitted when the market identifier is changed._

```solidity
event MarketIdSet(string indexed oldMarketId, string indexed newMarketId);
```

**Parameters**

| Name          | Type     | Description                            |
| ------------- | -------- | -------------------------------------- |
| `oldMarketId` | `string` | The previous identifier of the market. |
| `newMarketId` | `string` | The new identifier of the market.      |

### PoolConfiguratorUpdated

_Emitted when the address of the PoolConfigurator is updated._

```solidity
event PoolConfiguratorUpdated(address indexed oldAddress, address indexed newAddress);
```

**Parameters**

| Name         | Type      | Description                                  |
| ------------ | --------- | -------------------------------------------- |
| `oldAddress` | `address` | The former address of the PoolConfigurator.  |
| `newAddress` | `address` | The updated address of the PoolConfigurator. |

### LoanManagerUpdated

_Emitted when the address of the LoanManager is updated._

```solidity
event LoanManagerUpdated(address indexed oldAddress, address indexed newAddress);
```

**Parameters**

| Name         | Type      | Description                             |
| ------------ | --------- | --------------------------------------- |
| `oldAddress` | `address` | The former address of the LoanManager.  |
| `newAddress` | `address` | The updated address of the LoanManager. |

### WithdrawalManagerUpdated

_Emitted when the address of the WithdrawalManager is updated._

```solidity
event WithdrawalManagerUpdated(address indexed oldAddress, address indexed newAddress);
```

**Parameters**

| Name         | Type      | Description                                   |
| ------------ | --------- | --------------------------------------------- |
| `oldAddress` | `address` | The former address of the WithdrawalManager.  |
| `newAddress` | `address` | The updated address of the WithdrawalManager. |

### IsleGlobalsUpdated

_Emitted when the address of IsleGlobals is updated._

```solidity
event IsleGlobalsUpdated(address indexed oldAddress, address indexed newAddress);
```

**Parameters**

| Name         | Type      | Description                         |
| ------------ | --------- | ----------------------------------- |
| `oldAddress` | `address` | The former address of IsleGlobals.  |
| `newAddress` | `address` | The updated address of IsleGlobals. |

### ProxyCreated

_Emitted when a new proxy is created for a contract._

```solidity
event ProxyCreated(bytes32 indexed id, address indexed proxyAddress, address indexed implementationAddress);
```

**Parameters**

| Name                    | Type      | Description                                                     |
| ----------------------- | --------- | --------------------------------------------------------------- |
| `id`                    | `bytes32` | The identifier of the contract.                                 |
| `proxyAddress`          | `address` | The address of the newly created proxy contract.                |
| `implementationAddress` | `address` | The address of the implementation contract linked to the proxy. |

### AddressSet

_Emitted when a new address is registered for a contract without a proxy._

```solidity
event AddressSet(bytes32 indexed id, address indexed oldAddress, address indexed newAddress);
```

**Parameters**

| Name         | Type      | Description                                   |
| ------------ | --------- | --------------------------------------------- |
| `id`         | `bytes32` | The identifier of the contract.               |
| `oldAddress` | `address` | The former address of the contract.           |
| `newAddress` | `address` | The newly registered address of the contract. |

### AddressSetAsProxy

_Emitted when the implementation of a registered proxy is updated._

```solidity
event AddressSetAsProxy(
    bytes32 indexed id,
    address indexed proxyAddress,
    address oldImplementationAddress,
    address indexed newImplementationAddress
);
```

**Parameters**

| Name                       | Type      | Description                                         |
| -------------------------- | --------- | --------------------------------------------------- |
| `id`                       | `bytes32` | The identifier of the contract.                     |
| `proxyAddress`             | `address` | The address of the proxy contract.                  |
| `oldImplementationAddress` | `address` | The former address of the implementation contract.  |
| `newImplementationAddress` | `address` | The updated address of the implementation contract. |
