---
description: Companies that pay their suppliers early with cheap funding
---

# Buyers

## Overview

Buyers are companies that seek financing for their suppliers using the protocol. They can approve invoices, which enable their suppliers to receive direct financing through the protocol. Before the expiration of the invoices, the corresponding buyers will then fulfill the repayments back to the protocol.

## Buyer Onboarding

To apply for early financing for suppliers, each buyer should go through a credit check performed by the corresponding **Pool Admin**. Then, the buyer will be whitelisted in the pool.

## Approving Receivables and funding

After buyers negotiate the terms with the **Pool Admin,** they should approve the receivables for funding. The **Pool Admin** will then fund the loan, which should contain the following terms:

* **Collateral ID:** The token ID of the receivable NFT that is approved and funded
* **Principal**: The amount of funds that will be given to the seller.

$$
Principal = FaceAmount \times (1 - DiscountRate)
$$

* **Interest Rate**: Provided by the Pool Admin (must be larger than the Risk-Free Rate of the pool)
* **Late Interest Rate Premium**: The extra interest rate that will be applied if the buyer is late on repayment.
* **Grace Period**: The length of the grace period before the loan is classified as default.
* **Repayment Date:** Repayment date of the receivable.
* **Recipient**: The seller of the invoice, who is able to withdraw the funds.

{% hint style="info" %}
**Discount Rate** will be determined in the negotiation process and should typically be in the range of 0% \~ 50% depending on the industry of the buyer and seller.
{% endhint %}

The **Discount Rate** will differ for each receivable and the principal provided for each invoice will follow the following table.

<table><thead><tr><th width="122">Invoice</th><th>Discount Rate</th><th>Face Amount</th><th>Principal</th></tr></thead><tbody><tr><td>Inv-1</td><td>15%</td><td>$100,000</td><td>$85,000</td></tr><tr><td>Inv-2</td><td>30%</td><td>$200,000</td><td>$140,000</td></tr></tbody></table>

Under these circumstances, the **Pool Admin** may reject a buyer's request to initiate a loan.

1. The **Pool Admin** needs more information on the validity of the invoices
2. The pool does not have enough liquidity to be lent out

## Repaying Loans

Before the loan expires, the buyer will have to repay the loan before the repayment date. The interest will be calculated as **simple interest** on the principal amount. After the buyer repays the loan fully, the loan will be closed and no interest will be generated for the loan.

<details>

<summary>Example Calculation</summary>

Let's say that a buyer has a loan with the following terms

* Principal: $140,000
* Interest Rate: 10%
* Late Interest Rate Premium: 5%
* Start Date: 2023/8/1
* Repayment Date: 2023/9/1

_Payment before expiration:_

If the buyer repays on 2023/8/25, the interest applied will be$$\$140,000 \times 10\% \times 24/365 = \$ 920.55$$

Here, we calculate using days instead of seconds in order to simplify the calculation. In practice, it is calculated in seconds.

_Late Payment:_

If the buyer repays on 2023/9/5, the interest applied will be $$ $140,000 \times (10\% \times 31/365 + 15\% \times 4/365) = $1419.18 $$

</details>

## Impairments and Defaults

If the buyer is deemed unlikely to repay the loan, the loan can be impaired by the **Pool Admin**.&#x20;

Furthermore, if the buyer misses the payment of the loan, the loan can be marked as default by the **Pool Admin.** (see [pool-admins.md](pool-admins.md "mention"))

## Buyer Repayment Incentives

{% hint style="info" %}
The key question is why buyers would pay back what they borrowed.
{% endhint %}

### First Incentive: Positive on-chain credit history

Since buyers would need to publicize their wallet addresses when approving invoices, their on-chain history becomes public to future creditors. As more financial activity moves on chain, companies will be more incentivized to maintain a good long-term credit history on chain.

### Second Incentive: The ability to continue to use Lopo

As soon as a buyer defaults, it would be immediately denied the approval of new invoices for their suppliers, which could cause more working capital problems in the supply chain.

Moreover, buyers would be repaying either the protocol or the supplier no matter what. Therefore, Lopo imposes no extra cost on the buyer and would allow its supplier to get early capital financing, which is a win-win scenario for both sides.
