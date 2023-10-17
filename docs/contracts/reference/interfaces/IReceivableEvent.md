# IReceivableEvent

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference/interfaces)

## Events

### AssetCreated

```solidity
event AssetCreated(
    address indexed buyer_,
    address indexed seller_,
    uint256 indexed tokenId_,
    uint256 faceAmount_,
    uint256 repaymentTimestamp_
);
```

### AssetBurned

```solidity
event AssetBurned(uint256 indexed tokenId_);
```

### IsleGlobalsSet

```solidity
event IsleGlobalsSet(address indexed previousIsleGlobals_, address indexed currentIsleGlobals_);
```
