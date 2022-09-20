package com.example.demo.Service;

import com.example.demo.model.Employee;
import com.example.demo.repository.DemoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class DemoService {

    @Autowired
    private DemoRepository repo;
    public void findEmpService() {
        List<Employee> emp = repo.findAllEmp();
       List<Employee> result= emp.stream().filter(e->e.getSalary()>1000).collect(Collectors.toList());
       for(Employee e : result){
           System.out.println(e.getEid() + " "+ e.getName());
       }
    }
}
