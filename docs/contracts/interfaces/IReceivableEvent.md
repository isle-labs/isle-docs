# IReceivableEvent

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/interfaces/IReceivableEvent.sol)

## Events

### AssetCreated

Emitted when mint a new receivable.

```solidity
event AssetCreated(
    address indexed buyer_,
    address indexed seller_,
    uint256 indexed tokenId_,
    uint256 faceAmount_,
    uint256 repaymentTimestamp_
);
```

**Parameters**

| Name                  | Type      | Description                                                                       |
| --------------------- | --------- | --------------------------------------------------------------------------------- |
| `buyer_`              | `address` | The address of the buyer that's expected to pay for this receivable.              |
| `seller_`             | `address` | The address of the seller that's expected to receive payment for this receivable. |
| `tokenId_`            | `uint256` | The id of the receivable.                                                         |
| `faceAmount_`         | `uint256` | The amount of the receivable.                                                     |
| `repaymentTimestamp_` | `uint256` | The timestamp when the receivable is expected to be repaid.                       |

### AssetBurned

Emitted when burn a receivable.

```solidity
event AssetBurned(uint256 indexed tokenId_);
```

**Parameters**

| Name       | Type      | Description               |
| ---------- | --------- | ------------------------- |
| `tokenId_` | `uint256` | The id of the receivable. |
