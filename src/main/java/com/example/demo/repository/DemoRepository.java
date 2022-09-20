package com.example.demo.repository;

import com.example.demo.model.Employee;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class DemoRepository {

    public List findAllEmp() {
        ArrayList<Employee> emplist = new ArrayList<Employee>();
        Employee emp1 = new Employee(1,"sahithya", 1500, "chennai");
        Employee emp2 = new Employee(2,"harsha", 1500, "kerala");
        Employee emp3 = new Employee(3,"sumitha", 2000, "banglore");
        Employee emp4 = new Employee(3,"ramya", 500, "banglore");
        emplist.add(emp1);
        emplist.add(emp2);
        emplist.add(emp3);
        emplist.add(emp4);
        return emplist;
    }
}
