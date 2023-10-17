# ILoanManagerEvents

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference/interfaces)

## Events

### LoanApproved

Emitted when a loan is approved

```solidity
event LoanApproved(uint16 indexed loanId_);
```

### LoanRepaid

Emitted when a loan is repaid

```solidity
event LoanRepaid(uint16 indexed loanId_, uint256 principal_, uint256 interest_);
```

### FundsWithdrawn

Emitted when the funds of a loan are withdrawn

```solidity
event FundsWithdrawn(uint16 indexed loanId_, uint256 amount_);
```

### AccountingStateUpdated

Emitted when the accounting state is updated.

```solidity
event AccountingStateUpdated(uint256 issuanceRate_, uint112 accountedInterest_);
```

### UnrealizedLossesUpdated

Emitted when unrealized losses is updated.

```solidity
event UnrealizedLossesUpdated(uint128 unrealizedLosses_);
```

### PrincipalOutUpdated

Emitted when the principal out is updated.

```solidity
event PrincipalOutUpdated(uint128 principalOut_);
```

### IssuanceParamsUpdated

Emitted when the issuance params are updated.

```solidity
event IssuanceParamsUpdated(uint48 indexed domainEnd_, uint256 issuanceRate_, uint112 accountedInterest_);
```

### PaymentAdded

Emitted when a new payment is added to the payment linked list

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

### PaymentRemoved

Emitted when a payment is removed from the payment list

```solidity
event PaymentRemoved(uint16 indexed loanId_, uint256 indexed paymentId_);
```

### FeesPaid

Emitted when fees are paid to the admin and protocol

```solidity
event FeesPaid(uint16 indexed loanId_, uint256 adminFee_, uint256 protocolFee_);
```

### FundsDistributed

Emitted when the funds are distributed back to the pool, pool admin, and protocol vault

```solidity
event FundsDistributed(uint16 indexed loanId_, uint256 principal_, uint256 netInterest_);
```

### LoanImpaired

Emitted when the loan is impaired

```solidity
event LoanImpaired(uint16 indexed loanId_, uint256 newDueDate_);
```

### ImpairmentRemoved

Emitted when the impairment on the loan is removed

```solidity
event ImpairmentRemoved(uint16 indexed loanId_, uint256 originalPaymentDueDate_);
```
