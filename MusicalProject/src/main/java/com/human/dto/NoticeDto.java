package com.human.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeDto {
	private String nGroupKind;
	private int nId;
	private String nTitle;
	private String nContent;
	private String nEtc;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date nOpenTime;
	@DateTimeFormat(pattern="yyyy.MM.dd'T'HH:mm:ss")
	private Date nWriteTime;
	private Date nUpdateTime;
	private int nHit;
	private String nDelete;
	
	public String getFormattedNWriteTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(nWriteTime);
    }
	public String getFormattedNOpenTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(nOpenTime);
    }
	
	
	@Override
	public String toString() {
		return "NoticeDto [nGroupKind=" + nGroupKind + ", nId=" + nId + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nEtc=" + nEtc + ", nOpenTime=" + nOpenTime + ", nWriteTime=" + nWriteTime + ", nUpdateTime="
				+ nUpdateTime + ", nHit=" + nHit + ", nDelete=" + nDelete + "]";
	}
	
	public NoticeDto() {}
	
	public NoticeDto(String nGroupKind, int nId, String nTitle, String nContent, String nEtc, Date nOpenTime,
			Date nWriteTime, Date nUpdateTime, int nHit, String nDelete) {
		super();
		this.nGroupKind = nGroupKind;
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nEtc = nEtc;
		this.nOpenTime = nOpenTime;
		this.nWriteTime = nWriteTime;
		this.nUpdateTime = nUpdateTime;
		this.nHit = nHit;
		this.nDelete = nDelete;
	}
	public String getnGroupKind() {
		return nGroupKind;
	}
	public void setnGroupKind(String nGroupKind) {
		this.nGroupKind = nGroupKind;
	}
	public int getnId() {
		return nId;
	}
	public void setnId(int nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnEtc() {
		return nEtc;
	}
	public void setnEtc(String nEtc) {
		this.nEtc = nEtc;
	}
	public Date getnOpenTime() {
		return nOpenTime;
	}
	public void setnOpenTime(Date nOpenTime) {
		this.nOpenTime = nOpenTime;
	}
	public Date getnWriteTime() {
		return nWriteTime;
	}
	public void setnWriteTime(Date nWriteTime) {
		this.nWriteTime = nWriteTime;
	}
	public Date getnUpdateTime() {
		return nUpdateTime;
	}
	public void setnUpdateTime(Date nUpdateTime) {
		this.nUpdateTime = nUpdateTime;
	}
	public int getnHit() {
		return nHit;
	}
	public void setnHit(int nHit) {
		this.nHit = nHit;
	}
	public String getnDelete() {
		return nDelete;
	}
	public void setnDelete(String nDelete) {
		this.nDelete = nDelete;
	}
	
	
	
	
}
