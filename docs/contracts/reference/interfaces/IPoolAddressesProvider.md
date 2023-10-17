# IPoolAddressesProvider

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference/interfaces)

Defines the basic interface for a Pool Addresses Provider.

## Functions

### getMarketId

Returns the id of the Aave market to which this contract points to.

```solidity
function getMarketId() external view returns (string memory);
```

**Returns**

| Name     | Type     | Description   |
| -------- | -------- | ------------- |
| `<none>` | `string` | The market id |

### setMarketId

Associates an id with a specific PoolAddressesProvider.

_This can be used to create an onchain registry of PoolAddressesProviders to
identify and validate multiple Aave markets._

```solidity
function setMarketId(string calldata newMarketId) external;
```

**Parameters**

| Name          | Type     | Description   |
| ------------- | -------- | ------------- |
| `newMarketId` | `string` | The market id |

### getAddress

Returns an address by its identifier.

_The returned address might be an EOA or a contract, potentially proxied_

_It returns ZERO if there is no registered address with the given id_

```solidity
function getAddress(bytes32 id) external view returns (address);
```

**Parameters**

| Name | Type      | Description |
| ---- | --------- | ----------- |
| `id` | `bytes32` | The id      |

**Returns**

| Name     | Type      | Description                                        |
| -------- | --------- | -------------------------------------------------- |
| `<none>` | `address` | The address of the registered for the specified id |

### setAddressAsProxy

General function to update the implementation of a proxy registered with
certain `id`. If there is no proxy registered, it will instantiate one and
set as implementation the `newImplementationAddress`.

_IMPORTANT Use this function carefully, only for ids that don't have an explicit
setter function, in order to avoid unexpected consequences_

```solidity
function setAddressAsProxy(bytes32 id, address newImplementationAddress, bytes calldata params) external;
```

**Parameters**

| Name                       | Type      | Description                                           |
| -------------------------- | --------- | ----------------------------------------------------- |
| `id`                       | `bytes32` | The id                                                |
| `newImplementationAddress` | `address` | The address of the new implementation                 |
| `params`                   | `bytes`   | The intialization parameters for the proxied contract |

### setAddress

Sets an address for an id replacing the address saved in the addresses map.

_IMPORTANT Use this function carefully, as it will do a hard replacement_

```solidity
function setAddress(bytes32 id, address newAddress) external;
```

**Parameters**

| Name         | Type      | Description        |
| ------------ | --------- | ------------------ |
| `id`         | `bytes32` | The id             |
| `newAddress` | `address` | The address to set |

### getPoolConfigurator

Returns the address of the PoolConfigurator proxy.

```solidity
function getPoolConfigurator() external view returns (address);
```

**Returns**

| Name     | Type      | Description                        |
| -------- | --------- | ---------------------------------- |
| `<none>` | `address` | The PoolConfigurator proxy address |

### setPoolConfiguratorImpl

Updates the implementation of the PoolConfigurator, or creates a proxy
setting the new `PoolConfigurator` implementation when the function is called for the first time.

```solidity
function setPoolConfiguratorImpl(address newPoolConfiguratorImpl, bytes calldata params) external;
```

**Parameters**

| Name                      | Type      | Description                             |
| ------------------------- | --------- | --------------------------------------- |
| `newPoolConfiguratorImpl` | `address` | The new PoolConfigurator implementation |
| `params`                  | `bytes`   |                                         |

### getLoanManager

Returns the address of the LoanManager proxy.

```solidity
function getLoanManager() external view returns (address);
```

**Returns**

| Name     | Type      | Description                   |
| -------- | --------- | ----------------------------- |
| `<none>` | `address` | The LoanManager proxy address |

### setLoanManagerImpl

Updates the implementation of the LoanManager, or creates a proxy
setting the new `LoanManager` implementation when the function is called for the first time.

```solidity
function setLoanManagerImpl(address newLoanManagerImpl) external;
```

**Parameters**

| Name                 | Type      | Description                        |
| -------------------- | --------- | ---------------------------------- |
| `newLoanManagerImpl` | `address` | The new LoanManager implementation |

### getWithdrawalManager

Returns the address of the WithdrawalManager proxy.

```solidity
function getWithdrawalManager() external view returns (address);
```

**Returns**

| Name     | Type      | Description                         |
| -------- | --------- | ----------------------------------- |
| `<none>` | `address` | The WithdrawalManager proxy address |

### setWithdrawalManagerImpl

Updates the implementation of the WithdrawalManager, or creates a proxy
setting the new `WithdrawalManager` implementation when the function is called for the first time.

```solidity
function setWithdrawalManagerImpl(address newWithdrawalManagerImpl, bytes calldata params) external;
```

**Parameters**

| Name                       | Type      | Description                              |
| -------------------------- | --------- | ---------------------------------------- |
| `newWithdrawalManagerImpl` | `address` | The new WithdrawalManager implementation |
| `params`                   | `bytes`   |                                          |

### getIsleGlobals

Returns the address of isle globals.

```solidity
function getIsleGlobals() external view returns (address);
```

**Returns**

| Name     | Type      | Description             |
| -------- | --------- | ----------------------- |
| `<none>` | `address` | The IsleGlobals address |

### setIsleGlobals

Sets an address for IsleGlobals replacing the address saved in the addresses map

```solidity
function setIsleGlobals(address newIsleGlobals) external;
```

**Parameters**

| Name             | Type      | Description         |
| ---------------- | --------- | ------------------- |
| `newIsleGlobals` | `address` | IsleGlobals address |

## Events

### MarketIdSet

_Emitted when the market identifier is updated._

```solidity
event MarketIdSet(string indexed oldMarketId, string indexed newMarketId);
```

### PoolConfiguratorUpdated

_Emitted when the pool configurator is updated._

```solidity
event PoolConfiguratorUpdated(address indexed oldAddress, address indexed newAddress);
```

### LoanManagerUpdated

_Emitted when the loan manager is updated._

```solidity
event LoanManagerUpdated(address indexed oldAddress, address indexed newAddress);
```

### WithdrawalManagerUpdated

_Emitted when the withdrawal manager is updated._

```solidity
event WithdrawalManagerUpdated(address indexed oldAddress, address indexed newAddress);
```

### IsleGlobalsUpdated

_Emitted when isle globals is updated._

```solidity
event IsleGlobalsUpdated(address indexed oldAddress, address indexed newAddress);
```

### ProxyCreated

_Emitted when a new proxy is created._

```solidity
event ProxyCreated(bytes32 indexed id, address indexed proxyAddress, address indexed implementationAddress);
```

### AddressSet

_Emitted when a new non-proxied contract address is registered._

```solidity
event AddressSet(bytes32 indexed id, address indexed oldAddress, address indexed newAddress);
```

### AddressSetAsProxy

_Emitted when the implementation of the proxy registered with id is updated_

```solidity
event AddressSetAsProxy(
    bytes32 indexed id,
    address indexed proxyAddress,
    address oldImplementationAddress,
    address indexed newImplementationAddress
);
```
