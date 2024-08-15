# IWithdrawalManagerStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/interfaces/IWithdrawalManagerStorage.sol)

## Functions

### latestConfigId

Gets the id of the latest config.

```solidity
function latestConfigId() external view returns (uint256 configId_);
```

**Returns**

| Name        | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| `configId_` | `uint256` | The id of the latest config. |

### exitCycleId

Gets the exit cycle id of an account.

```solidity
function exitCycleId(address account_) external view returns (uint256 cycleId_);
```

**Parameters**

| Name       | Type      | Description                 |
| ---------- | --------- | --------------------------- |
| `account_` | `address` | The address of the account. |

**Returns**

| Name       | Type      | Description               |
| ---------- | --------- | ------------------------- |
| `cycleId_` | `uint256` | The id of the exit cycle. |

### lockedShares

Gets the locked shares of an account.

```solidity
function lockedShares(address account_) external view returns (uint256 lockedShares_);
```

**Parameters**

| Name       | Type      | Description                 |
| ---------- | --------- | --------------------------- |
| `account_` | `address` | The address of the account. |

**Returns**

| Name            | Type      | Description                                    |
| --------------- | --------- | ---------------------------------------------- |
| `lockedShares_` | `uint256` | The amount of locked shares under the account. |

### totalCycleShares

Gets the total locked shares of a cycle.

```solidity
function totalCycleShares(uint256 cycleId_) external view returns (uint256 totalCycleShares_);
```

**Parameters**

| Name       | Type      | Description          |
| ---------- | --------- | -------------------- |
| `cycleId_` | `uint256` | The id of the cycle. |

**Returns**

| Name                | Type      | Description                                        |
| ------------------- | --------- | -------------------------------------------------- |
| `totalCycleShares_` | `uint256` | The total amount of locked shares under the cycle. |
