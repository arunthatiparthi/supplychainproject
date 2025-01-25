// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    address public owner;
    uint public productId;

    enum State { Created, InTransit, Delivered }

    struct Product {
        string name;
        uint quantity;
        address producer;
        address distributor;
        address retailer;
        address receiver;
        address location;
    }

    mapping(uint => State) public productStates;
    mapping(uint => Product) public products;

    // Events
    event ProductCreated(
        uint productId,
        string name,
        uint quantity,
        address producer,
        address distributor,
        address retailer,
        address receiver,
        address location
    );
    event StateChanged(uint productId, State newState);
    event QuantityUpdated(uint productId, uint newQuantity);
    event LocationUpdated(uint productId, address newLocation);
    event OwnershipTransferred(address newOwner);

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier validProduct(uint _productId) {
        require(products[_productId].producer != address(0), "Product does not exist");
        _;
    }

    modifier inState(uint _productId, State state) {
        require(productStates[_productId] == state, "Invalid state for this operation");
        _;
    }

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // Functions
    function createProduct(
        string memory _name,
        uint _quantity,
        address _producer,
        address _distributor,
        address _retailer,
        address _receiver,
        address _location
    ) public onlyOwner {
        productId++;
        products[productId] = Product({
            name: _name,
            quantity: _quantity,
            producer: _producer,
            distributor: _distributor,
            retailer: _retailer,
            receiver: _receiver,
            location: _location
        });

        productStates[productId] = State.Created;
        emit ProductCreated(productId, _name, _quantity, _producer, _distributor, _retailer, _receiver, _location);
    }

    function changeState(uint _productId, State _newState) public onlyOwner validProduct(_productId) {
        productStates[_productId] = _newState;
        emit StateChanged(_productId, _newState);
    }

    function updateQuantity(uint _productId, uint _newQuantity) public onlyOwner validProduct(_productId) {
        products[_productId].quantity = _newQuantity;
        emit QuantityUpdated(_productId, _newQuantity);
    }

    function updateLocation(uint _productId, address _newLocation) public onlyOwner validProduct(_productId) {
        products[_productId].location = _newLocation;
        emit LocationUpdated(_productId, _newLocation);
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        owner = _newOwner;
        emit OwnershipTransferred(_newOwner);
    }

    function getProductDetails(uint _productId) public view validProduct(_productId) returns (
        string memory,
        uint,
        address,
        address,
        address,
        address,
        address
    ) {
        Product storage product = products[_productId];
        return (
            product.name,
            product.quantity,
            product.producer,
            product.distributor,
            product.retailer,
            product.receiver,
            product.location
        );
    }
}

