# ILoanManagerStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/interfaces/ILoanManagerStorage.sol)

## Functions

### asset

Gets the asset used for the protocol.

```solidity
function asset() external view returns (address asset_);
```

**Returns**

| Name     | Type      | Description               |
| -------- | --------- | ------------------------- |
| `asset_` | `address` | The address of the asset. |

### unrealizedLosses

Gets the unrealized losses.

```solidity
function unrealizedLosses() external view returns (uint128);
```

**Returns**

| Name     | Type      | Description                               |
| -------- | --------- | ----------------------------------------- |
| `<none>` | `uint128` | unrealizedLosses\_ The unrealized losses. |

### loanCounter

Gets the total number of loans.

```solidity
function loanCounter() external view returns (uint16);
```

**Returns**

| Name     | Type     | Description                              |
| -------- | -------- | ---------------------------------------- |
| `<none>` | `uint16` | loanCounter\_ The total number of loans. |

### paymentCounter

Gets the total number of payments.

```solidity
function paymentCounter() external view returns (uint24);
```

**Returns**

| Name     | Type     | Description                                    |
| -------- | -------- | ---------------------------------------------- |
| `<none>` | `uint24` | paymentCounter\_ The total number of payments. |

### paymentWithEarliestDueDate

Gets the payment ID with the earliest due date.

```solidity
function paymentWithEarliestDueDate() external view returns (uint24);
```

**Returns**

| Name     | Type     | Description                                                             |
| -------- | -------- | ----------------------------------------------------------------------- |
| `<none>` | `uint24` | paymentWithEarliestDueDate\_ The payment ID with the earliest due date. |

### domainStart

Gets the start date of the domain.

```solidity
function domainStart() external view returns (uint48);
```

**Returns**

| Name     | Type     | Description                                 |
| -------- | -------- | ------------------------------------------- |
| `<none>` | `uint48` | domainStart\_ The start date of the domain. |

### domainEnd

Gets the end date of the domain.

```solidity
function domainEnd() external view returns (uint48);
```

**Returns**

| Name     | Type     | Description                             |
| -------- | -------- | --------------------------------------- |
| `<none>` | `uint48` | domainEnd\_ The end date of the domain. |

### accountedInterest

Gets the accounted interest.

```solidity
function accountedInterest() external view returns (uint112);
```

**Returns**

| Name     | Type      | Description                                 |
| -------- | --------- | ------------------------------------------- |
| `<none>` | `uint112` | accountedInterest\_ The accounted interest. |

### principalOut

Gets the total principal amount lent out.

```solidity
function principalOut() external view returns (uint128);
```

**Returns**

| Name     | Type      | Description                                         |
| -------- | --------- | --------------------------------------------------- |
| `<none>` | `uint128` | principalOut\_ The total principal amount lent out. |

### issuanceRate

Gets the issuance rate.

```solidity
function issuanceRate() external view returns (uint256);
```

**Returns**

| Name     | Type      | Description                       |
| -------- | --------- | --------------------------------- |
| `<none>` | `uint256` | issuanceRate\_ The issuance rate. |

### paymentIdOf

Gets the payment ID of the given loan.

```solidity
function paymentIdOf(uint16 loanId_) external view returns (uint24);
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The ID of the loan. |

**Returns**

| Name     | Type     | Description                             |
| -------- | -------- | --------------------------------------- |
| `<none>` | `uint24` | paymentId\_ The payment ID of the loan. |
