# VersionedInitializable

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/libraries/upgradability)

**Author:**
Aave, inspired by the OpenZeppelin Initializable contract

Helper contract to implement initializer functions. To use it, replace
the constructor with a function that has the `initializer` modifier.

_WARNING: Unlike constructors, initializer functions must be manually
invoked. This applies both to deploying an Initializable contract, as well
as extending an Initializable contract via inheritance.
WARNING: When used with inheritance, manual care must be taken to not invoke
a parent initializer twice, or ensure that all initializers are idempotent,
because this is not dealt with automatically as with constructors._

## State Variables

### lastInitializedRevision

_Indicates that the contract has been initialized._

```solidity
uint256 private lastInitializedRevision = 0;
```

### initializing

_Indicates that the contract is in the process of being initialized._

```solidity
bool private initializing;
```

### **\_\_**gap

```solidity
uint256[50] private ______gap;
```

## Functions

### initializer

_Modifier to use in the initializer function of a contract._

```solidity
modifier initializer();
```

### getRevision

Returns the revision number of the contract

_Needs to be defined in the inherited class as a constant._

```solidity
function getRevision() internal pure virtual returns (uint256);
```

**Returns**

| Name     | Type      | Description         |
| -------- | --------- | ------------------- |
| `<none>` | `uint256` | The revision number |

### isConstructor

Returns true if and only if the function is running in the constructor

```solidity
function isConstructor() private view returns (bool);
```

**Returns**

| Name     | Type   | Description                                        |
| -------- | ------ | -------------------------------------------------- |
| `<none>` | `bool` | True if the function is running in the constructor |
