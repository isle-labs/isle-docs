# Loan

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/libraries/types/DataTypes.sol)

Namespace for the structs used in {LoanManager}

## Structs

### Info

```solidity
struct Info {
    address buyer;
    address seller;
    address receivableAsset;
    uint256 receivableTokenId;
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
