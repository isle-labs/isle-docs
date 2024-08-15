# ReceivableStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/ReceivableStorage.sol)

## State Variables

### \_tokenIdCounter

```solidity
uint256 internal _tokenIdCounter;
```

### idToReceivableInfo

```solidity
mapping(uint256 => Receivable.Info) public idToReceivableInfo;
```

### \_\_gap

_This empty reserved space is put in place to allow future versions to add new variables without shifting down storage
in the inheritance chain. See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps_

```solidity
uint256[100] private __gap;
```
