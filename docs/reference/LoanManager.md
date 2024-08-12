# LoanManager

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/LoanManager.sol)

**Inherits:** [ILoanManager](/docs/reference/interfaces/ILoanManager.md), IERC721Receiver,
[LoanManagerStorage](/docs/reference/LoanManagerStorage.md), ReentrancyGuard,
[VersionedInitializable](/docs/reference/libraries/upgradability/VersionedInitializable.md)

## State Variables

### LOAN_MANAGER_REVISION

```solidity
uint256 public constant LOAN_MANAGER_REVISION = 0x1;
```

### HUNDRED_PERCENT

```solidity
uint256 public constant HUNDRED_PERCENT = 1e6;
```

### SCALED_ONE

```solidity
uint256 private constant SCALED_ONE = 1e18;
```

### PRECISION

```solidity
uint256 public constant PRECISION = 1e27;
```

### ADDRESSES_PROVIDER

```solidity
IPoolAddressesProvider public immutable ADDRESSES_PROVIDER;
```

## Functions

### constructor

```solidity
constructor(IPoolAddressesProvider provider_);
```

### initialize

```solidity
function initialize(address asset_) external override initializer;
```

### whenNotPaused

_Can only be called when the function is not paused_

```solidity
modifier whenNotPaused();
```

### onlyPoolAdminOrGovernor

_Can only be called by the Pool Admin or the Governor_

```solidity
modifier onlyPoolAdminOrGovernor();
```

### onlyPoolAdmin

_Can only be called by the Pool Admin_

```solidity
modifier onlyPoolAdmin();
```

### onlyPoolConfigurator

_Can only be called by the PoolConfigurator_

```solidity
modifier onlyPoolConfigurator();
```

### getRevision

Returns the revision number of the contract

_Needs to be defined in the inherited class as a constant._

```solidity
function getRevision() public pure virtual override returns (uint256 revision_);
```

**Returns**

| Name        | Type      | Description         |
| ----------- | --------- | ------------------- |
| `revision_` | `uint256` | The revision number |

### onERC721Received

_Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom} by `operator` from
`from`, this function is called. It must return its Solidity selector to confirm the token transfer. If any other value
is returned or the interface is not implemented by the recipient, the transfer will be reverted. The selector can be
obtained in Solidity with `IERC721Receiver.onERC721Received.selector`._

```solidity
function onERC721Received(address, address, uint256, bytes calldata) external pure override returns (bytes4);
```

### getLoanInfo

Gets the loan info.

```solidity
function getLoanInfo(uint16 loanId_) external view returns (Loan.Info memory loan_);
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

**Returns**

| Name    | Type        | Description                                |
| ------- | ----------- | ------------------------------------------ |
| `loan_` | `Loan.Info` | Struct that contains the info of the loan. |

### accruedInterest

Gets the amount of interest up until this point in time.

```solidity
function accruedInterest() public view override returns (uint256 accruedInterest_);
```

**Returns**

| Name               | Type      | Description                                                 |
| ------------------ | --------- | ----------------------------------------------------------- |
| `accruedInterest_` | `uint256` | The amount of accrued interest up until this point in time. |

### assetsUnderManagement

Gets the total assets under management.

```solidity
function assetsUnderManagement() public view override returns (uint256 assetsUnderManagement_);
```

**Returns**

| Name                     | Type      | Description                                 |
| ------------------------ | --------- | ------------------------------------------- |
| `assetsUnderManagement_` | `uint256` | The total value of assets under management. |

### getLoanPaymentDetailedBreakdown

Gets the detailed payment breakdown of a loan up until this point in time.

```solidity
function getLoanPaymentDetailedBreakdown(
    uint16 loanId_
)
    public
    view
    override
    returns (uint256 principal_, uint256[2] memory interest_);
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

**Returns**

| Name         | Type         | Description                                                                                                |
| ------------ | ------------ | ---------------------------------------------------------------------------------------------------------- |
| `principal_` | `uint256`    | The principal due for the loan.                                                                            |
| `interest_`  | `uint256[2]` | Interest Parameter:</br> [0]: The interest due for the loan.</br> [1]: The late interest due for the loan. |

### getLoanPaymentBreakdown

Gets the payment breakdown of a loan up until this point in time.

```solidity
function getLoanPaymentBreakdown(uint16 loanId_) public view override returns (uint256 principal_, uint256 interest_);
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

**Returns**

| Name         | Type      | Description                          |
| ------------ | --------- | ------------------------------------ |
| `principal_` | `uint256` | The principal due for the loan.      |
| `interest_`  | `uint256` | The total interest due for the loan. |

### updateAccounting

Manually updates the accounting state of the pool.

```solidity
function updateAccounting() external whenNotPaused onlyPoolAdminOrGovernor;
```

### requestLoan

Used by buyer to request a loan from the pool with the following terms.

```solidity
function requestLoan(
    address receivableAsset_,
    uint256 receivablesTokenId_,
    uint256 gracePeriod_,
    uint256 principalRequested_,
    uint256[2] memory rates_
)
    external
    override
    whenNotPaused
    returns (uint16 loanId_);
