# ILoanManager

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/interfaces/ILoanManager.sol)

**Inherits:** [ILoanManagerEvents](/docs/reference/interfaces/ILoanManagerEvents.md),
[ILoanManagerStorage](/docs/reference/interfaces/ILoanManagerStorage.md)

Creates and manages loans.

## Functions

### initialize

Initializes the loan manager.

```solidity
function initialize(address asset_) external;
```

**Parameters**

| Name     | Type      | Description                                 |
| -------- | --------- | ------------------------------------------- |
| `asset_` | `address` | The address of the asset used for the pool. |

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
function accruedInterest() external view returns (uint256 accruedInterest_);
```

**Returns**

| Name               | Type      | Description                                                 |
| ------------------ | --------- | ----------------------------------------------------------- |
| `accruedInterest_` | `uint256` | The amount of accrued interest up until this point in time. |

### assetsUnderManagement

Gets the total assets under management.

```solidity
function assetsUnderManagement() external view returns (uint256 assetsUnderManagement_);
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
    external
    view
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
function getLoanPaymentBreakdown(uint16 loanId_) external view returns (uint256 principal_, uint256 interest_);
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
function updateAccounting() external;
```

### fundLoan

Used by the pool admin to fund the loan requested by the buyer.

```solidity
function fundLoan(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### impairLoan

Impairs the loan.

```solidity
function impairLoan(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### removeLoanImpairment

Removes the impairment on the loan.

```solidity
function removeLoanImpairment(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description         |
| --------- | -------- | ------------------- |
| `loanId_` | `uint16` | The id of the loan. |

### triggerDefault

Triggers the default of a loan.

```solidity
function triggerDefault(uint16 loanId_) external returns (uint256 remainingLosses_, uint256 protocolFees_);
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
    returns (uint16 loanId_);
```

**Parameters**

| Name                  | Type         | Description                                                                  |
| --------------------- | ------------ | ---------------------------------------------------------------------------- |
| `receivableAsset_`    | `address`    | The address of the receivableAsset                                           |
| `receivablesTokenId_` | `uint256`    | Token ID of the receivable that would be used as collateral.                 |
| `gracePeriod_`        | `uint256`    | Grace period of the loan.                                                    |
| `principalRequested_` | `uint256`    | Amount of principal requested by the buyer.                                  |
| `rates_`              | `uint256[2]` | Rates parameters:</br> [0]: interestRate.</br> [1]: lateInterestPremiumRate. |

**Returns**

| Name      | Type     | Description                     |
| --------- | -------- | ------------------------------- |
| `loanId_` | `uint16` | Id of the loan that is created. |

### repayLoan

Repays the loan (note that the loan can be repaid early but not partially).

```solidity
function repayLoan(uint16 loanId_) external returns (uint256 principal_, uint256 interest_);
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
function withdrawFunds(uint16 loanId_, address destination_) external;
```

**Parameters**

| Name           | Type      | Description                            |
| -------------- | --------- | -------------------------------------- |
| `loanId_`      | `uint16`  | Id of the loan to withdraw funds from. |
| `destination_` | `address` | The destination address for the funds. |
