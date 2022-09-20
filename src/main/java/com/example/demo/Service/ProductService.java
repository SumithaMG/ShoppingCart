package com.example.demo.Service;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository prodRepo;
    public void saveProduct(Product product) {
        prodRepo.save(product);
    }

    public void getProduct(int id) {
        prodRepo.findById(id);
    }

    public List getAllProducts() {
        List<Product> allProds= prodRepo.findAll();
        return allProds;
    }

    public void deleteProduct(int productId) {
        prodRepo.deleteById(productId);
    }


}
