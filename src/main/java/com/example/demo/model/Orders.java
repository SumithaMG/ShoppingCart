package com.example.demo.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@ToString
@Setter
@Getter
@Data
@Entity
public class Orders {

   @Id
   @Column()
   @GeneratedValue(strategy = GenerationType.AUTO)
    private int orderId;

   // @Column(name="category")
    //private String orderCategory;
    @Column(name="orderedOn")
    private LocalDate orderDate;

   @Transient
    private int quantity;

   @Transient
   private int finalPrice;

   @OneToMany
   /*@JoinTable(name = "Product_Order",
            joinColumns = { @JoinColumn(name = "orderId") },
            inverseJoinColumns = { @JoinColumn(name = "productId") })*/
    private List<Product> product;

    @Column(name="totalMRP")
    private int totalmrp;

    @OneToOne
   // @JoinColumn(name="C_ID")
    private Customer customer;
}
