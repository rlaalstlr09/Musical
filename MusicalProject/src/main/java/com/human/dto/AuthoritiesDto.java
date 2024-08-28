
package com.human.dto;

public class AuthoritiesDto {
	
	private String customer_id;
	private String authority;
	
	@Override
	public String toString() {
		return "AuthoritiesDto [customer_id=" + customer_id + ", authority=" + authority + "]";
	}
	
	public AuthoritiesDto() {}
	public AuthoritiesDto(String customer_id, String authority) {
		super();
		this.customer_id = customer_id;
		this.authority = authority;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
	
}
