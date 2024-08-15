# Errors

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/libraries/Errors.sol)

## Errors

### InvalidCaller

Thrown when `msg.sender` is not the expected one.

```solidity
error InvalidCaller(address caller, address expectedCaller);
```

### CallerNotGovernor

Thrown when `msg.sender` is not the governor.

```solidity
error CallerNotGovernor(address governor_, address caller_);
```

### NotPoolAdminOrGovernor

Thrown when `msg.sender` is neither the pool admin nor the governor.

```solidity
error NotPoolAdminOrGovernor(address caller_);
```

### NotPoolAdmin

Thrown when `msg.sender` is not the pool admin.

```solidity
error NotPoolAdmin(address caller_);
```

### NotPoolConfigurator

Thrown when `msg.sender` is not the pool configurator.

```solidity
error NotPoolConfigurator(address caller_);
```

### InvalidAddressesProvider

```solidity
error InvalidAddressesProvider(address provider, address expectedProvider);
```

### FunctionPaused

```solidity
error FunctionPaused(bytes4 sig);
```

### ProtocolPaused

```solidity
error ProtocolPaused();
```

### AddressesProviderZeroAddress

Thrown when pool addresses provider is set to 0.

```solidity
error AddressesProviderZeroAddress();
```

### PoolConfigurator_InvalidPoolAdmin

Thrown when the pool admin set is not on the whitelist.

```solidity
error PoolConfigurator_InvalidPoolAdmin(address poolAdmin_);
```

### PoolConfigurator_InvalidPoolAsset

Thrown when the asset set is not on the whitelist.

```solidity
error PoolConfigurator_InvalidPoolAsset(address asset_);
```

### PoolConfigurator_CallerNotLoanManager

Thrown when `msg.sender` is not the loan manager.

```solidity
error PoolConfigurator_CallerNotLoanManager(address expectedCaller_, address caller_);
```

### PoolConfigurator_CallerNotPoolAdminOrGovernor

Thrown when caller is not pool admin or governor.

```solidity
error PoolConfigurator_CallerNotPoolAdminOrGovernor(address caller_);
```

### PoolConfigurator_CallerNotPoolAdmin

Thrown when caller is not pool admin.

```solidity
error PoolConfigurator_CallerNotPoolAdmin(address caller_);
```

### PoolConfigurator_CallerNotGovernor

Thrown when caller is not governor.

```solidity
error PoolConfigurator_CallerNotGovernor(address caller_);
```

### PoolConfigurator_PoolSupplyZero

Thrown when the total supply of the pool is zero.

```solidity
error PoolConfigurator_PoolSupplyZero();
```

### PoolConfigurator_InsufficientCover

Thrown when the pool cover is insufficient.

```solidity
error PoolConfigurator_InsufficientCover();
```

### PoolConfigurator_InsufficientLiquidity

Thrown when the pool has insufficient liquidity to fund new loans.

```solidity
error PoolConfigurator_InsufficientLiquidity();
```

### PoolConfigurator_NoAllowance

Thrown when the spender has no allowance from the owner.

```solidity
error PoolConfigurator_NoAllowance(address owner_, address spender_);
```

### PoolConfigurator_PoolApproveWithdrawalManagerFailed

Thrown when the pool fails to approve the withdrawal manager with the amount of shares.

```solidity
error PoolConfigurator_PoolApproveWithdrawalManagerFailed(uint256 amount_);
```

### PoolConfigurator_Paused

Thrown when the pool configurator is paused.

```solidity
error PoolConfigurator_Paused();
```

### PoolAddressesProvider_InvalidGlobals

Thrown when IsleGlobals is set to 0.

```solidity
error PoolAddressesProvider_InvalidGlobals(address globals);
```

### Globals_InvalidVault

Thrown when vault is set to 0.

```solidity
error Globals_InvalidVault(address vault);
```

### LoanManager_CallerNotSeller

Thrown when `msg.sender` is not the seller.

```solidity
error LoanManager_CallerNotSeller(address expectedSeller_);
```

### LoanManager_InvalidReceivable

Thrown when buyer approves an invalid receivable (either buyer or seller is not whitelisted or repayment timestamp is in
the past).

```solidity
error LoanManager_InvalidReceivable(uint256 receivablesTokenId_);
```

### LoanManager_PrincipalRequestedTooHigh

Thrown when the buyer requests for a principal larger than the face amount of the receivable.

```solidity
error LoanManager_PrincipalRequestedTooHigh(uint256 principalRequested_, uint256 maxPrincipal_);
```

### LoanManager_Overdraw

Thrown when the seller overdraws.

