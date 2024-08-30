package com.human.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FaqDto {
	private String fGroupKind;
	private int fId;
	private String fTitle;
	private String fContent;
	private String fEtc;
	@DateTimeFormat(pattern="yyyy.MM.dd'T'HH:mm:ss")
	private Date fWriteTime;
	private Date fUpdateTime;
	private String fDelete;
	
	
	public String getFormattedFWriteTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(fWriteTime);
    }
	
	@Override
	public String toString() {
		return "FaqDto [fGroupKind=" + fGroupKind + ", fId=" + fId + ", fTitle=" + fTitle + ", fContent=" + fContent
				+ ", fEtc=" + fEtc + ", fWriteTime=" + fWriteTime + ", fUpdateTime=" + fUpdateTime + ", fDelete="
				+ fDelete + "]";
	}

	public FaqDto() {}
	
	
	
	public FaqDto(String fGroupKind, int fId, String fTitle, String fContent) {
		super();
		this.fGroupKind = fGroupKind;
		this.fId = fId;
		this.fTitle = fTitle;
		this.fContent = fContent;
	}

	public FaqDto(String fGroupKind, int fId, String fTitle, String fContent, String fEtc, Date fWriteTime,
			Date fUpdateTime, String fDelete) {
		super();
		this.fGroupKind = fGroupKind;
		this.fId = fId;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.fEtc = fEtc;
		this.fWriteTime = fWriteTime;
		this.fUpdateTime = fUpdateTime;
		this.fDelete = fDelete;
	}
	public String getfGroupKind() {
		return fGroupKind;
	}
	public void setfGroupKind(String fGroupKind) {
		this.fGroupKind = fGroupKind;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	public String getfEtc() {
		return fEtc;
	}
	public void setfEtc(String fEtc) {
		this.fEtc = fEtc;
	}
	public Date getfWriteTime() {
		return fWriteTime;
	}
	public void setfWriteTime(Date fWriteTime) {
		this.fWriteTime = fWriteTime;
	}
	public Date getfUpdateTime() {
		return fUpdateTime;
	}
	public void setfUpdateTime(Date fUpdateTime) {
		this.fUpdateTime = fUpdateTime;
	}
	public String getfDelete() {
		return fDelete;
	}
	public void setfDelete(String fDelete) {
		this.fDelete = fDelete;
	}
	
	
}
