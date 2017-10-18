package com.trung.service;
import com.trung.dao.ProductDAO;
import com.trung.entity.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * @author Trung
 * @version 1.0
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	public ProductServiceImpl() {
		System.out.println("ProductServiceImpl()");
	}
	
    @Autowired
    private ProductDAO productDAO;

    @Override
    public int createProduct(Product product) {
        return productDAO.createProduct(product);
    }
    @Override
    public Product updateProduct(Product product) {
        return productDAO.updateProduct(product);
    }
    @Override
    public void deleteProduct(int id) {
    	productDAO.deleteProduct(id);
    }
    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }
    @Override
    public Product getProduct(int id) {
        return productDAO.getProduct(id);
    }    
   
	@Override
	public List<Product> findByName(String productName) {
		
		return productDAO.findByName(productName);
	}
    
    
}
