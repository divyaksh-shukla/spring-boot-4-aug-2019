package com.example.demo.Models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the OrderHeader database table.
 * 
 */
@Data
@NoArgsConstructor
@Entity
@NamedQuery(name="OrderHeader.findAll", query="SELECT o FROM OrderHeader o")
public class OrderHeader implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="OrderHeaderId")
	private int orderHeaderId;

	@Column(name="OrderAmount")
	private BigDecimal orderAmount;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="OrderDate")
	private Date orderDate;

	@Column(name="OrderStatus")
	private String orderStatus;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="CustomerId")
	private Customer customer;

	//bi-directional many-to-one association to OrderProductLine
	@OneToMany(mappedBy="orderHeader")
	private List<OrderProductLine> orderProductLines;

	public OrderProductLine addOrderProductLine(OrderProductLine orderProductLine) {
		getOrderProductLines().add(orderProductLine);
		orderProductLine.setOrderHeader(this);

		return orderProductLine;
	}

	public OrderProductLine removeOrderProductLine(OrderProductLine orderProductLine) {
		getOrderProductLines().remove(orderProductLine);
		orderProductLine.setOrderHeader(null);

		return orderProductLine;
	}

}