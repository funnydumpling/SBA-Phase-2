package com.eval.coronakit.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class ProductMaster {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "pname")
	@NotNull(message = "Product Name cannot be omitted")
	@NotBlank(message = "Product Name cannot be blank.")
	@Size(min = 2,message = "Product Name should contain minimum of 2 charaters atleast.")
	private String productName;

	@Column(name = "cost")
	@NotNull(message = "Product Cost cannot be omitted")
	@Min(value = 10, message = "Product Cost should contain a minimum of Rs.10 atleast")
	private Integer cost;

	@Column(name = "description")
	@NotNull(message = "Product Description cannot be omitted")
	@NotBlank(message = "Product Description  cannot be blank.")
	@Size(min = 5, max = 100, message = "Product Description should contain minimum of 5 charaters atleast.")
	private String productDescription;

	public ProductMaster() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductMaster(int id, String productName, Integer cost, String productDescription) {
		super();
		this.id = id;
		this.productName = productName;
		this.cost = cost;
		this.productDescription = productDescription;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	@Override
	public String toString() {
		return "ProductMaster [id=" + id + ", productName=" + productName + ", cost=" + cost + ", productDescription="
				+ productDescription + "]";
	}

}

	


