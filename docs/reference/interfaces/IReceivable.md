# IReceivable

[Git Source](https://github.com/isle-labs/isle-contract/blob/69690fa7f99cb787956fc4bb0d751a45fe8f3519/contracts/interfaces/IReceivable.sol)

**Inherits:** [IGovernable](/docs/reference/interfaces/IGovernable.md),
[IReceivableEvent](/docs/reference/interfaces/IReceivableEvent.md)

## Functions

### initialize

_Initializes the Receivable._

```solidity
function initialize(address initialGovernor_) external;
```

**Parameters**

| Name               | Type      | Description                  |
| ------------------ | --------- | ---------------------------- |
| `initialGovernor_` | `address` | The address of the governor. |

### createReceivable

Mint a new receivable.

_The event faceAmount is converted to decimal with 6 decimals._

```solidity
function createReceivable(Receivable.Create memory create_) external returns (uint256 tokenId_);
```

**Parameters**

| Name      | Type                | Description                                                            |
| --------- | ------------------- | ---------------------------------------------------------------------- |
| `create_` | `Receivable.Create` | The struct containing the information of the receivable to be created. |

**Returns**

| Name       | Type      | Description                             |
| ---------- | --------- | --------------------------------------- |
| `tokenId_` | `uint256` | The id of the newly created receivable. |

### getReceivableInfoById

_Get the information of a receivable._

```solidity
function getReceivableInfoById(uint256 tokenId_) external view returns (Receivable.Info memory info_);
```

**Parameters**

| Name       | Type      | Description               |
| ---------- | --------- | ------------------------- |
| `tokenId_` | `uint256` | The id of the receivable. |

**Returns**

| Name    | Type              | Description                                              |
| ------- | ----------------- | -------------------------------------------------------- |
| `info_` | `Receivable.Info` | The struct containing the information of the receivable. |

### burnReceivable

_Burn a receivable._

```solidity
function burnReceivable(uint256 tokenId_) external;
```

**Parameters**

| Name       | Type      | Description               |
| ---------- | --------- | ------------------------- |
| `tokenId_` | `uint256` | The id of the receivable. |
