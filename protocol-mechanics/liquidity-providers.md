---
description: Smart investors who earn yield by providing funds
---

# Liquidity Providers

{% hint style="info" %}
Liquidity providers are investors who hope to earn yields by investing in the liquidity pool.
{% endhint %}

## Supplying Capital

Each pool will follow the [ERC4626 vault standard](https://erc4626.info/). This standard specifies how the LP tokens accrue value from the buyer's repayment of loans. Before depositing, we will suggest that you go through the following steps:

1. Go through KYC and get whitelisted.
2. Review the **Pool Admin**'s track record and understand what type of industry the pool is investing in.
3. Review the terms for withdrawal so you know when you can withdraw and how much.

## Withdrawing Capital

All withdrawal requests are grouped into **Withdrawal Cycles** (1–2 weeks), which are cyclically occurring periods of time. By grouping users into cycles, Pool Admins ensure that users get a prorated distribution of cash in the event of partial liquidity in the system.

At the start of each cycle (such as the first two days of each two-week cycle), there will be a window of time where part of the liquidity is locked for withdrawal requests that were submitted in the previous cycle. This window is called the **Withdrawal Window**.&#x20;

During each withdrawal window, the amount of liquidity required to satisfy all withdrawals will be locked and not at the disposal of **Pool Admins**.

Withdrawing from the protocol can be simplified to the following 3 steps

1. Submit a withdrawal request during the current **Withdrawal Cycle**. (users can modify or cancel their withdrawal request during this time)
2. Wait for the following cycle to complete until they can execute their withdrawal request during their eligible withdrawal window.
3. Execute their withdrawal request during their eligible **Withdrawal WIndow**.

### Request Not Executed&#x20;

If the user fails to execute their request during their allotted withdrawal window, they will have to resubmit their withdrawal request.

### Insufficient Liquidity

If there is not enough liquidity to fulfill all withdrawals during the window, those eligible for withdrawal will receive their share of the proceeds pro-rata and have the remaining funds requested moved to the very next withdrawal window.
