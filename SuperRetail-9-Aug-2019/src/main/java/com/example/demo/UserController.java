package com.example.demo;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Models.User;
import com.example.demo.Repos.UserRepository;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/User")
@RequiredArgsConstructor
public class UserController {
	private final UserRepository userRepository;
	
//	@GetMapping("/{id}")
//	@ResponseBody
//	User getUser(int id) {
//		return userRepository.findById(id).get();
//	}
	
	@GetMapping("/{UserName}")
	@ResponseBody
	List<User> getUserByName(@PathVariable("UserName") String UserName) {
		
		return userRepository.findByUserName(UserName);
	}
}
