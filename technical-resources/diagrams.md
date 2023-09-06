# Diagrams

## Contract Architecture

Architecture of all smart contracts&#x20;

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

## Scenarios

A collection of scenarios to help you understand how Lopo protocol works from end to end

### Seller mints receivables NFT

```mermaid
flowchart LR;
  S((Seller))
  R[Receivables]
  S -- "mintReceivable" --> R
  R -- "transferReceivable" --> S
```

### Pool Admin onboards buyer and seller for its pool

```mermaid
flowchart LR;
  PA((Pool Admin))
  LM[Loan Manager]
  PA -- "onboardBuyer" --> LM
  PA -- "onboardSeller" --> LM
```

### Buyer approves a loan to created for the receivable

```mermaid
flowchart LR;
  B((Buyer))
  LM[LoanManager]
  B -- "approveLoan" --> LM
```

### Pool Admin funds loan

```mermaid
flowchart LR;
  PM((PoolAdmin))
  PC((PoolConfigurator))
  LM[LoanManager]
  P[Pool]
  PM -- "fundLoan" --> LM
  LM -- "requestFunds" --> PC
  PC -- "transferFrom" --> P
  P -- "transferFunds" --> LM  
```

### Seller withdraws funds

```mermaid
flowchart LR
  S((Seller))
  LM((LoanManager))
  S -- "drawdownFunds" --> LM
  S -- "transferReceivables" --> LM
  LM -- "transferFunds" --> S
  
```

### Buyer repays loan

```mermaid
flowchart LR
  B((Buyer))
  LM[LoanManager]
  T[Treasury]
  PA((Pool Admin))
  P[Pool]
  B -- "repayLoan" --> LM
  B -- "transferFunds" --> LM
  LM -- "transferFunds" --> PA
  LM -- "transferFunds" --> P
  LM -- "transferFunds" --> T
```

### LP deposits funds

```mermaid
flowchart LR
  LP((LP))
  P[Pool]
  LP -- "deposit" --> P
  LP -- "transferFunds" --> P
  P -- "transferShares" --> LP
```

### LP requests redeem

```mermaid
flowchart LR
  LP((LP))
  P[Pool]
  PC[PoolConfigurator]
  WM[WithdrawalManager]
  LP -- "requestRedeem" --> P
  P -- "requestRedeem" --> PC
  PC -- "addShares" --> WM
  LP -- "transferShares" --> WM
```

### LP redeems

```mermaid
flowchart LR
  LP((LP))
  P[Pool]
  PC[PoolConfigurator]
  WM[WithdrawalManager]
  LP -- "redeem" --> P
  P -- "processRedeem" --> PC
  PC -- "processExit" --> WM
  P -- "transferFunds" --> LP
```

