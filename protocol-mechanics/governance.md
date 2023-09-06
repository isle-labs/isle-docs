# Governance

The community DAO is in charge of managing governance. It has the ability to perform maintenance functions and parameter adjustments to the protocol via decentralized voting, including:

* Upgrading contracts
* Changing protocol configurations and parameters
* Pausing protocol activity in the event of an emergency

Anyone can participate in governance by making proposals, discussing them, and participating in Snapshot votes.

## Participation

### Governance Forum

This is a place where community members can make and discuss proposals.

## Governance Council

The governance council of Lopo has been set up to execute on-chain transactions on behalf of the results of community votes. The Lopo Council is a 3-of-5 multisig with 5 members representing all stakeholders participating in the protocol.

Members of the governance council will be released after the protocol launches officially.

## Governance Parameters

{% hint style="info" %}
Different from pool parameters. These parameters are set to be protocol-wide and affect each pool.
{% endhint %}

<table><thead><tr><th width="184">Parameter</th><th width="190">type</th><th>Description</th></tr></thead><tbody><tr><td><code>PROTOCOL_FEE</code></td><td>uint8</td><td>The percentage of interest revenue that will be charged by the protcol. (e.g. 0.5%) </td></tr><tr><td><code>POOL_LIMIT</code></td><td>mapping(address => uint256)</td><td>The limit on the size of a pool for each pool admin.</td></tr><tr><td><code>MAX_COVER_LIQUIDATION</code></td><td>mapping(address => uint8)</td><td>The maximum liquidation percentage per default of pool cover for each pool admin.</td></tr><tr><td><code>MIN_COVER</code></td><td>mapping(address => uint256)</td><td>The minimum amiount of pool cover that will need to be provided for each pool admin. </td></tr></tbody></table>
