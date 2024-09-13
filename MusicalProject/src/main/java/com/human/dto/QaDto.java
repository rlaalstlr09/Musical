package com.human.dto;

public class QaDto {
	private int qa_id;
	private String customer_id;
	private Integer musical_id;
	private String qa_type;
	private String title;
	private String content;
	private String response;
	private int display;
	
	//페이징 용
	private Integer totalcount;
	
	public QaDto() {}
	
	
	
	public QaDto(int qa_id, String customer_id, String qa_type, String title, String content, String response,
			int display) {
		super();
		this.qa_id = qa_id;
		this.customer_id = customer_id;
		this.qa_type = qa_type;
		this.title = title;
		this.content = content;
		this.response = response;
		this.display = display;
	}

	public QaDto(int qa_id, String customer_id, Integer musical_id, String title, String content, String response,
			int display) {
		super();
		this.qa_id = qa_id;
		this.customer_id = customer_id;
		this.musical_id = musical_id;
		this.title = title;
		this.content = content;
		this.response = response;
		this.display = display;
	}


	@Override
	public String toString() {
		return "QaDto [qa_id=" + qa_id + ", customer_id=" + customer_id + ", qa_type=" + qa_type + ", title=" + title
				+ ", content=" + content + ", response=" + response + ", display=" + display + "]";
	}

	
	
	public Integer getMusical_id() {
		return musical_id;
	}



	public void setMusical_id(Integer musical_id) {
		this.musical_id = musical_id;
	}



	public Integer getTotalcount() {
		return totalcount;
	}



	public void setTotalcount(Integer totalcount) {
		this.totalcount = totalcount;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



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
	
	
}
