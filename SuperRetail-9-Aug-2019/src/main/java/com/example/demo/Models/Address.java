package com.example.demo.Models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * The persistent class for the Address database table.
 * 
 */
@Data
@NoArgsConstructor
@Entity
@NamedQuery(name="Address.findAll", query="SELECT a FROM Address a")
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="AddressId")
	private int addressId;

	@Column(name="AddressCity")
	private String addressCity;

	@Column(name="AddressContactPerson")
	private String addressContactPerson;

	@Column(name="AddressLatitude")
	private double addressLatitude;

	@Column(name="AddressLine1")
	private String addressLine1;

	@Column(name="AddressLine2")
	private String addressLine2;

	@Column(name="AddressLongitude")
	private double addressLongitude;

	@Column(name="AddressPincode")
	private String addressPincode;

	@Column(name="AddressState")
	private String addressState;

	@Column(name="AddressType")
	private String addressType;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="CustomerId")
	private Customer customer;

}