```solidity
error LoanManager_Overdraw(uint16 loanId_, uint256 amount_, uint256 withdrawableAmount_);
```

### LoanManager_NotLoan

Thrown when the loan id is invalid.

```solidity
error LoanManager_NotLoan(uint16 loanId_);
```

### LoanManager_LoanImpaired

Thrown when the loan is already impaired.

```solidity
error LoanManager_LoanImpaired(uint16 loanId_);
```

### LoanManager_LoanNotImpaired

Thrown when the loan is not impaired.

```solidity
error LoanManager_LoanNotImpaired(uint16 loanId_);
```

### LoanManager_PastDueDate

Thrown when the loan is past due date.

```solidity
error LoanManager_PastDueDate(uint16 loanId_, uint256 dueDate_, uint256 currentTimestamp_);
```

### LoanManager_ReceivableAssetNotAllowed

Thrown when the receivable asset is not allowed.

```solidity
error LoanManager_ReceivableAssetNotAllowed(address receivableAsset_);
```

### LoanManager_NotPastDueDatePlusGracePeriod

Thrown when current time is not past due date plus grace period.

```solidity
error LoanManager_NotPastDueDatePlusGracePeriod(uint16 loanId_);
```

### LoanManager_CallerNotReceivableBuyer

Thrown when `msg.sender` is not the buyer.

```solidity
error LoanManager_CallerNotReceivableBuyer(address expectedBuyer_);
```

### LoanManager_AssetZeroAddress

Thrown when an asset address is set to 0 for a loan manager.

```solidity
error LoanManager_AssetZeroAddress();
```

### WithdrawalManager_ZeroWindow

Thrown when the window duration set is 0.

```solidity
error WithdrawalManager_ZeroWindow();
```

### WithdrawalManager_WindowGreaterThanCycle

Thrown when the window duration set is larger than the cycle duration.

```solidity
error WithdrawalManager_WindowGreaterThanCycle();
```

### WithdrawalManager_WithdrawalPending

Thrown when the withdrawal is still pending.

```solidity
error WithdrawalManager_WithdrawalPending(address owner_);
```

### WithdrawalManager_NoOp

Thrown when the action results in no change.

```solidity
error WithdrawalManager_NoOp(address owner_);
```

### WithdrawalManager_Overremove

Thrown when the owner removes more shares than they have.

```solidity
error WithdrawalManager_Overremove(address owner_, uint256 shares_, uint256 lockedShares_);
```

### WithdrawalManager_NoRequest

Thrown when the owner has no withdrawal request (that is locked shares is zero).

```solidity
error WithdrawalManager_NoRequest(address owner_);
```

### WithdrawalManager_InvalidShares

Thrown when the shares a owner requests to withdraw differs from their withdrawal request.

```solidity
error WithdrawalManager_InvalidShares(address owner_, uint256 requestedShares_, uint256 lockedShares_);
```

### WithdrawalManager_NotInWindow

Thrown when the current time is not in the owner's withdrawal window.

```solidity
error WithdrawalManager_NotInWindow(uint256 currentTimestamp_, uint256 windowStart_, uint256 windowEnd_);
```

### Pool_ZeroAsset

Thrown when an asset address is 0.

```solidity
error Pool_ZeroAsset();
```

### Pool_ZeroConfigurator

Thrown when pool configurator address is set to 0.

```solidity
error Pool_ZeroConfigurator();
```

### Pool_FailedApprove

Thrown when the asset fails to approve the pool configurator with max amount.

```solidity
error Pool_FailedApprove();
```

### Pool_RecipientZeroAddress

Thrown when the receiver address is 0.

```solidity
error Pool_RecipientZeroAddress();
```

### Pool_DepositGreaterThanMax

Thrown when the deposit amount is greater than the max deposit.

```solidity
error Pool_DepositGreaterThanMax(uint256 assets, uint256 maxDeposit);
```

### Pool_MintGreaterThanMax

Thrown when the mint amount is greater than the max mint.

```solidity
error Pool_MintGreaterThanMax(uint256 shares, uint256 maxMint);
```

### Pool_InsufficientPermit

Thrown when the assets is greater than the max amount to deposit.

```solidity
error Pool_InsufficientPermit(uint256 assets, uint256 permits);
```

### Pool_RedeemMoreThanMax

Thrown when the redeem shares is greater than the max redeem amount.

```solidity
error Pool_RedeemMoreThanMax(uint256 shares, uint256 maxRedeem);
```

### Pool_WithdrawalNotImplemented

Thrown when anyone calls the `previewWithdraw` function.

```solidity
error Pool_WithdrawalNotImplemented();
```
