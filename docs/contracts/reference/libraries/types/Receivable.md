# Receivable

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference/libraries/types)

Namespace for the structs used in {Receivable}

## Structs

### Create

```solidity
struct Create {
    address buyer;
    address seller;
    uint256 faceAmount;
    uint256 repaymentTimestamp;
    uint16 currencyCode;
}
```

### Info

```solidity
struct Info {
    address buyer;
    address seller;
    uint256 faceAmount;
    uint256 repaymentTimestamp;
    bool isValid;
    uint16 currencyCode;
}
```
