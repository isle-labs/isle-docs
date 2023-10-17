# Receivable

[Git Source](https://github.com/bsostech/isle/blob/1b9b42ecc99464a07a9859078c2c7bc923a6500d/docs/reference)

**Inherits:**
[ReceivableStorage](/docs/reference/ReceivableStorage.md), Initializable, ERC721Upgradeable, ERC721EnumerableUpgradeable, ERC721BurnableUpgradeable, UUPSUpgradeable, [Adminable](/docs/reference/abstracts/Adminable.md), [IReceivable](/docs/reference/interfaces/IReceivable.md)

## Functions

### \_authorizeUpgrade

```solidity
function _authorizeUpgrade(address newImplementation) internal override onlyAdmin;
```

### initialize

```solidity
function initialize(address initialAdmin_) external override initializer;
```

**Parameters**

| Name            | Type      | Description              |
| --------------- | --------- | ------------------------ |
| `initialAdmin_` | `address` | The address of the admin |

### createReceivable

Only the buyer can call this function

_Mint a new receivable_

```solidity
function createReceivable(RCV.Create calldata params_) external override returns (uint256 tokenId_);
```

**Parameters**

| Name      | Type         | Description |
| --------- | ------------ | ----------- |
| `params_` | `RCV.Create` |             |

**Returns**

| Name       | Type      | Description                            |
| ---------- | --------- | -------------------------------------- |
| `tokenId_` | `uint256` | The id of the newly created receivable |

### getReceivableInfoById

_Get the information of a receivable_

```solidity
function getReceivableInfoById(uint256 tokenId_) external view override returns (RCV.Info memory info_);
```

**Parameters**

| Name       | Type      | Description              |
| ---------- | --------- | ------------------------ |
| `tokenId_` | `uint256` | The id of the receivable |

**Returns**

| Name    | Type       | Description                                             |
| ------- | ---------- | ------------------------------------------------------- |
| `info_` | `RCV.Info` | The struct containing the information of the receivable |

### burnReceivable

```solidity
function burnReceivable(uint256 tokenId_) external;
```

### \_beforeTokenTransfer

not support batch transfer

_Hook that is called before any token transfer._

```solidity
function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 tokenId_,
    uint256 batchSize_
)
    internal
    override(ERC721Upgradeable, ERC721EnumerableUpgradeable);
```

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
    returns (bool);
```
