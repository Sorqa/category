package com.test.sku.pet;

import java.sql.Date;

public class PetVO {
	private int no;
	private String name;
	private String origin;
	private float weight;
	private java.sql.Date birth;
	private int price;
	private String pic;
	
	public PetVO() {}
	

	public PetVO(int no, String name, String origin, float weight, Date birth, int price, String pic) {
		super();
		this.no = no;
		this.name = name;
		this.origin = origin;
		this.weight = weight;
		this.birth = birth;
		this.price = price;
		this.pic = pic;
	}


	public PetVO(String name, String origin, float weight, Date birth, int price, String pic) {
		super();
		this.name = name;
		this.origin = origin;
		this.weight = weight;
		this.birth = birth;
		this.price = price;
		this.pic = pic;
	}


	public PetVO(int no, String name, String origin, float weight, Date birth, int price) {
		super();
		this.no = no;
		this.name = name;
		this.origin = origin;
		this.weight = weight;
		this.birth = birth;
		this.price = price;
	}


	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public java.sql.Date getBirth() {
		return birth;
	}

	public void setBirth(java.sql.Date birth) {
		this.birth = birth;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
}
