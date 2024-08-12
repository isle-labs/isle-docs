# WithdrawalManagerStorage

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/WithdrawalManagerStorage.sol)

**Inherits:**
[IWithdrawalManagerStorage](/docs/reference/interfaces/IWithdrawalManagerStorage.md)

## State Variables

### latestConfigId

```solidity
uint256 public override latestConfigId;
```

### cycleConfigs

```solidity
mapping(uint256 => WithdrawalManager.CycleConfig) internal cycleConfigs;
```

### exitCycleId

```solidity
mapping(address => uint256) public override exitCycleId;
```

### lockedShares

```solidity
mapping(address => uint256) public override lockedShares;
```

### totalCycleShares

```solidity
mapping(uint256 => uint256) public override totalCycleShares;
```
