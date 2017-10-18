/**
 * 
 */
package com.trung.dao;

import com.trung.entity.Product;
import com.trung.util.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Trung
 * @version 1.0
 */

@Repository
public class ProductDAOImpl implements ProductDAO {
    
	public ProductDAOImpl() {
    	System.out.println("ProductDAOImpl");
    }
	
	@Autowired
    private HibernateUtil hibernateUtil;
	@Autowired
	private SessionFactory sessionFactory;
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
    @Override
    public int createProduct(Product product) {        
        return (int) hibernateUtil.create(product);
    }
    
    @Override
    public Product updateProduct(Product product) {        
        return hibernateUtil.update(product);
    }
    
    @Override
    public void deleteProduct(int id) {
        Product product = new Product();
        product.setId(id);
        hibernateUtil.delete(product);
    }
    
    @Override
    public List<Product> getAllProducts() {        
        return hibernateUtil.fetchAll(Product.class);
    }
    
    @Override
    public Product getProduct(int id) {
        return hibernateUtil.fetchById(id, Product.class);
    }	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByName(String productName){
		SQLQuery query = getSession().createSQLQuery("select * from product p where p.productName like '%"+ productName +"%'");
		query.addEntity(Product.class);		
		return query.list();
	}
}