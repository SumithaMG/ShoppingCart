package com.example.demo.model;

import lombok.*;

import javax.persistence.*;
import javax.websocket.OnError;
import java.util.List;

@ToString
@Setter
@Getter
@Data
@Entity
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int cartId;

    @OneToOne
    private Customer customer;

    @OneToOne
    private Product product;

    @OneToOne
    private Orders order;

    @Column(name = "Quantity", nullable = false, columnDefinition = "integer default 1")
    private int quantity;

    @Column(name = "price", nullable = false, columnDefinition = "integer default 1")
    private int price;

    @Column(name = "finalPrice", nullable = false, columnDefinition = "integer default 1")
    private int finalPrice;

}
