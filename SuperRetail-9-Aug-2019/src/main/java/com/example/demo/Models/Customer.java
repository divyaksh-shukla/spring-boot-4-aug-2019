package com.example.demo.Models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


/**
 * The persistent class for the Customer database table.
 * 
 */
@Data
@NoArgsConstructor
@Entity
@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="CustomerId")
	private int customerId;

	@Column(name="CustomerEmail")
	private String customerEmail;

	@Column(name="CustomerMobile")
	private String customerMobile;

	@Column(name="CustomerName")
	private String customerName;

	//bi-directional many-to-one association to Address
	@OneToMany(mappedBy="customer")
	private List<Address> addresses;

	//bi-directional many-to-one association to Cart
	@OneToMany(mappedBy="customer")
	private List<Cart> carts;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="customer")
	private List<Comment> comments;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="UserId")
	private User user;

	//bi-directional many-to-one association to OrderHeader
	@OneToMany(mappedBy="customer")
	private List<OrderHeader> orderHeaders;

	public Address addAddress(Address address) {
		getAddresses().add(address);
		address.setCustomer(this);

		return address;
	}

	public Address removeAddress(Address address) {
		getAddresses().remove(address);
		address.setCustomer(null);

		return address;
	}

	public Cart addCart(Cart cart) {
		getCarts().add(cart);
		cart.setCustomer(this);

		return cart;
	}

	public Cart removeCart(Cart cart) {
		getCarts().remove(cart);
		cart.setCustomer(null);

		return cart;
	}

	public Comment addComment(Comment comment) {
		getComments().add(comment);
		comment.setCustomer(this);

		return comment;
	}

	public Comment removeComment(Comment comment) {
		getComments().remove(comment);
		comment.setCustomer(null);

		return comment;
	}

	public OrderHeader addOrderHeader(OrderHeader orderHeader) {
		getOrderHeaders().add(orderHeader);
		orderHeader.setCustomer(this);

		return orderHeader;
	}

	public OrderHeader removeOrderHeader(OrderHeader orderHeader) {
		getOrderHeaders().remove(orderHeader);
		orderHeader.setCustomer(null);

		return orderHeader;
	}

}