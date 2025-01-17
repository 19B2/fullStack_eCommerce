package com.e_commerce.e_commerce.services.products;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.e_commerce.e_commerce.helper.ResponseHelper;
import com.e_commerce.e_commerce.models.Products;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("market")
public class PoductsController {
    @Autowired
    private ProductsServices productsServices;
    private ResponseHelper responseHelper = new ResponseHelper();

    @GetMapping("products")
    public ResponseEntity<Object> getAllProducts() {
        try {
            return responseHelper.createSuccessResponse("Products Loaded Successfully",productsServices.getAllProducts());
            
        } catch (Exception e) {
            return responseHelper.createErrorResponse(HttpStatus.INTERNAL_SERVER_ERROR,"Error Loading Products \n "+e,null);
 
        }
    }
    @GetMapping("/products/search")
    public ResponseEntity<Object> searchForProducts(@RequestParam("q") String searchQuery) {
        try {
            return responseHelper.createSuccessResponse("Search done successfully", productsServices.searchForProduct(searchQuery));
        } catch (Exception e) {
            return responseHelper.createErrorResponse(HttpStatus.INTERNAL_SERVER_ERROR, ""+ e, null);
        }
    }

    @GetMapping("/products/oneProduct")
    public ResponseEntity<Object> getProductById(@RequestParam("pID") int productId) {
        Products product = productsServices.getProduct(productId);
        if (product != null) {
            return responseHelper.createSuccessResponse("product got succesfully", product.productToMap());
        } else {
            return responseHelper.createErrorResponse(HttpStatus.NOT_FOUND, "no such product", null);
        }
    }
    
    
    
    
    
}
