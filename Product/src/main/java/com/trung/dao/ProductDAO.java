/**
 * 
 */
package com.trung.dao;

import java.util.List;

import com.trung.entity.Product;

/**
 * @author Trung
 * @version 1.0
 */
public interface ProductDAO {
	public int createProduct(Product product);
    public Product updateProduct(Product product);
    public void deleteProduct(int id);
    public List<Product> getAllProducts();
    public Product getProduct(int id);	
	public List<Product> findByName(String productName);
}
