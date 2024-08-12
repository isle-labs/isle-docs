# ILoanManagerEvents

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/interfaces/ILoanManagerEvents.sol)

## Events

### Initialized

Emitted when the loan manager is initialized.

```solidity
event Initialized(address poolAddressesProvider_, address asset_);
```

**Parameters**

| Name                     | Type      | Description                                 |
| ------------------------ | --------- | ------------------------------------------- |
| `poolAddressesProvider_` | `address` | The address of the pool addresses provider. |
| `asset_`                 | `address` | The address of the asset set.               |

### LoanRequested

Emitted when a loan is requested.

```solidity
event LoanRequested(uint16 indexed loanId_);
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### LoanRepaid

Emitted when a loan is repaid.

```solidity
event LoanRepaid(uint16 indexed loanId_, uint256 principal_, uint256 interest_);
```

**Parameters**

| Name         | Type      | Description                 |
| ------------ | --------- | --------------------------- |
| `loanId_`    | `uint16`  | The id of the loan.         |
| `principal_` | `uint256` | The total principal repaid. |
| `interest_`  | `uint256` | The total interest repaid.  |

### FundsWithdrawn

Emitted when the funds of a loan are withdrawn.

```solidity
event FundsWithdrawn(uint16 indexed loanId_, uint256 amount_);
```

**Parameters**

| Name      | Type      | Description                        |
| --------- | --------- | ---------------------------------- |
| `loanId_` | `uint16`  | The id of the loan.                |
| `amount_` | `uint256` | The amount of principal withdrawn. |

### UnrealizedLossesUpdated

Emitted when unrealized losses is updated.

```solidity
event UnrealizedLossesUpdated(uint128 unrealizedLosses_);
```

**Parameters**

| Name                | Type      | Description                    |
| ------------------- | --------- | ------------------------------ |
| `unrealizedLosses_` | `uint128` | The updated unrealized losses. |

### PrincipalOutUpdated

Emitted when the principal out is updated.

```solidity
event PrincipalOutUpdated(uint128 principalOut_);
```

**Parameters**

| Name            | Type      | Description                        |
| --------------- | --------- | ---------------------------------- |
| `principalOut_` | `uint128` | The updated principal outstanding. |

### IssuanceParamsUpdated

Emitted when the issuance params are updated.

```solidity
event IssuanceParamsUpdated(uint48 indexed domainEnd_, uint256 issuanceRate_, uint112 accountedInterest_);
```

**Parameters**

| Name                 | Type      | Description                     |
| -------------------- | --------- | ------------------------------- |
| `domainEnd_`         | `uint48`  | The updated domain end.         |
| `issuanceRate_`      | `uint256` | The updated issuance rate.      |
| `accountedInterest_` | `uint112` | The updated accounted interest. |

### PaymentAdded

Emitted when a new payment is added to the payment linked list.

```solidity
event PaymentAdded(
    uint16 indexed loanId_,
    uint256 indexed paymentId_,
    uint256 protocolFee_,
    uint256 adminFee_,
    uint256 startDate_,
    uint256 dueDate_,
    uint256 newRate_
);
```

**Parameters**

| Name           | Type      | Description                                       |
| -------------- | --------- | ------------------------------------------------- |
| `loanId_`      | `uint16`  | The new loan id that the payment id is linked to. |
| `paymentId_`   | `uint256` | The payment id of the payment.                    |
| `protocolFee_` | `uint256` | The protocol fee rate of the payment.             |
| `adminFee_`    | `uint256` | The admin fee rate of the payment.                |
| `startDate_`   | `uint256` | The start date of the payment.                    |
| `dueDate_`     | `uint256` | The due date of the payment.                      |
| `newRate_`     | `uint256` | The new issuance rate of the payment.             |

### PaymentRemoved

Emitted when a payment is removed from the payment list.

```solidity
event PaymentRemoved(uint16 indexed loanId_, uint256 indexed paymentId_);
```

**Parameters**

| Name         | Type      | Description                                             |
| ------------ | --------- | ------------------------------------------------------- |
| `loanId_`    | `uint16`  | The id of the loan that the payment is associated with. |
| `paymentId_` | `uint256` | The payment id of the payment.                          |

### FeesPaid

Emitted when fees are paid to the admin and protocol.

```solidity
event FeesPaid(uint16 indexed loanId_, uint256 adminFee_, uint256 protocolFee_);
```

**Parameters**

| Name           | Type      | Description                      |
| -------------- | --------- | -------------------------------- |
| `loanId_`      | `uint16`  | The id of the loan.              |
| `adminFee_`    | `uint256` | The amount of admin fee paid.    |
| `protocolFee_` | `uint256` | The amount of protocol fee paid. |

### FundsDistributed

Emitted when the funds are distributed back to the pool, pool admin, and protocol vault.

```solidity
event FundsDistributed(uint16 indexed loanId_, uint256 principal_, uint256 netInterest_);
```

**Parameters**

| Name           | Type      | Description                             |
| -------------- | --------- | --------------------------------------- |
| `loanId_`      | `uint16`  | The id of the loan.                     |
| `principal_`   | `uint256` | The amount of principal distributed.    |
| `netInterest_` | `uint256` | The amount of net interest distributed. |

### LoanImpaired

Emitted when the loan is impaired.

```solidity
event LoanImpaired(uint16 indexed loanId_, uint256 newDueDate_);
```

**Parameters**

| Name          | Type      | Description                            |
| ------------- | --------- | -------------------------------------- |
| `loanId_`     | `uint16`  | The id of the loan.                    |
| `newDueDate_` | `uint256` | The new due date of the impaired loan. |

### ImpairmentRemoved

Emitted when the impairment on the loan is removed.

```solidity
event ImpairmentRemoved(uint16 indexed loanId_, uint256 originalPaymentDueDate_);
```

**Parameters**

| Name                      | Type      | Description                                |
| ------------------------- | --------- | ------------------------------------------ |
| `loanId_`                 | `uint16`  | The id of the loan.                        |
| `originalPaymentDueDate_` | `uint256` | The original payment due date of the loan. |

### DefaultTriggered

Emitted when the loan is defaulted.

```solidity
event DefaultTriggered(uint16 indexed loanId_);
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |
