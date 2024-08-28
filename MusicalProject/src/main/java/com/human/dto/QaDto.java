package com.human.dto;

public class QaDto {
	
	private int qa_id;
	private String customer_id;
	private String qa_type;
	private String title;
	private String content;
	private String response;
	private int display;
	public int getQa_id() {
		return qa_id;
	}
	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getQa_type() {
		return qa_type;
	}
	public void setQa_type(String qa_type) {
		this.qa_type = qa_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [qa_id=" + qa_id + ", customer_id=" + customer_id + ", qa_type=" + qa_type + ", title=" + title
				+ ", content=" + content + ", response=" + response + ", display=" + display + "]";
	}
	
	

}
