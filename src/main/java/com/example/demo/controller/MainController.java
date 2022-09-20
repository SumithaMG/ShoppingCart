package com.example.demo.controller;

import com.example.demo.Service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
//@RequestMapping("/")
public class MainController {

    @Autowired
    private DemoService service;


   // @RequestMapping(value="/orders", method = RequestMethod.GET)
    public String orders() {
        System.out.println("Inside order");
        return "order";
    }

    @RequestMapping(value="/customers", method = RequestMethod.GET)
    public String customers() {
        System.out.println("Inside customers");
        return "customer";
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String display(){
        System.out.println("Inside controller");
        return "main";
    }



}
