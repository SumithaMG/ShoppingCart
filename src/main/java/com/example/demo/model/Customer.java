package com.example.demo.model;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@ToString
@Setter
@Getter
@Data
@Entity
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int custId;

    private String custName;

    private String custAddr;

  // @OneToOne(mappedBy = "customer")
   // @JoinColumn(name="C_ID")
  // private Orders order;


}
