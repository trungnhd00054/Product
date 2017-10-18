package com.trung.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.io.Serializable;
/**
 * @author Trung
 * @version 1.0
 * 
 */
@Entity
@Table(name = "product")
public class Product implements Serializable {
	
	private static final long serialVersionUID = -7988799579036225137L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
    private int id;
	
    @Column
    private String productName;
    
    @Column
    private int quantity;
    
    @Column
    private float unitPrice;

    @Column
    private float discount;
    
    
    public Product() {
    }


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public float getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}


	public float getDiscount() {
		return discount;
	}


	public void setDiscount(float discount) {
		this.discount = discount;
	}


	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", quantity=" + quantity + ", unitPrice="
				+ unitPrice + ", discount=" + discount + "]";
	}
    
    
    
}