package com.example.demo.Models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


/**
 * The persistent class for the Product database table.
 * 
 */
@Data
@NoArgsConstructor
@Entity
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ProductId")
	private int productId;

	@Column(name="ProductDesc")
	private String productDesc;

	@Column(name="ProductName")
	private String productName;

	@Column(name="ProductPrice")
	private double productPrice;

	@Column(name="ProductQOH")
	private int productQOH;

	@Column(name="ProductStatus")
	private String productStatus;

	//bi-directional many-to-one association to Cart
	@OneToMany(mappedBy="product")
	private List<Cart> carts;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="product")
	private List<Comment> comments;

	//bi-directional many-to-one association to OrderProductLine
	@OneToMany(mappedBy="product")
	private List<OrderProductLine> orderProductLines;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="CategoryId")
	private Category category;

	public Cart addCart(Cart cart) {
		getCarts().add(cart);
		cart.setProduct(this);

		return cart;
	}

	public Cart removeCart(Cart cart) {
		getCarts().remove(cart);
		cart.setProduct(null);

		return cart;
	}

	public Comment addComment(Comment comment) {
		getComments().add(comment);
		comment.setProduct(this);

		return comment;
	}

	public Comment removeComment(Comment comment) {
		getComments().remove(comment);
		comment.setProduct(null);

		return comment;
	}

	public OrderProductLine addOrderProductLine(OrderProductLine orderProductLine) {
		getOrderProductLines().add(orderProductLine);
		orderProductLine.setProduct(this);

		return orderProductLine;
	}

	public OrderProductLine removeOrderProductLine(OrderProductLine orderProductLine) {
		getOrderProductLines().remove(orderProductLine);
		orderProductLine.setProduct(null);

		return orderProductLine;
	}

}