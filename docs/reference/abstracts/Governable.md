# Governable

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/abstracts/Governable.sol)

**Inherits:** [IGovernable](/docs/reference/interfaces/IGovernable.md)

See the documentation in {IGovernable}.

## State Variables

### governor

The address of the governor account or contract.

```solidity
address public override governor;
```

## Functions

### onlyGovernor

Reverts if called by any account other than the governor.

```solidity
modifier onlyGovernor() virtual;
```

### transferGovernor

Transfers the contract governor to a new address.

Notes:

-   Does not revert if the governor is the same.
-   This function can potentially leave the contract without an governor, thereby removing any functionality that is
    only available to the governor.

Requirements:

-   `msg.sender` must be the contract governor.

```solidity
function transferGovernor(address newGovernor) external virtual override onlyGovernor;
```

**Parameters**

| Name          | Type      | Description                      |
| ------------- | --------- | -------------------------------- |
| `newGovernor` | `address` | The address of the new governor. |
