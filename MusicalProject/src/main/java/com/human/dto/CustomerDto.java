
package com.human.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CustomerDto {
	
	private String customer_id;
	private String customer_pw;
	private String customer_phone;
	private String customer_email;
	private String customer_address;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date customer_birth;
	private String authority;
	private int enabled;
	
	
	
	public CustomerDto(String customer_id, String customer_pw, String customer_phone, String customer_email,
			String customer_address, Date customer_birth, String authority, int enabled) {
		super();
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_phone = customer_phone;
		this.customer_email = customer_email;
		this.customer_address = customer_address;
		this.customer_birth = customer_birth;
		this.authority = authority;
		this.enabled = enabled;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "CustomerDto [customer_id=" + customer_id + ", customer_pw=" + customer_pw + ", customer_phone="
				+ customer_phone + ", customer_email=" + customer_email + ", customer_address=" + customer_address
				+ ", customer_birth=" + customer_birth + ", authority=" + authority + "]";
	}

	public CustomerDto() {}
	public CustomerDto(String customer_id, String customer_pw, String customer_phone, String customer_email,
			String customer_address, Date customer_birth, String authority) {
		super();
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
		this.customer_phone = customer_phone;
		this.customer_email = customer_email;
		this.customer_address = customer_address;
		this.customer_birth = customer_birth;
		this.authority = authority;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_pw() {
		return customer_pw;
	}

	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public Date getCustomer_birth() {
		return customer_birth;
	}

	public void setCustomer_birth(Date customer_birth) {
		this.customer_birth = customer_birth;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
}
