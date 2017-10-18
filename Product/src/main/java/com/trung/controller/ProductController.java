package com.trung.controller;
import com.trung.entity.Product;
import com.trung.service.ProductService;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Trung
 * @version 1.0
 */
@Controller
public class ProductController {
	
	private static final Logger logger = Logger.getLogger(ProductController.class);
	
	public ProductController() {
		System.out.println("ProductController()");
	}

    @Autowired
    private ProductService productService;

    
    
    
    @RequestMapping("createProduct")
    public ModelAndView createProduct(@ModelAttribute Product product) {
    	logger.info("Creating Product. Data: "+product);
        return new ModelAndView("productForm");
    }
    
    @RequestMapping("editProduct")
    public ModelAndView editProduct(@RequestParam int id, @ModelAttribute Product product) {
    	logger.info("Updating the Product for the Id "+id);
    	product = productService.getProduct(id);
        return new ModelAndView("productForm", "productObject", product);
    }
    
    @RequestMapping("saveProduct")
    public ModelAndView saveProduct(@ModelAttribute Product product) {
    	logger.info("Saving the Product. Data : "+product);
        if(product.getId() == 0){ 
        	productService.createProduct(product);
        } else {
        	productService.updateProduct(product);
        }
        return new ModelAndView("redirect:getAllProducts");
    }
    
    @RequestMapping("deleteProduct")
    public ModelAndView deleteProduct(@RequestParam int id) {
    	logger.info("Deleting the Products Id : "+id);
    	productService.deleteProduct(id);
        return new ModelAndView("redirect:getAllProducts");
    }
    
    @RequestMapping(value = {"getAllProducts", "/"})
    public ModelAndView getAllProducts() {
    	logger.info("Getting the all Products");
        List<Product> productList = productService.getAllProducts();
        return new ModelAndView("productList", "productList", productList);
    }
    
    @RequestMapping("searchProduct")
    public ModelAndView searchProduct(@RequestParam("searchName") String searchName) {  
    	logger.info("Searching the Product Product Names: "+searchName);
    	List<Product> productList = productService.findByName(searchName);
        return new ModelAndView("productList", "productList", productList);    	
    }
}