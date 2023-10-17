# IReceivable

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference/interfaces)

**Inherits:**
[IReceivableEvent](/docs/reference/interfaces/IReceivableEvent.md)

## Functions

### initialize

```solidity
function initialize(address initialAdmin_) external;
```

**Parameters**

| Name            | Type      | Description              |
| --------------- | --------- | ------------------------ |
| `initialAdmin_` | `address` | The address of the admin |

### createReceivable

Only the buyer can call this function

The event faceAmount is converted to decimal with 6 decimals

_Mint a new receivable_

```solidity
function createReceivable(Receivable.Create memory create_) external returns (uint256 tokenId_);
```

**Parameters**

| Name      | Type                | Description                                                           |
| --------- | ------------------- | --------------------------------------------------------------------- |
| `create_` | `Receivable.Create` | The struct containing the information of the receivable to be created |

**Returns**

| Name       | Type      | Description                            |
| ---------- | --------- | -------------------------------------- |
| `tokenId_` | `uint256` | The id of the newly created receivable |

### getReceivableInfoById

_Get the information of a receivable_

```solidity
function getReceivableInfoById(uint256 tokenId_) external view returns (Receivable.Info memory info_);
```

**Parameters**

| Name       | Type      | Description              |
| ---------- | --------- | ------------------------ |
| `tokenId_` | `uint256` | The id of the receivable |

**Returns**

| Name    | Type              | Description                                             |
| ------- | ----------------- | ------------------------------------------------------- |
| `info_` | `Receivable.Info` | The struct containing the information of the receivable |

### burnReceivable

```solidity
function burnReceivable(uint256 tokenId_) external;
```
