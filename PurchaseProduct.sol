//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import "./AddProduct.sol";
contract PurchaseProduct 
{
    AddProduct private addProductContract;
    struct Purchase 
    {
        string buyerName;
        address buyerAddress;
        uint256 productId;
    }
    mapping(uint256=>Purchase) private purchases;
    uint256 private purchaseCount;
    constructor(address _addProductContractAddress)
    {
    addProductContract=AddProduct(_addProductContractAddress);
    }
    function purchaseProduct(string memory _buyerName, address _buyerAddress, uint256 _productId) external 
    {
        AddProduct.Product memory product=addProductContract.getProductById(_productId);
        require(bytes(product.name).length !=0, "Product with same ID does not exist");   
        Purchase memory newPurchase=Purchase(_buyerName, _buyerAddress, _productId);
        purchases[purchaseCount]=newPurchase;
        purchaseCount++;
    }
    function getProductById(uint256 _productId) external view returns (AddProduct.Product memory) 
    {
        return addProductContract.getProductById(_productId);
    }   
    function getAllProducts() external view returns (AddProduct.Product[] memory) 
    {
        return addProductContract.getAllProducts();
    }
}