package com.example.demo.model;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Entity
@ToString
@Setter
@Getter
@Data
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int productId;

    @Column(name="Product_name")
    private String productName;

    @Column(name="PRODUCT_CATEGORY")
    private String productCategory;

    @Column(name="PRODUCT_PRICE")
    private int productPrice;

}
