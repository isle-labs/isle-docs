# WithdrawalManagerStorage

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/contracts/reference)

**Inherits:**
[IWithdrawalManagerStorage](/docs/contracts/reference/interfaces/IWithdrawalManagerStorage.md)

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
