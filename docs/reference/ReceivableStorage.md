# ReceivableStorage

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference)

## State Variables

### isleGlobals

```solidity
address public isleGlobals;
```

### \_tokenIdCounter

```solidity
uint256 internal _tokenIdCounter;
```

### idToReceivableInfo

```solidity
mapping(uint256 => Receivable.Info) public idToReceivableInfo;
```

### \_\_gap

_This empty reserved space is put in place to allow future versions to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps_

```solidity
uint256[100] private __gap;
```
