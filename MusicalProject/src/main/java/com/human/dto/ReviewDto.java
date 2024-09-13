package com.human.dto;






import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewDto {
	private Integer review_id;
	private String customer_id;
	private Integer musical_id;
	private String content;
	private Integer rating;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date review_date;
	private Integer totalCount;
	
	//조인용
	private String musical_title;



	public ReviewDto(Integer review_id, String customer_id, Integer musical_id, String content, Integer rating,
			Date review_date, String musical_title) {
		super();
		this.review_id = review_id;
		this.customer_id = customer_id;
		this.musical_id = musical_id;
		this.content = content;
		this.rating = rating;
		this.review_date = review_date;
		this.musical_title = musical_title;
	}
	public ReviewDto(Integer review_id,  Integer musical_id, String content, Integer rating,
			Date review_date, String musical_title) {
		super();
		this.review_id = review_id;
		
		this.musical_id = musical_id;
		this.content = content;
		this.rating = rating;
		this.review_date = review_date;
		this.musical_title = musical_title;
	}
	
	public Integer getTotalCount() {
		return totalCount;
	}






	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	

	public String getMusical_title() {
		return musical_title;
	}



	public void setMusical_title(String musical_title) {
		this.musical_title = musical_title;
	}

	public ReviewDto(Integer review_id, String customer_id, Integer musical_id, String content, Integer rating,
			Date review_date) {
		super();
		this.review_id = review_id;
		this.customer_id = customer_id;
		this.musical_id = musical_id;
		this.content = content;
		this.rating = rating;
		this.review_date = review_date;
	}



	@Override
	public String toString() {
		return "ReviewDto [review_id=" + review_id + ", customer_id=" + customer_id + ", musical_id=" + musical_id
				+ ", content=" + content + ", rating=" + rating + ", review_date=" + review_date + "]";
	}



	public Integer getReview_id() {
		return review_id;
	}



	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}



	public String getCustomer_id() {
		return customer_id;
	}



	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}



	public Integer getMusical_id() {
		return musical_id;
	}



	public void setMusical_id(Integer musical_id) {
		this.musical_id = musical_id;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Integer getRating() {
		return rating;
	}



	public void setRating(Integer rating) {
		this.rating = rating;
	}



	public Date getReview_date() {
		return review_date;
	}



	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}



	public ReviewDto() {}
	
}
