# Withdrawal Management

## Overview

The process of withdrawals is managed by the `WithdrawalManager`. The `withdrawalManager` holds custody of users' LP tokens and allows them to withdraw at specified time intervals - **Withdrawal Window** after waiting a minimum of a full **Withdrawal Cycle**. Users' withdrawal requests are grouped into cycles so that pro-rata distributions of available cash can be performed.

<figure><img src="../.gitbook/assets/image (1).png" alt=""><figcaption><p>Normal withdrawal process</p></figcaption></figure>

## Request Updates

If a user misses their withdrawal window or wishes to modify their withdrawal request, they have several options to update it.&#x20;

### Refresh Action
**Purpose:** This action allows users to resubmit their withdrawal request with the original amount of shares if they have simply missed the withdrawal window but wish to proceed as initially planned.

**How to Perform:** To refresh the request, call `Pool::requestRedeem(0)`. This command resubmits the withdrawal request without altering the amount of shares.

### Modify Action
**Purpose:** For users looking to adjust the amount of shares in their withdrawal request, the modify action provides the means to either increase or decrease the desired amount.

**How to Perform:**
- To increase the number of shares, call `requestRedeem(n)` with `n` specifying the new total amount of shares desired.
- To decrease the number of shares, call `removeShares(n)`, where `n` reflects the number of shares to be removed from the request.

### Cancel Action
**Purpose:** Users who wish to cancel their withdrawal request entirely can use this action to remove all associated shares, effectively nullifying the request.

**How to Perform:** Execute `removeShares(n)` to cancel the request, where `n` is the total amount of shares initially requested for withdrawal.


In all cases, the withdrawal request will be treated as a **normal withdrawal request** and will have to wait for a **minimum of a full withdrawal cycle** before the funds can be withdrawn.

## Exchange Rate Calculation

{% hint style="info" %}
Users withdrawing in the same withdrawal window may experience different exchange rates if they exchange at different time points.
{% endhint %}

When the actual withdrawal is performed, the amount of funds withdrawn is calculated by converting the shares requested for withdrawal into funds using the **current exchange rate**.&#x20;

## Liquidity Locking

During each withdrawal window, the total amount of funds required to satisfy all withdrawals will be continuously locked using the current exchange rate. These locked liquidity can not be used by the Pool Admin for funding.

<details>

<summary>Example</summary>

If the current shares available for withdrawal is as follows

- User 1: 100 shares
- User 2: 200 shares

At time point 1 (exchange rate: 1.5)

- Total locked liquidity would be 450

At time point 2 (exchange rate: 1.75)

- Total locked liquidity would be 525

</details>

## Pro-rata Distribution

When there is insufficient liquidity to satisfy all withdrawals, the available amount of liquidity will be proportionally distributed between users based on the size of their withdrawals. For example, if there is only enough assets to satisfy 50% of all withdrawals, each user can only withdraw 50% of their requested amount. Also, withdrawals requests that can not be fulfilled due to **insufficient liquidity** will be automatically forwarded to the next withdrawal window without any additional delays.

The formula related to the distribution can be written as follows

$$
redeemableShares(user) =  min(lockedShares(user), lockedShares(user) \times \frac{availableLiquidity}{totalLockedLiquidity})
$$

where

$$
totalLockedLiquidity = totalCycleShares(cycle) \times exchangeRate
$$

## Configuration Management

The **Pool Admin** can update update the duration of each Withdrawal Cycle and/or Withdrawal Window. This change will only take effect after the current and two following Withdrawal Cycles.&#x20;
