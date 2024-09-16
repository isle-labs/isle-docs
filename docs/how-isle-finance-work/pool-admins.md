---
description: The key to the successful operation of pools
---

# Pool Admins

## Overview

Pool Admins are asset specialists and credit experts who manage pools to attract global capital to provide funding for the supply chain. (If you'd like to explore becoming a Pool Admin, please connect with the **Isle Team**)

Each pool will be managed by a Pool Admin, who is responsible for the following

1. Creating a Pool
2. Providing First-Loss Cover
3. Onboarding Buyers
4. Negotiating and Funding Loans
5. Impairing Loans
6. Triggering Defaults

## Creating a Pool

A pool is an [**ERC4626**](https://erc4626.info/) smart contract through which liquidity providers deposit and withdraw capital. Once approved by governance, a Pool Admin can create and configure pools via the `PoolConfigurator`.

The Pool Admin is responsible for setting and updating these parameters after the pool is created.

- **Base Rate**: The base annual interest rate assumed in this pool (e.g. 5%)
- **Pool Admin Fee**: The fee as a percentage of total interest repaid that will be distributed to the Pool Admin (e.g. 10%)
- **Is Open to Public**:&#x20;
  - Permissioned: only lenders added to the whitelist can deposit liquidity
  - Permissionless: anyone can deposit liquidity &#x20;

{% hint style="info" %}
Note that when the parameters are updated, it will only affect new loans that are created afterwards but not the loans that have already been created.
{% endhint %}

## Providing Pool Cover

Pool Admins are required to provide a certain amount of first-loss **Pool Cover** in order to align incentives with the Lenders.

When loans default, the **Pool Cover** will be liquidated with a maximum liquidation of `MAX_COVER_LIQUIDATION` per default.

## Onboarding Participants

Pool Admins are responsible for maintaining the whitelists of valid buyer and sellers of the pool. Only the buyer and its associated sellers who have passed the due diligence of Pool Admins are permitted to interact with the pool.

They are also advised to sign a Master Loan Agreement with the buyer or add insurance to ensure a smoother legal recollection process. Even though this is not mandatory, it could strengthen the Pool Admins credibility and the lender's confidence to invest.

## Negotiating and Funding Loans

After buyers approve their receivables along with the set of specified terms, **Pool Admins** can fund the approved receivables through `LoanManager`. Then, the suppliers can withdraw the released funds from `LoanManager`.&#x20;

## Impairing Loans

We give **Pool Admins** the ability to impair loans in the event of a potential non-payment or insufficient payment scenario. The impairment can be put in place to better distribute losses to all current lenders.

This prevents a situation where a loan is known to be compromised, and some lenders withdraw their capital prior to the loss, leading to the remaining lenders bearing more of the lost capital.

Loan impairments should be used when **Pool Admins** believes they will be able to quickly recover part of or all of the loan's value from the buyer.

When a loan is impaired, all _deposits_ will be made using the **original exchange rate**, while _withdrawals_ will be made using an **impaired exchange rate**.

{% hint style="info" %}
**Unrealized Losses** represent the total value of all loans that have been marked as impaired.
{% endhint %}

$$
ExchangeRate = \frac{TotalAssets}{Shares}
$$

$$
ImpairedExchangeRate = \frac{TotalAssets - UnrealizedLosses}{Shares}
$$

If a liquidity provider decides to withdraw when the loan is impaired, they will suffer a permanent impairment loss. Any future recoveries from the pool will be distributed pro rata to those lenders that remained in the pool. That is, during loan impairments, liquidity providers are advised against withdrawing existing shares or depositing new capital before the situation of the default becomes more clear.

## Triggering Defaults

When it is clear that the borrower has not made a payment (including non-payment or insufficient payment of principal or interest) past the grace period on a loan, the Pool Admin can trigger a default. The default will

1. Reduce the pool's value by the amount of losses
2. Slash **Pool Admin**'s Pool Cover
3. Kick off the legal recollection process