```

**Parameters**

| Name                  | Type         | Description                                                                  |
| --------------------- | ------------ | ---------------------------------------------------------------------------- |
| `receivableAsset_`    | `address`    |                                                                              |
| `receivablesTokenId_` | `uint256`    | Token ID of the receivable that would be used as collateral.                 |
| `gracePeriod_`        | `uint256`    | Grace period of the loan.                                                    |
| `principalRequested_` | `uint256`    | Amount of principal requested by the buyer.                                  |
| `rates_`              | `uint256[2]` | Rates parameters:</br> [0]: interestRate.</br> [1]: lateInterestPremiumRate. |

**Returns**

| Name      | Type     | Description                     |
| --------- | -------- | ------------------------------- |
| `loanId_` | `uint16` | Id of the loan that is created. |

### fundLoan

Used by the pool admin to fund the loan requested by the buyer.

```solidity
function fundLoan(uint16 loanId_) external override nonReentrant whenNotPaused onlyPoolAdmin;
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### repayLoan

Repays the loan (note that the loan can be repaid early but not partially).

```solidity
function repayLoan(uint16 loanId_) external override whenNotPaused returns (uint256 principal_, uint256 interest_);
```

**Parameters**

| Name      | Type     | Description              |
| --------- | -------- | ------------------------ |
| `loanId_` | `uint16` | Id of the loan to repay. |

**Returns**

| Name         | Type      | Description              |
| ------------ | --------- | ------------------------ |
| `principal_` | `uint256` | Principal amount repaid. |
| `interest_`  | `uint256` | Interest amount repaid.  |

### withdrawFunds

Used by sellers to withdraw funds from a loan.

```solidity
function withdrawFunds(uint16 loanId_, address destination_) external override whenNotPaused;
```

**Parameters**

| Name           | Type      | Description                            |
| -------------- | --------- | -------------------------------------- |
| `loanId_`      | `uint16`  | Id of the loan to withdraw funds from. |
| `destination_` | `address` | The destination address for the funds. |

### impairLoan

Impairs the loan.

```solidity
function impairLoan(uint16 loanId_) external override whenNotPaused onlyPoolAdminOrGovernor;
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### removeLoanImpairment

Removes the impairment on the loan.

```solidity
function removeLoanImpairment(uint16 loanId_) external override nonReentrant whenNotPaused onlyPoolAdminOrGovernor;
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### triggerDefault

Triggers the default of a loan.

```solidity
function triggerDefault(
    uint16 loanId_
)
    external
    override
    whenNotPaused
    onlyPoolConfigurator
    returns (uint256 remainingLosses_, uint256 protocolFees_);
```

**Parameters**

| Name      | Type     | Description                           |
| --------- | -------- | ------------------------------------- |
| `loanId_` | `uint16` | The id of the loan that is triggered. |

**Returns**

| Name               | Type      | Description                     |
| ------------------ | --------- | ------------------------------- |
| `remainingLosses_` | `uint256` | The amount of remaining losses. |
| `protocolFees_`    | `uint256` | The amount of protocol fees.    |

### \_getIssuance

```solidity
function _getIssuance(uint256 issuanceRate_, uint256 interval_) internal pure returns (uint256 issuance_);
```

### \_getInterestBreakdown

```solidity
function _getInterestBreakdown(
    uint256 currentTime_,
    uint256 startDate_,
    uint256 dueDate_,
    uint256 principal_,
    uint256 interestRate_,
    uint256 lateInterestPremiumRate_
)
    internal
    pure
    returns (uint256[2] memory interest_);
```

### \_getInterest

```solidity
function _getInterest(
    uint256 principal_,
    uint256 interestRate_,
    uint256 interval_
)
    internal
    pure
    returns (uint256 interest_);
```

### \_getLateInterest

```solidity
function _getLateInterest(
    uint256 currentTime_,
    uint256 principal_,
    uint256 interestRate_,
    uint256 dueDate_,
    uint256 lateInterestPremiumRate_
)
    internal
    pure
    returns (uint256 lateInterest_);
```

### \_getPeriodicInterestRate

```solidity
function _getPeriodicInterestRate(
    uint256 interestRate_,
    uint256 interval_
)
    internal
    pure
    returns (uint256 periodicInterestRate_);
```

