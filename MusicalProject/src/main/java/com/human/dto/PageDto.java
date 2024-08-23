package com.human.dto;

public class PageDto {
	private int page = 1;
	private int perPageNum = 10;
	private int totalstartPage;
	private int totalendPage;
	private int totalcount;

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	
	
	




	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public int getPerPageNum() {
		return perPageNum;
	}



	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}



	public int getTotalstartPage() {
		return totalstartPage;
	}



	public void setTotalstartPage(int totalstartPage) {
		this.totalstartPage = totalstartPage;
	}



	public int getTotalendPage() {
		return totalendPage;
	}



	public void setTotalendPage(int totalendPage) {
		this.totalendPage = totalendPage;
	}



	public int getTotalcount() {
		return totalcount;
	}



	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
		calData();
	}

	private void calData() {
		totalstartPage=1;
		totalendPage=(int)Math.ceil(totalcount/(double)perPageNum);
	    endPage = (int) (Math.ceil(page /(double) displayPageNum)* displayPageNum);
	    startPage=endPage-displayPageNum+1;
	    if(totalendPage < endPage) {
	    	endPage=totalendPage;
	    }
	    if(startPage<1) {
	    	startPage=1;
	    }
	    if(startPage==1) {
	    	prev=false;
	    }else {
	    	prev=true;
	    }
	    if(endPage==totalendPage) {
	    	next=false;
	    }else {
	    	next=true;
	    }
	}


	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public boolean isPrev() {
		return prev;
	}



	public void setPrev(boolean prev) {
		this.prev = prev;
	}



	public boolean isNext() {
		return next;
	}



	public void setNext(boolean next) {
		this.next = next;
	}



	public int getDisplayPageNum() {
		return displayPageNum;
	}



	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}



	@Override
	public String toString() {
		return "PageDto [page=" + page + ", perPageNum=" + perPageNum + ", totalstartPage=" + totalstartPage
				+ ", totalendPage=" + totalendPage + ", totalcount=" + totalcount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
}
