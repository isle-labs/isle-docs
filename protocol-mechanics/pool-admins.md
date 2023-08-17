# Pool Admins

## Overview

Pool Admins are asset specialists and credit experts who manage pools to attract global capital and provide funding for the supply chain. (If you'd like to explore becoming a Pool Admin, please connect with the Lopo Team)

Each pool will be managed by a Pool Admin. The Pool Admin is responsible for the following

* Creating a Pool
* Providing First-Loss Cover
* Onboarding Buyers
* Negotiating and Funding Loans
* Impairing Loans
* Triggering Defaults

## Creating a Pool

A pool is a smart contract through which buyers borrow and repay capital. Once approved by governance, a Pool Admin can create one pool and define the terms of this pool.

* **Risk-Free Rate**: The risk-free interest rate assumed in this pool (e.g. 5%)
* **Late Interest Rate Premium:** The additional premium of interest rate that will be applied to buyers during the grace period (e.g. 3%)
* **Pool Limit:** Total capital that can be borrowed (e.g. $10M)
* **Management Fee**: The fee as a percentage of interest repaid that will be given to the Pool Admin (e.g. 1%)

The Pool Admin will be allowed to update these parameters after the pool is created. However, it will take effect after 30 days.

## Providing First-Loss Cover

Pool Admins are required to provide a certain amount of first-loss cover in order to align incentives between Lenders and Pool Admins. Pool Admins have a **liquidation maximum per default** as a percentage of the total first-loss cover provided.

The amount of First-Loss Cover required will be specified as a percentage of the total capital that is borrowed (set by Governance).

When the amount of First-Loss Cover is not sufficient to cover new loans, the Pool Admin will not be able to fund new loans. Similarly, the Pool Admin will not be able to withdraw First-Loss Cover if it fails to cover the total capital borrowed.

Note that the capital supplied as First-Loss Cover is due to earn interest just like normal deposits.

## Onboarding Buyers

Pool Admins are also responsible for performing due diligence on buyers in order to onboard high-quality buyers and give different credit ratings for different buyers.&#x20;

## Negotiating and Funding Loans

Pool Admins have the ability to fund loans negotiated with specific borrowers after borrowers factor their invoices. In this case, the pool acts as a credit facility that escrows the invoice NFTs and lends out funds. See more in [#factor-invoices](buyers.md#factor-invoices "mention").

## Impairing Loans

We give Pool Admins the ability to impair loans in the event of a potential non-payment or insufficient payment scenario. The impairment can be put in place to better distribute losses to all current lenders.

This prevents a situation where a loan is known to be compromised, and some lenders withdraw their capital prior to the loss, leading to the remaining lenders bearing more of the lost capital.

Loan impairments should be used when the Pool Admin believes he will be able to quickly recover part of or all of the loan's value from the borrower.

When the loan is impaired, all deposits will be made using the original exchange rate, while withdrawals will be made using an impaired exchange rate.

{% hint style="info" %}
Unrealized Losses represent the total value of all loans that are marked as impaired.
{% endhint %}

$$
ExchangeRate = \frac{TotalAssets}{Shares}
$$

$$
ImpairedExchangeRate = \frac{TotalAssets - UnrealizedLosses}{Shares}
$$

If a liquidity provider decides to withdraw when the loan is impaired, they will suffer a permanent impairment loss. Any future recoveries into the pool will be distributed to those lenders that remained in the pool pro rata. That is, during loan impairments, liquidity providers are advised against withdrawing existing shares or depositing new capital before the situation of the default becomes more clear.

## Triggering Defaults

When it is clear that the borrower has not made a payment (including non-payment or insufficient payment of principal or interest) past the grace period on a loan, the Pool Admin can execute a default. The default will

1. Reduce the pool's value by the amount of losses
2. Slash Pool Admin's First-Loss Capital according to the value of the liquidation max per default
3. Kick off the legal recollection process
