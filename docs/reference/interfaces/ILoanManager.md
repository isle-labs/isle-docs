# ILoanManager

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

**Inherits:**
[ILoanManagerEvents](/docs/reference/interfaces/ILoanManagerEvents.md), [ILoanManagerStorage](/docs/reference/interfaces/ILoanManagerStorage.md)

Creates and manages loans.

## Functions

### getLoanInfo

Gets the loan info

```solidity
function getLoanInfo(uint16 loanId_) external view returns (Loan.Info memory loan_);
```

**Parameters**

| Name      | Type     | Description        |
| --------- | -------- | ------------------ |
| `loanId_` | `uint16` | The id of the loan |

**Returns**

| Name    | Type        | Description                               |
| ------- | ----------- | ----------------------------------------- |
| `loan_` | `Loan.Info` | Struct that contains the info of the loan |

### accruedInterest

Gets the amounf of interest up until this point in time

```solidity
function accruedInterest() external view returns (uint256 accruedInterest_);
```

**Returns**

| Name               | Type      | Description                                                |
| ------------------ | --------- | ---------------------------------------------------------- |
| `accruedInterest_` | `uint256` | The amount of accrued interest up until this point in time |

### assetsUnderManagement

Gets the total assets under management

```solidity
function assetsUnderManagement() external view returns (uint256 assetsUnderManagement_);
```

**Returns**

| Name                     | Type      | Description                       |
| ------------------------ | --------- | --------------------------------- |
| `assetsUnderManagement_` | `uint256` | The total assets under management |

### getLoanPaymentDetailedBreakdown

Gets the detailed payment breakdown of a loan up until this point in time

```solidity
function getLoanPaymentDetailedBreakdown(uint16 loanId_)
    external
    view
    returns (uint256 principal_, uint256[2] memory interest_);
```

**Parameters**

| Name      | Type     | Description        |
| --------- | -------- | ------------------ |
| `loanId_` | `uint16` | The id of the loan |

**Returns**

| Name         | Type         | Description                                                                                   |
| ------------ | ------------ | --------------------------------------------------------------------------------------------- |
| `principal_` | `uint256`    | The principal due for the loan                                                                |
| `interest_`  | `uint256[2]` | Interest Parameter [0]: The interest due for the loan [1]: The late interest due for the loan |

### getLoanPaymentBreakdown

Gets the payment breakdown of a loan up until this point in time

```solidity
function getLoanPaymentBreakdown(uint16 loanId_) external view returns (uint256 principal_, uint256 interest_);
```

**Parameters**

| Name      | Type     | Description        |
| --------- | -------- | ------------------ |
| `loanId_` | `uint16` | The id of the loan |

**Returns**

| Name         | Type      | Description                    |
| ------------ | --------- | ------------------------------ |
| `principal_` | `uint256` | The principal due for the loan |
| `interest_`  | `uint256` | The interest due for the loan  |

### updateAccounting

Manually updates the accounting state of the pool

```solidity
function updateAccounting() external;
```

### approveLoan

Approves loan to be created with the following terms.

```solidity
function approveLoan(
    address collateralAsset_,
    uint256 receivablesTokenId_,
    uint256 gracePeriod_,
    uint256 principalRequested_,
    uint256[2] memory rates_
)
    external
    returns (uint16 loanId_);
```

**Parameters**

| Name                  | Type         | Description                                                        |
| --------------------- | ------------ | ------------------------------------------------------------------ |
| `collateralAsset_`    | `address`    |                                                                    |
| `receivablesTokenId_` | `uint256`    | Token ID of the receivable that would be used as collateral        |
| `gracePeriod_`        | `uint256`    | Grace period for the loan                                          |
| `principalRequested_` | `uint256`    | Amount of principal approved by the buyer                          |
| `rates_`              | `uint256[2]` | Rates parameters: [0]: interestRate, [1]: lateInterestPremiumRate, |

**Returns**

| Name      | Type     | Description                    |
| --------- | -------- | ------------------------------ |
| `loanId_` | `uint16` | Id of the loan that is created |

### fundLoan

Funds the loan

```solidity
function fundLoan(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description        |
| --------- | -------- | ------------------ |
| `loanId_` | `uint16` | The id of the loan |

### withdrawFunds

Withdraw the funds from a loan.

```solidity
function withdrawFunds(uint16 loanId_, address destination_, uint256 amount_) external;
```

**Parameters**

| Name           | Type      | Description                           |
| -------------- | --------- | ------------------------------------- |
| `loanId_`      | `uint16`  | Id of the loan to withdraw funds from |
| `destination_` | `address` | The destination address for the funds |
| `amount_`      | `uint256` | The amount to withdraw                |

### repayLoan

Repays the loan. (note that the loan can be repaid early but not partially)

```solidity
function repayLoan(uint16 loanId_) external returns (uint256 principal_, uint256 interest_);
```

**Parameters**

| Name      | Type     | Description             |
| --------- | -------- | ----------------------- |
| `loanId_` | `uint16` | Id of the loan to repay |

**Returns**

| Name         | Type      | Description             |
| ------------ | --------- | ----------------------- |
| `principal_` | `uint256` | Principal amount repaid |
| `interest_`  | `uint256` | Interest amount repaid  |

### impairLoan

Impairs the loan

```solidity
function impairLoan(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description        |
| --------- | -------- | ------------------ |
| `loanId_` | `uint16` | The id of the loan |

### removeLoanImpairment

Removes the impairment on the loan

```solidity
function removeLoanImpairment(uint16 loanId_) external;
```

**Parameters**

| Name      | Type     | Description        |
| --------- | -------- | ------------------ |
| `loanId_` | `uint16` | The id of the loan |

### triggerDefault

Triggers the default of a loan

```solidity
function triggerDefault(uint16 loanId_) external returns (uint256 remainingLosses_, uint256 protocolFees_);
```

**Parameters**

| Name      | Type     | Description                          |
| --------- | -------- | ------------------------------------ |
| `loanId_` | `uint16` | The id of the loan that is triggered |

**Returns**

| Name               | Type      | Description                    |
| ------------------ | --------- | ------------------------------ |
| `remainingLosses_` | `uint256` | The amount of remaining losses |
| `protocolFees_`    | `uint256` | The amount of protocol fees    |
