---
description: Pay the suppliers early and repay later
---

# Buyers

## Overview

Buyers are companies that seek financing for their suppliers. They can approve receivables, which enable their suppliers to receive direct financing through the pool. Before the expiration of the receivables, the corresponding buyers will then make repayments back to the pool. Since they are the ones making the repayment, the **credibility of the buyers** are the most important metric for investors.&#x20;

## Buyer Onboarding

After a pool is created, the **Pool Admin** should conduct due diligence on the buyer and assign the buyer to the pool.&#x20;

## Approving Receivables

{% hint style="info" %}
We expect buyers and the Pool Admin to negotiate terms offline so as to minimize unneeded expenditure.
{% endhint %}

After buyers negotiate the terms with the **Pool Admin,** they should approve the receivables for funding with the following terms.

- **Collateral ID:** The token ID of the receivable NFT to approve
- **PrincipalRequested**: The amount of funds for the seller to withdraw

$$
Principal = FaceAmount \times (1 - DiscountRate)
$$

- **Interest Rate**: The interest rate applied on the principal (must be larger than the **Base Rate** of the pool)
- **Late Interest Rate Premium**: The extra interest rate that will be applied if the buyer is late on repayment
- **Grace Period**: The length of time after the due date during which payment may be made with an additional late interest rate premium
- **Repayment Date:** The repayment date of the receivable
- **Recipient**: The supplier who is able to withdraw the funds

{% hint style="info" %}
**Discount Rate** will be determined in the negotiation process and should typically be in the range of 0% \~ 50% depending on the industry of the buyer and seller.
{% endhint %}

The **Discount Rate** will differ for each receivable and the principal provided for each invoice will follow the following table.

<table><thead><tr><th width="122">Invoice</th><th>Discount Rate</th><th>Face Amount</th><th>Principal</th></tr></thead><tbody><tr><td>Inv-1</td><td>15%</td><td>$100,000</td><td>$85,000</td></tr><tr><td>Inv-2</td><td>30%</td><td>$200,000</td><td>$140,000</td></tr></tbody></table>

If the negotiation goes successfully, the **Pool Admin** can then fund the receivables, which marks the start of the loan.

However, the **Pool Admin** may reject a buyer's request to initiate a loan due to the following reasons.

1. The **Pool Admin** needs more information on the validity of the invoices
2. The pool does not have sufficient liquidity to be lent out

## Repaying Loans

Before the loan expires, the buyer will have to repay the loan before the repayment date. The interest will be calculated as **simple interest** on the principal amount. After the buyer repays the loan fully, the loan will be closed.

<details>

<summary>Example Calculation</summary>

Let's say that a buyer has a loan with the following terms

- Principal: $140,000
- Interest Rate: 10%
- Late Interest Rate Premium: 5%
- Start Date: 2023/8/1
- Repayment Date: 2023/9/1

_Payment before expiration:_

If the buyer repays on 2023/8/25, the interest applied will be$$\$140,000 \times 10\% \times 24/365 = \$ 920.55$$

_Late Payment:_

If the buyer repays on 2023/9/5, the interest applied will be $$ $140,000 \times (10\% \times 31/365 + 15\% \times 4/365) = $1419.18 $$

Here, we calculate using days instead of seconds in order to simplify the calculation. In practice, it is calculated in seconds.

</details>

## Impairments and Defaults

If the buyer is deemed unlikely to repay the loan, the loan can be impaired by the **Pool Admin**.&#x20;

Furthermore, if the buyer misses the repayment date of the loan, the loan will be marked as default by the **Pool Admin.**

## Buyer Repayment Incentives

{% hint style="info" %}
The key question is why buyers would pay back what they borrowed.
{% endhint %}

### First Incentive: Positive on-chain credit history

Since buyers would need to publicize their wallet addresses when approving invoices, their on-chain history becomes public to future creditors. As more financial activity moves on chain, companies will be more incentivized to maintain a good long-term credit history on chain.

### Second Incentive: The ability to continue to use Isle Finance

As soon as a buyer defaults, it would be immediately banned from approving more receivables for their suppliers, which could cause more working capital problems in the supply chain.

Moreover, buyers would be repaying either the protocol or the supplier no matter what. Therefore, Isle imposes no extra cost on the buyer and would allow its supplier to get early capital financing, which is a win-win scenario for both sides.
