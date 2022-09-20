package com.example.demo.Service;

import com.example.demo.model.Cart;
import com.example.demo.model.Orders;
import com.example.demo.model.Product;
import com.example.demo.repository.CartRepository;
import com.example.demo.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepo;

    public void saveCart(Cart order) {
        cartRepo.save(order);
    }

    public List getCart() {

        List<Cart> cartDetails  = cartRepo.findAll();
        return cartDetails;
    }

    public Cart getCartById(int cartId){Optional<Cart> cart= cartRepo.findById(cartId);
      Cart crt = new Cart();
      crt=cart.get();
       return crt;
    }


}
