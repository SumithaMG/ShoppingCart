package com.example.demo.model;


public class Employee {

    private int eid;
    private String name;
    private int salary;
    private String city;

    public Employee(int eid, String name, int salary, String city) {
        this.eid = eid;
        this.name = name;
        this.salary = salary;
        this.city = city;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
