package com.example.demo;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.DataModels.RegisterModel;
import com.example.demo.Models.Customer;
import com.example.demo.Models.User;
import com.example.demo.Repos.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.var;

@RestController
@RequestMapping("/Register")
@RequiredArgsConstructor
class RegisterController {
	
	private final UserRepository userRepository;
	
	@GetMapping("/")
	List<User> getUsers() {
		return userRepository.findAll();
	}
	
	@PutMapping("/new")
	@ResponseBody
	RegisterModel addNewUser(@RequestBody RegisterModel registerModel) {
		
		var c = new Customer();
		c.setCustomerName(registerModel.getCustomerName());
		c.setCustomerMobile(registerModel.getCustomerMobile());
		c.setCustomerEmail(registerModel.getCustomerEmail());
		
		var u = new User();
		u.setUserName(registerModel.getUserName());
		u.setUserPassword(registerModel.getUserPassword());
		u.setUserRole(registerModel.getUserRole());
		u.addCustomer(c);
		
		userRepository.saveAndFlush(u);
		
		return registerModel;
	}

}
