//SPDX-License-Identifier:MI
pragma solidity ^0.8.18;
contract AddProduct 
{
    struct Product 
    {
        uint256 productId;
        string name;
        address seller;
        uint256 price;
    }
    mapping(uint256=>Product) private products;
    uint256 private productCount;
    event ProductAdded(uint256 productId, string name, address indexed seller, uint256 price);
    function addProduct(uint256 _productId, string memory _name, address _seller, uint256 _price) external 
    {
        require(products[_productId].seller==address(0), "Product with same ID already exists");
        Product memory newProduct=Product(_productId, _name, _seller, _price);
        products[_productId]=newProduct;
        productCount++;
        emit ProductAdded(_productId, _name, _seller, _price);
    }
    function getProductById(uint256 _productId) public view returns (Product memory) 
    {
        return products[_productId];
    }
    function getAllProducts() public view returns (Product[] memory) 
    {
        Product[] memory allProducts=new Product[](productCount);
        for(uint256 i=0;i<productCount;i++)
            allProducts[i]=products[i];
        return allProducts;
    }
}
