# Loan Accounting

## Overview

The total assets under management (AUM) of a loan manager is represented as the sum of **outstanding principal** and **outstanding interest**. In the following section, we will explain how the accounting works to reflect the fair value of the loans.

## Outstanding Principal

Outstanding principal is simply the sum of principal balance of all outstanding loans $$i$$.

$$
principalOutstanding = \sum{principal_i}
$$

## Outstanding Interest

{% hint style="info" %}
Since the measure below is used to estimate the aggregate value of current outstanding interests, late interest penalties will not be accounted as those repayments are not guaranteed.
{% endhint %}

Outstanding interest has to represent the current aggregate value of the outstanding interest in all loans in the most accurate and efficient way possible. Interest is represented as fixed amounts owed at a **given date**. For example, a $1 million loan with 12% APR interest due in 30 days will be shown as:

$$
interest = 1e6 \times 0.12 \times \frac{30}{365} = 9863.01
$$

The buyer will have to repay $9863.01 in interest when the loan gets repaid on time.

### Naive Approach

The current value of an interest at any given time can be recognized linearly on the total interest that will be due on due date, which could be represented by the following equation

$$
interest(t) = interestDue \times \frac{t - startDate}{dueDate - startDate}
$$

Expanding on this concept, the naive calculation of the outstanding interest of all loans will be

$$
interest(t) = \sum{interestDue_i \times \frac{t - startDate_i}{dueDate_i-startDate_i}}
$$

### Optimized Approach (Aggregated Issuance)

In a protocol managing many loans at once, calculating the outstanding interest by summing the values naively will be extremely gas expensive. Since the rate of interest accrual for a single loan will be linear within its time frame, we can formulate a **piecewise linear function** that only has kinks when either a new loan is added or repaid. The function consists of four parameters

<figure><img src="../.gitbook/assets/image (15).png" alt=""><figcaption><p>Rates here are represented as per day while in practice, it is per second</p></figcaption></figure>

1. $$issuanceRate$$: Units of funds earned per second as interest for all outstanding loans
2. $$accountedInterest$$: "Snapshotted value" of outstanding interest updated at each point the function parameters are updated&#x20;
3. $$domainStart$$: The timestamp marking the start of the issuing domain. Set to `block.timestamp` after each update.
4. $$domainEnd$$: The timestamp marking the end of the issuing domain.

$$
outstandingInterest(t) = accountedInterest + issuanceRate \times (t - domainStart)
$$

where $$domainStart \leq t \leq domainEnd$$&#x20;

### In Practice: Advance Payment Accounting

Whenever any interaction is made with the LoanManager, the function `_advanceGlobalPaymentAccounting` is called to account all Loan's **outstanding interest** and to represent the current state at the current timestamp. &#x20;
