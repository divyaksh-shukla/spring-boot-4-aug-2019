package com.example.demo.Models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;


/**
 * The persistent class for the OrderProductLine database table.
 * 
 */
@Data
@NoArgsConstructor
@Entity
@NamedQuery(name="OrderProductLine.findAll", query="SELECT o FROM OrderProductLine o")
public class OrderProductLine implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="OrderProductLineId")
	private int orderProductLineId;

	@Column(name="Amount")
	private BigDecimal amount;

	@Column(name="Quantity")
	private int quantity;

	//bi-directional many-to-one association to OrderHeader
	@ManyToOne
	@JoinColumn(name="OrderHeaderId")
	private OrderHeader orderHeader;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="ProductId")
	private Product product;

}