### \_poolConfigurator

```solidity
function _poolConfigurator() internal view returns (address poolConfigurator_);
```

### \_globals

```solidity
function _globals() internal view returns (address globals_);
```

### \_governor

```solidity
function _governor() internal view returns (address governor_);
```

### \_poolAdmin

```solidity
function _poolAdmin() internal view returns (address poolAdmin_);
```

### \_pool

```solidity
function _pool() internal view returns (address pool_);
```

### \_vault

```solidity
function _vault() internal view returns (address vault_);
```

### \_advanceGlobalPaymentAccounting

```solidity
function _advanceGlobalPaymentAccounting() internal;
```

### \_updateIssuanceParams

```solidity
function _updateIssuanceParams(uint256 issuanceRate_, uint112 accountedInterest_) internal;
```

### \_compareAndSubtractAccountedInterest

```solidity
function _compareAndSubtractAccountedInterest(uint256 amount_) internal;
```

### \_getAccruedAmount

```solidity
function _getAccruedAmount(
    uint256 totalAccruingAmount_,
    uint256 startTime_,
    uint256 endTime_,
    uint256 currentTime_
)
    internal
    pure
    returns (uint256 accruedAmount_);
```

### \_getDefaultInterestAndFees

```solidity
function _getDefaultInterestAndFees(
    uint16 loanId_,
    Loan.PaymentInfo memory paymentInfo_
)
    internal
    view
    returns (uint256 netInterest_, uint256 netLateInterest_, uint256 protocolFees_);
```

### \_getInterestAndFeesFromLiquidationInfo

```solidity
function _getInterestAndFeesFromLiquidationInfo(
    uint16 loanId_
)
    internal
    view
    returns (uint256 netInterest_, uint256 netLateInterest_, uint256 protocolFees_);
```

### \_getNetInterest

```solidity
function _getNetInterest(uint256 interest_, uint256 feeRate_) internal pure returns (uint256 netInterest_);
```

### \_getPaymentAccruedInterest

```solidity
function _getPaymentAccruedInterest(
    uint256 startTime_,
    uint256 endTime_,
    uint256 paymentIssuanceRate_
)
    internal
    pure
    returns (uint256 accruedInterest_);
```

### \_accountToEndOfPayment

```solidity
function _accountToEndOfPayment(
    uint256 paymentId_,
    uint256 issuanceRate_,
    uint256 intervalStart_,
    uint256 intervalEnd_
)
    internal
    returns (uint256 accountedInterestIncrease_, uint256 issuanceRateReduction_);
```

### \_deletePayment

```solidity
function _deletePayment(uint16 loanId_) internal;
```

### \_handlePaymentAccounting

```solidity
function _handlePaymentAccounting(uint16 loanId_) internal returns (uint256 issuanceRate_);
```

### \_queuePayment

```solidity
function _queuePayment(uint16 loanId_, uint256 startDate_, uint256 dueDate_) internal returns (uint256 newRate_);
```

### \_reverseLoanImpairment

```solidity
function _reverseLoanImpairment(Loan.LiquidationInfo memory liquidationInfo_) internal;
```

### \_addPaymentToList

```solidity
function _addPaymentToList(uint48 paymentDueDate_) internal returns (uint24 paymentId_);
```

### \_removePaymentFromList

```solidity
function _removePaymentFromList(uint256 paymentId_) internal;
```

### \_distributeClaimedFunds

```solidity
function _distributeClaimedFunds(uint16 loanId_, uint256 principal_, uint256 interest_) internal;
```

### \_handleDefault

```solidity
function _handleDefault(
    uint16 loanId_,
    uint256 netInterest_,
    uint256 netLateInterest_
)
    internal
    returns (uint256 remainingLosses_);
```

### \_revertIfPaused

```solidity
function _revertIfPaused() internal view;
```

### \_revertIfNotPoolAdminOrGovernor

```solidity
function _revertIfNotPoolAdminOrGovernor() internal view;
```

### \_revertIfNotPoolAdmin

```solidity
function _revertIfNotPoolAdmin() internal view;
```

### \_revertIfNotPoolConfigurator

```solidity
function _revertIfNotPoolConfigurator() internal view;
```

### \_revertIfCallerNotReceivableBuyer

```solidity
function _revertIfCallerNotReceivableBuyer(address buyer_) internal view;
```

### \_revertIfInvalidReceivable

```solidity
function _revertIfInvalidReceivable(
    uint256 receivablesTokenId_,
    address buyer_,
    address seller_,
    uint256 repaymentTimestamp_
)
    internal
    view;
```

### \_min

```solidity
function _min(uint256 a_, uint256 b_) internal pure returns (uint256 minimum_);
```
