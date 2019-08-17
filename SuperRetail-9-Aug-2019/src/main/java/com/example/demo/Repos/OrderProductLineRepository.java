package com.example.demo.Repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Models.OrderProductLine;
public interface OrderProductLineRepository extends JpaRepository<OrderProductLine, Integer> {

}
