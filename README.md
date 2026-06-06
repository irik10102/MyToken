# 🪙 OurToken (ERC-20 Token)

## Project Description

Developed a custom ERC-20 token named **OurToken** as part of the Cyfrin Updraft Smart Contract Development curriculum using Solidity and Foundry. The project demonstrates the implementation of a fungible token following the ERC-20 standard, leveraging OpenZeppelin's audited smart contract libraries to ensure security, reliability, and compliance with Ethereum token standards.

The token supports core ERC-20 functionalities such as token transfers, balance tracking, allowances, approvals, and delegated transfers. The project emphasizes smart contract testing, security best practices, and professional development workflows using the Foundry framework.

### Key Features

* Implemented an ERC-20 compliant fungible token.
* Utilized OpenZeppelin's ERC-20 implementation for security and standardization.
* Supports token transfers between accounts.
* Supports allowance and approval mechanisms.
* Enables delegated token transfers through `transferFrom`.
* Comprehensive unit testing using Foundry.
* Gas-efficient and standards-compliant implementation.
* Deployment-ready for Ethereum-compatible networks.

### Technologies Used

* Solidity
* Foundry
* OpenZeppelin Contracts
* Ethereum
* Forge
* Git & GitHub

### Project Outcome

Built and tested a fully functional ERC-20 token contract while gaining practical experience with token standards, smart contract development workflows, automated testing, and deployment practices within the Ethereum ecosystem.

---

# 🚀 How to Run the Project

## Prerequisites

Ensure the following tools are installed:

* Git
* Foundry
* Node.js (optional for additional tooling)

---

## 1. Clone the Repository

```bash
git clone <repository-url>
cd foundry-erc20-ourtoken
```

---

## 2. Install Dependencies

Install the required Foundry libraries:

```bash
forge install
```

---

## 3. Build the Project

Compile the smart contracts:

```bash
forge build
```

---

## 4. Run the Tests

Execute all tests:

```bash
forge test
```

For detailed output:

```bash
forge test -vvv
```

---

## 5. Check Test Coverage

Generate a coverage report:

```bash
forge coverage
```

---

## 6. Format the Code

Format Solidity files according to Foundry standards:

```bash
forge fmt
```

---

## 7. Start a Local Blockchain

Launch a local Anvil node:

```bash
anvil
```

---

## 8. Deploy the Token Locally

In a new terminal:

```bash
forge script script/DeployOurToken.s.sol \
--rpc-url http://127.0.0.1:8545 \
--broadcast
```

---

## 9. Configure Environment Variables

Create a `.env` file:

```env
PRIVATE_KEY=your_private_key
SEPOLIA_RPC_URL=your_rpc_url
ETHERSCAN_API_KEY=your_api_key
```

Load the environment variables:

```bash
source .env
```

---

## 10. Deploy to Sepolia Testnet

```bash
forge script script/DeployOurToken.s.sol \
--rpc-url $SEPOLIA_RPC_URL \
--broadcast \
--verify
```

---

## 11. Interact with the Contract

Check token balances:

```bash
cast call <contract-address> \
"balanceOf(address)(uint256)" \
<wallet-address>
```

Transfer tokens:

```bash
cast send <contract-address> \
"transfer(address,uint256)" \
<recipient-address> \
<amount> \
--private-key $PRIVATE_KEY
```

---

## Useful Commands

```bash
forge build          # Compile contracts
forge test           # Run tests
forge test -vvv      # Verbose testing
forge coverage       # Coverage report
forge fmt            # Format code
anvil                # Local blockchain
cast                 # Interact with contracts
```

---

## ERC-20 Functionalities Implemented

* `totalSupply()`
* `balanceOf()`
* `transfer()`
* `approve()`
* `allowance()`
* `transferFrom()`

These functions comply with the ERC-20 token standard and enable interoperability across Ethereum wallets, decentralized applications, and exchanges.
