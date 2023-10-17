# Loan

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/libraries/types)

Namespace for the structs used in {LoanManager}

## Structs

### Info

```solidity
struct Info {
    address buyer;
    address seller;
    address collateralAsset;
    uint256 collateralTokenId;
    uint256 principal;
    uint256 drawableFunds;
    uint256 interestRate;
    uint256 lateInterestPremiumRate;
    uint256 startDate;
    uint256 dueDate;
    uint256 originalDueDate;
    uint256 gracePeriod;
    bool isImpaired;
}
```

### LiquidationInfo

```solidity
struct LiquidationInfo {
    bool triggeredByGovernor;
    uint128 principal;
    uint120 interest;
    uint256 lateInterest;
    uint96 protocolFees;
}
```

### PaymentInfo

```solidity
struct PaymentInfo {
    uint24 protocolFee;
    uint24 adminFee;
    uint48 startDate;
    uint48 dueDate;
    uint128 incomingNetInterest;
    uint256 issuanceRate;
}
```

### SortedPayment

```solidity
struct SortedPayment {
    uint24 previous;
    uint24 next;
    uint48 paymentDueDate;
}
```

### Impairment

```solidity
struct Impairment {
    uint40 impairedDate;
    bool impariedByGovernor;
}
```
