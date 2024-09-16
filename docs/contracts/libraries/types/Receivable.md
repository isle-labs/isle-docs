# Receivable

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/libraries/types/DataTypes.sol)

Namespace for the structs used in
[Receivable](/docs/reference/libraries/types/Receivable.md)

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

**Properties**

| Name                 | Type      | Description                                                                                     |
| -------------------- | --------- | ----------------------------------------------------------------------------------------------- |
| `buyer`              | `address` | The address of the buyer that's expected to pay for this receivable.                            |
| `seller`             | `address` | The address of the seller that's expected to receive payment for this receivable.               |
| `faceAmount`         | `uint256` | The amount of the receivable.                                                                   |
| `repaymentTimestamp` | `uint256` | The timestamp when the receivable is expected to be repaid.                                     |
| `currencyCode`       | `uint16`  | The currency code specified by ISO 4217 in which the receivable is expressed, e.g. 840 for USD. |

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
