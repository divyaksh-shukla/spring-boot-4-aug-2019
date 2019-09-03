package com.example.demo.Models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;


/**
 * The persistent class for the Users database table.
 * 
 */
@Data
@NoArgsConstructor
@Entity
@Table(name="Users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="UserId")
	private int userId;

	@Column(name="UserName")
	private String userName;

	@Column(name="UserPassword")
	private String userPassword;

	@Column(name="UserRole")
	private String userRole;

	@Column(name="UserStatus")
	private String userStatus;

	//bi-directional many-to-one association to Customer
	@OneToMany(mappedBy="user")
	private List<Customer> customers;

	public Customer addCustomer(Customer customer) {
		
		// just a check
		if(getCustomers() == null) {
			customers = new ArrayList<Customer>();
		}
		getCustomers().add(customer);
		customer.setUser(this);

		return customer;
	}

	public Customer removeCustomer(Customer customer) {
		getCustomers().remove(customer);
		customer.setUser(null);

		return customer;
	}

}