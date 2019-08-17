package com.example.demo.DataModels;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RegisterModel {
	private String userName;
	private String userPassword;
	private String userRole;
	private String customerName;
	private String customerEmail;
	private String customerMobile;
}
