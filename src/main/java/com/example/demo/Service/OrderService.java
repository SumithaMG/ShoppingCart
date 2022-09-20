package com.example.demo.Service;

import com.example.demo.model.Cart;
import com.example.demo.model.Orders;
import com.example.demo.model.Orders;
import com.example.demo.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepo;

    public Orders getOrderDetails(int id) {
        Optional<Orders> orderDetails = orderRepo.findById(id);
        if (orderDetails.isPresent()) {
            Orders order = new Orders();
            order.setOrderId(orderDetails.get().getOrderId());
            //order.setOrderCategory(orderDetails.get().getOrderCategory());
            order.setOrderDate(orderDetails.get().getOrderDate());
            return order;
        }
        return null;
    }
    public void saveOrder(Orders order) {


        orderRepo.save(order);
    }

    public void saveCart(Cart order) {
    }
}
