package com.example.demo.controller;


import com.example.demo.Service.CartService;
import com.example.demo.Service.OrderService;
import com.example.demo.Service.ProductService;
import com.example.demo.model.Cart;
import com.example.demo.model.Orders;
import com.example.demo.model.Orders;
import com.example.demo.model.Product;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;


    @RequestMapping(value = "/orders", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView orderProd() {
        System.out.println("Inside orders");
        List<Product> allProds = productService.getAllProducts();
        ModelAndView map = new ModelAndView("order");
        map.addObject("lists", allProds);
        //  System.out.println(allProds.listIterator().next().getProductName());
        return map;

    }


    @RequestMapping(value="/navigate/{id}", method= RequestMethod.GET)
    public Orders getOrderById(@PathVariable int id) {
        Orders orderDetails = orderService.getOrderDetails(id);
        return orderDetails ;
    }
    @RequestMapping(value="/createOrder", method= RequestMethod.POST)
    public void createOrder( @RequestBody Orders order)  {
        System.out.println("creating order");
       System.out.println(order.getTotalmrp());
      // cartService.updateCart(order);
       // orderService.saveOrder(order);
    }


    @RequestMapping(value="/getCart", method= RequestMethod.GET)
    public ModelAndView addtoCart(){
        System.out.println(" get caaartt");
        System.out.println("inside info");
        List<Cart> cart= cartService.getCart();
        for(Cart c : cart){
            System.out.println(c.getProduct().getProductId());
        }
       // String cartJson = new Gson().toJson(cart);
      //  System.out.println(cartJson);
        ModelAndView map = new ModelAndView("cartDetails");
        map.addObject("lists", cart);
        //  System.out.println(allProds.listIterator().next().getProductName());
        return map;
    }


}