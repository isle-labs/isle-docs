# Diagrams

## Contract Architecture

Architecture of all smart contracts&#x20;

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

## Scenarios

A collection of scenarios to help you understand how Isle Finance works from end to end

### Borrowing

#### Seller mints receivables NFT

```mermaid
flowchart LR;
  S((Seller))
  R[Receivables]
  S -- "mintReceivable" --> R
  R -- "transferReceivable" --> S
```

#### Buyer requests for a loan to be created for the receivable

```mermaid
flowchart LR;
  B((Buyer))
  LM[LoanManager]
  B -- "requestLoan" --> LM
```

#### Pool Admin funds loan

```mermaid
flowchart LR;
  PM((PoolAdmin))
  PC[PoolConfigurator]
  LM[LoanManager]
  P[Pool]
  PM -- "fundLoan" --> LM
  LM -- "requestFunds" --> PC
  PC -- "transferFrom" --> P
  P -- "transferFunds" --> LM
```

#### Seller withdraws funds by submitting the invoice

```mermaid
flowchart LR
  S((Seller))
  LM((LoanManager))
  S -- "withdrawFunds" --> LM
  S -- "transferReceivables" --> LM
  LM -- "transferFunds" --> S

```

#### Buyer repays loan

```mermaid
flowchart LR
  B((Buyer))
  LM[LoanManager]
  TV[Treasury Vault]
  PA((Pool Admin))
  P[Pool]
  B -- "repayLoan" --> LM
  B -- "transferFunds" --> LM
  LM -- "transferFunds" --> PA
  LM -- "transferFunds" --> P
  LM -- "transferFunds" --> TV
```

### Lending

#### Lender deposits funds

```mermaid
flowchart LR
  LP((Lender))
  P[Pool]
  LP -- "deposit" --> P
  LP -- "transferFunds" --> P
  P -- "transferShares" --> LP
```

#### Lender requests redemption

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

#### Lender redeems funds

```mermaid
flowchart LR
  LP((Lender))
  P[Pool]
  PC[PoolConfigurator]
  WM[WithdrawalManager]
  LP -- "redeem" --> P
  P -- "processRedeem" --> PC
  PC -- "processExit" --> WM
  P -- "transferFunds" --> LP
```

### Pool Configuration

{% hint style="info" %}
There could be multiple sellers, but only a single buyer for a pool.
{% endhint %}

```mermaid
flowchart LR;
  PA((Pool Admin))
  PC[Pool Configurator]
  PA -- "setBuyer" --> PC
  PA -- "setValidSeller" --> PC
  PA -- "setValidLender" --> PC
  PA -- "setOpenToPublic" --> PC
  PA -- "setAdminFee" --> PC

```

```mermaid
flowchart LR
  GV((Governor))
  PC[Pool Configurator]
  GV -- "setPoolLimit" --> PC
  GV -- "setMaxCoverLiquidation" --> PC
  GV -- "setMinCover" --> PC
```
