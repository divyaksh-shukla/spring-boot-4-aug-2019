package com.example.demo.Repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Models.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
