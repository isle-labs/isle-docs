# PoolAddressesProvider

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference)

**Inherits:**
[Adminable](/docs/contracts/reference/abstracts/Adminable.md), [IPoolAddressesProvider](/docs/contracts/reference/interfaces/IPoolAddressesProvider.md)

## State Variables

### \_marketId

```solidity
string private _marketId;
```

### \_addresses

```solidity
mapping(bytes32 => address) private _addresses;
```

### POOL

```solidity
bytes32 private constant POOL = "POOL";
```

### POOL_CONFIGURATOR

```solidity
bytes32 private constant POOL_CONFIGURATOR = "POOL_CONFIGURATOR";
```

### LOPO_GLOBALS

```solidity
bytes32 private constant LOPO_GLOBALS = "LOPO_GLOBALS";
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

### constructor

```solidity
constructor(string memory marketId_, address initialAdmin_);
```

### getMarketId

```solidity
function getMarketId() external view returns (string memory);
```

### setMarketId

```solidity
function setMarketId(string memory newMarketId_) external onlyAdmin;
```

### getPoolConfigurator

Returns the address of the PoolConfigurator proxy.

```solidity
function getPoolConfigurator() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                        |
| -------- | --------- | ---------------------------------- |
| `<none>` | `address` | The PoolConfigurator proxy address |

### setPoolConfiguratorImpl

Updates the implementation of the PoolConfigurator, or creates a proxy
setting the new `PoolConfigurator` implementation when the function is called for the first time.

```solidity
function setPoolConfiguratorImpl(address newPoolConfiguratorImpl, bytes calldata params) external override onlyAdmin;
```

**Parameters**

| Name                      | Type      | Description                             |
| ------------------------- | --------- | --------------------------------------- |
| `newPoolConfiguratorImpl` | `address` | The new PoolConfigurator implementation |
| `params`                  | `bytes`   |                                         |

### getLoanManager

Returns the address of the LoanManager proxy.

```solidity
function getLoanManager() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                   |
| -------- | --------- | ----------------------------- |
| `<none>` | `address` | The LoanManager proxy address |

### setLoanManagerImpl

Updates the implementation of the LoanManager, or creates a proxy
setting the new `LoanManager` implementation when the function is called for the first time.

```solidity
function setLoanManagerImpl(address newLoanManagerImpl) external override onlyAdmin;
```

**Parameters**

| Name                 | Type      | Description                        |
| -------------------- | --------- | ---------------------------------- |
| `newLoanManagerImpl` | `address` | The new LoanManager implementation |

### getWithdrawalManager

Returns the address of the WithdrawalManager proxy.

```solidity
function getWithdrawalManager() external view override returns (address);
```

**Returns**

| Name     | Type      | Description                         |
| -------- | --------- | ----------------------------------- |
| `<none>` | `address` | The WithdrawalManager proxy address |

### setWithdrawalManagerImpl

Updates the implementation of the WithdrawalManager, or creates a proxy
setting the new `WithdrawalManager` implementation when the function is called for the first time.

```solidity
function setWithdrawalManagerImpl(
    address newWithdrawalManagerImpl,
    bytes calldata params
)
    external
    override
    onlyAdmin;
```

**Parameters**

| Name                       | Type      | Description                              |
| -------------------------- | --------- | ---------------------------------------- |
| `newWithdrawalManagerImpl` | `address` | The new WithdrawalManager implementation |
| `params`                   | `bytes`   |                                          |

### setAddressAsProxy

General function to update the implementation of a proxy registered with
certain `id`. If there is no proxy registered, it will instantiate one and
set as implementation the `newImplementationAddress`.

_IMPORTANT Use this function carefully, only for ids that don't have an explicit
setter function, in order to avoid unexpected consequences_

```solidity
function setAddressAsProxy(
    bytes32 id,
    address newImplementationAddress,
    bytes calldata params
)
    external
    override
    onlyAdmin;
```

**Parameters**

| Name                       | Type      | Description                                           |
| -------------------------- | --------- | ----------------------------------------------------- |
| `id`                       | `bytes32` | The id                                                |
| `newImplementationAddress` | `address` | The address of the new implementation                 |
| `params`                   | `bytes`   | The intialization parameters for the proxied contract |

### getIsleGlobals

Returns the address of isle globals.

```solidity
function getIsleGlobals() external view override returns (address);
```

**Returns**

| Name     | Type      | Description             |
| -------- | --------- | ----------------------- |
| `<none>` | `address` | The IsleGlobals address |

### setIsleGlobals

Sets an address for IsleGlobals replacing the address saved in the addresses map

```solidity
function setIsleGlobals(address newIsleGlobals) external override onlyAdmin;
```

**Parameters**

| Name             | Type      | Description         |
| ---------------- | --------- | ------------------- |
| `newIsleGlobals` | `address` | IsleGlobals address |

### getAddress

Returns an address by its identifier.

_The returned address might be an EOA or a contract, potentially proxied_

```solidity
function getAddress(bytes32 id) public view override returns (address);
```

**Parameters**

| Name | Type      | Description |
| ---- | --------- | ----------- |
| `id` | `bytes32` | The id      |

**Returns**

| Name     | Type      | Description                                        |
| -------- | --------- | -------------------------------------------------- |
| `<none>` | `address` | The address of the registered for the specified id |

### setAddress

Sets an address for an id replacing the address saved in the addresses map.

_IMPORTANT Use this function carefully, as it will do a hard replacement_

```solidity
function setAddress(bytes32 id, address newAddress) external override onlyAdmin;
```

**Parameters**

| Name         | Type      | Description        |
| ------------ | --------- | ------------------ |
| `id`         | `bytes32` | The id             |
| `newAddress` | `address` | The address to set |

### \_updateImpl

Internal function to update the implementation of a specific proxied component of the protocol.

_If there is no proxy registered with the given identifier, it creates the proxy setting `newAddress`
as implementation and calls the initialize() function on the proxy_

_If there is already a proxy registered, it just updates the implementation to `newAddress` and
calls the initialize() function via upgradeToAndCall() in the proxy_

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

_It reverts if the registered address with the given id is not
`InitializableImmutableAdminUpgradeabilityProxy`_

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
