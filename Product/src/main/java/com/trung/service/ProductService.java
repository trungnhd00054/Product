
package com.trung.service;
import java.util.List;

import com.trung.entity.Product;

/**
 * @author Trung
 * @version 1.0
 */
public interface ProductService {
	public int createProduct(Product employee);
    public Product updateProduct(Product employee);
    public void deleteProduct(int id);
    public List<Product> getAllProducts();
    public Product getProduct(int id);		
	public List<Product> findByName(String productName);
}
