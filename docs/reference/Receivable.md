# Receivable

[Git Source](https://github.com/isle-labs/isle-contract/blob/main/contracts/Receivable.sol)

**Inherits:** [ReceivableStorage](/docs/reference/ReceivableStorage.md), Initializable,
ERC721Upgradeable, ERC721EnumerableUpgradeable, ERC721BurnableUpgradeable, UUPSUpgradeable,
[Governable](/docs/reference/abstracts/Governable.md),
[IReceivable](/docs/reference/interfaces/IReceivable.md)

## Functions

### \_authorizeUpgrade

```solidity
function _authorizeUpgrade(address newImplementation) internal override onlyGovernor;
```

### initialize

_Initializes the Receivable._

```solidity
function initialize(address initialGovernor_) external override initializer;
```

**Parameters**

| Name               | Type      | Description                  |
| ------------------ | --------- | ---------------------------- |
| `initialGovernor_` | `address` | The address of the governor. |

### createReceivable

Mint a new receivable.

_The event faceAmount is converted to decimal with 6 decimals._

```solidity
function createReceivable(RCV.Create calldata params_) external override returns (uint256 tokenId_);
```

**Parameters**

| Name      | Type         | Description                                                            |
| --------- | ------------ | ---------------------------------------------------------------------- |
| `params_` | `RCV.Create` | The struct containing the information of the receivable to be created. |

**Returns**

| Name       | Type      | Description                             |
| ---------- | --------- | --------------------------------------- |
| `tokenId_` | `uint256` | The id of the newly created receivable. |

### getReceivableInfoById

_Get the information of a receivable._

```solidity
function getReceivableInfoById(uint256 tokenId_) external view override returns (RCV.Info memory info_);
```

**Parameters**

| Name       | Type      | Description               |
| ---------- | --------- | ------------------------- |
| `tokenId_` | `uint256` | The id of the receivable. |

**Returns**

| Name    | Type       | Description                                              |
| ------- | ---------- | -------------------------------------------------------- |
| `info_` | `RCV.Info` | The struct containing the information of the receivable. |

### burnReceivable

_Burn a receivable._

```solidity
function burnReceivable(uint256 tokenId_) external;
```

**Parameters**

| Name       | Type      | Description               |
| ---------- | --------- | ------------------------- |
| `tokenId_` | `uint256` | The id of the receivable. |

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

_See {IERC165-supportsInterface}._

```solidity
function supportsInterface(
    bytes4 interfaceId_
)
    public
    view
    override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
    returns (bool);
```
