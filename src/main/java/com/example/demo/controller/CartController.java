package com.example.demo.controller;

import com.example.demo.Service.CartService;
import com.example.demo.Service.OrderService;
import com.example.demo.Service.ProductService;
import com.example.demo.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CartController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @RequestMapping(value="/addtoCart", method= RequestMethod.POST)
    public void addtoCart(@RequestBody Cart cart){
        System.out.println("caaartt");
        List<Cart> cartList = cartService.getCart();
        System.out.println( "qty" + cart.getQuantity());
       System.out.println(cart.getProduct().getProductId());
        int id = cart.getProduct().getProductId();
       boolean found= cartList.stream().anyMatch(c-> c.getProduct().getProductId()==id);
       if(found==false) {
           cartService.saveCart(cart);
       }
        System.out.println("already in cart");
    }

    @RequestMapping(value="/updateCart", method= RequestMethod.PUT)
    public void updateCart(@RequestBody Cart cart){
        System.out.println(" updating caaartt");
       Cart crt= cartService.getCartById(cart.getCartId());
       crt.setQuantity(cart.getQuantity());
       crt.setPrice(cart.getPrice());
       crt.setFinalPrice(cart.getFinalPrice());
        cartService.saveCart(crt);
    }
}
