# LoanManagerStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/LoanManagerStorage.sol)

**Inherits:** [ILoanManagerStorage](/docs/reference/interfaces/ILoanManagerStorage.md)

## State Variables

### loanCounter

```solidity
uint16 public override loanCounter;
```

### paymentCounter

```solidity
uint24 public override paymentCounter;
```

### paymentWithEarliestDueDate

```solidity
uint24 public override paymentWithEarliestDueDate;
```

### domainStart

```solidity
uint48 public override domainStart;
```

### domainEnd

```solidity
uint48 public override domainEnd;
```

### accountedInterest

```solidity
uint112 public override accountedInterest;
```

### principalOut

```solidity
uint128 public override principalOut;
```

### unrealizedLosses

```solidity
uint128 public override unrealizedLosses;
```

### issuanceRate

```solidity
uint256 public override issuanceRate;
```

### asset

```solidity
address public override asset;
```

### paymentIdOf

```solidity
mapping(uint16 => uint24) public override paymentIdOf;
```

### impairmentFor

```solidity
mapping(uint16 => Loan.Impairment) public impairmentFor;
```

### payments

```solidity
mapping(uint256 => Loan.PaymentInfo) public payments;
```

### sortedPayments

```solidity
mapping(uint256 => Loan.SortedPayment) public sortedPayments;
```

### liquidationInfoFor

```solidity
mapping(uint16 => Loan.LiquidationInfo) public liquidationInfoFor;
```

### \_loans

```solidity
mapping(uint16 => Loan.Info) internal _loans;
```
