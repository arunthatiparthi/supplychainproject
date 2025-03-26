# Supply Chain Management Smart Contract

## Overview
This Solidity-based **Supply Chain Management** smart contract provides a decentralized way to **track products** across different stakeholders: **producers, distributors, retailers, and receivers**. The contract ensures transparency and security in product tracking using blockchain technology.

## Features
✅ **Create Products** – Add products with details like name, quantity, and stakeholders.  
✅ **State Management** – Products transition through states: `Created`, `InTransit`, and `Delivered`.  
✅ **Quantity Updates** – Modify product quantity securely.  
✅ **Location Updates** – Track real-time location changes of products.  
✅ **Ownership Transfer** – Transfer contract ownership securely.  
✅ **Event Logging** – Emit events for transparency and tracking.  

## Smart Contract Details
- **Language**: Solidity (`^0.8.0`)  
- **License**: MIT  
- **Platform**: Ethereum, Remix IDE  

## Deployment & Usage

### 1️⃣ Deploy the Contract
1. Open **Remix IDE** ([Remix Ethereum](https://remix.ethereum.org/)).
2. Copy-paste the contract code into a new file (`SupplyChain.sol`).
3. Compile the contract using Solidity **0.8.0+**.
4. Deploy the contract using **Injected Web3 (MetaMask) or JavaScript VM**.

### 2️⃣ Functions & Usage

#### **Create a Product**
```solidity
createProduct("Laptop", 10, producerAddress, distributorAddress, retailerAddress, receiverAddress, locationAddress);
```
✅ Adds a new product with specified details.  

#### **Change Product State**
```solidity
changeState(1, State.InTransit);
```
✅ Updates product state (`Created -> InTransit -> Delivered`).  

#### **Update Product Quantity**
```solidity
updateQuantity(1, 20);
```
✅ Modifies product quantity securely.  

#### **Update Product Location**
```solidity
updateLocation(1, newLocationAddress);
```
✅ Changes the product’s current location.  

#### **Transfer Contract Ownership**
```solidity
transferOwnership(newOwnerAddress);
```
✅ Allows the current owner to transfer control to a new owner.  

#### **Get Product Details**
```solidity
getProductDetails(1);
```
✅ Returns product details including name, quantity, stakeholders, and location.  

## Security Measures
- **Access Control**: Only the **owner** can modify product details and states.
- **Data Integrity**: Uses `mapping` for efficient product tracking.
- **Event Logging**: Tracks state changes, ownership transfers, and product updates.

🚀 **Now you can track supply chain products securely on Ethereum!**

