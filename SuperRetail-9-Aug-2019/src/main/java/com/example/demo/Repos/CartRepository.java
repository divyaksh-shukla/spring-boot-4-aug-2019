package com.example.demo.Repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Models.*;

public interface CartRepository extends JpaRepository<Cart, Integer> {

}
