# IGovernable

[Git Source](https://github.com/isle-labs/isle-docs/tree/main/docs/reference/interfaces/IGovernable.md)

Contract module that provides a basic access control mechanism, with a governor that can be
granted exclusive access to specific functions. The inheriting contract must set the initial governor
in the constructor.

## Functions

### admin

The address of the governor account or contract.

```solidity
function governor() external view returns (address governor_);
```

### transferAdmin

Transfers the contract admin to a new address.

Notes:

- Does not revert if the governor is the same.
- This function can potentially leave the contract without an governor, thereby removing any
  functionality that is only available to the governor.
  Requirements:
- `msg.sender` must be the contract governor.

```solidity
function transferGovernor(address newGovernor) external;
```

**Parameters**

| Name          | Type      | Description                      |
| ------------- | --------- | -------------------------------- |
| `newGovernor` | `address` | The address of the new governor. |

## Events

### TransferGovernor

Emitted when the governor is transferred.

```solidity
event TransferGovernor(address indexed oldGovernor, address indexed newGovernor);
```
