package com.example.demo.controller;

import com.example.demo.model.Product;
import com.example.demo.Service.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import java.util.List;
import java.util.Map;

@RestController
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping(value = "/listProducts", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView products() {
        System.out.println("Inside prod");
        List<Product> allProds = productService.getAllProducts();
        ModelAndView map = new ModelAndView("ProductDisplay");
        map.addObject("lists", allProds);
      //  System.out.println(allProds.listIterator().next().getProductName());
        return map;

    }

    @RequestMapping(value = "/updateProducts", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView uproducts() {
        System.out.println("Inside prod");
        List<Product> allProds = productService.getAllProducts();
        ModelAndView map = new ModelAndView("Product");
        map.addObject("lists", allProds);
        //  System.out.println(allProds.listIterator().next().getProductName());
        return map;

    }

    @RequestMapping(value = "/getProduct", method = RequestMethod.GET)
    public void getProductDetailsById(@PathVariable int id) {
        productService.getProduct(id);
    }

    @RequestMapping(value = "/newProduct", method = RequestMethod.GET)
    public ModelAndView ProductDetails() {
        System.out.println("inside add prod");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("NewProduct");
        return modelAndView;
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public void addProduct(@RequestBody Product product) throws JsonProcessingException {

        System.out.println("adding prod");
        //System.out.println(product.getProductPrice());
        productService.saveProduct(product);
    }
    @RequestMapping(value = "/updateProduct", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public void updateProduct(@RequestBody Product product) {
        System.out.println("update prod");
      // System.out.println(product.getProductId());
        productService.saveProduct(product);
    }
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.DELETE)
    public void deleteProduct(Integer productId){

        System.out.println("delete prod");
        System.out.println(productId);
        productService.deleteProduct(productId);
    }

}
