package com.example.demo.Repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Models.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	List<User> findByUserName(String UserName);

}
