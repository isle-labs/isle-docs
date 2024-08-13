# Smart Contract Overview

### IsleGlobals

This singleton contract is in charge of the Isle protocol configuration, handling values such as protocol fees, the list of valid Pool admin, Receivable assets, Pool assets, and more. It can only be owned and administered by the Governor.

### PoolAddressesProvider

Serves as the address registry of the pool and can update implementations of contracts within the pool. This contract is immutable, and its address will never change. By default, it should be owned by the governor.

### PoolConfigurator

It has a one-to-one relationship with the pool. It handles most of the administrative functions for the pool, as well as the interface between the pool and other contracts. The only actors that are allowed to interact with the PoolConfigurator is the Pool Admin, Governor, and other contracts.

### Pool

The pool implements the vault standard (ERC4626) ,and it's intentionally kept as simple as possible, containing mostly token and deposit / withdrawal functionality. It's the only contract that LPs need to interact with. Due to its immutability, some logic is delegated to the PoolConfigurator, which is the only external contract that the Pool interacts with.

### WithdrawalManager

Due to the nature of lending protocols, the majority of assets will not be available for withdrawal for LPs. To ensure fairness, this contract implements the logic that controls when and how much each LP can withdraw at the time.

### LoanManager

Handles everything related to the issuance, repayment, accounting, default and impairments of all loans in a pool. The accounting is done on a separate contract instead of the pool to allow future flexibility. Currently, there will only be one loan manager within a pool, though we may allow for multiple in the future.
