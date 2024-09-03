package com.human.dto;

import java.util.Date;

public class AdminDto {
	private int manage_id;
	private String table_name;
	private int table_id;
	private String table_content;
	private String table_crud;
	private String crud_reason;
	private String fileName;
	private Date crud_date;
	
	 // table_content를 받지 않는 경우
    public static AdminDto withoutTableContent(String table_name, int table_id, String table_crud, String crud_reason, String fileName) {
        return new AdminDto(table_name, table_id, null, table_crud, crud_reason, fileName);
    }

    // fileName을 받지 않는 경우
    public static AdminDto withoutFileName(String table_name, int table_id, String table_content, String table_crud, String crud_reason) {
        return new AdminDto(table_name, table_id, table_content, table_crud, crud_reason, null);
    }
    private AdminDto(String table_name, int table_id, String table_content, String table_crud, String crud_reason,
			String fileName) {
		super();
		this.table_name = table_name;
		this.table_id = table_id;
		this.table_content = table_content;
		this.table_crud = table_crud;
		this.crud_reason = crud_reason;
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "AdminDto [manage_id=" + manage_id + ", table_name=" + table_name + ", table_id=" + table_id
				+ ", table_content=" + table_content + ", table_crud=" + table_crud + ", crud_reason=" + crud_reason
				+ ", fileName=" + fileName + ", crud_date=" + crud_date + "]";
	}
	public AdminDto(int manage_id, String table_name, int table_id, String table_content, String table_crud,
			String crud_reason, String fileName, Date crud_date) {
		super();
		this.manage_id = manage_id;
		this.table_name = table_name;
		this.table_id = table_id;
		this.table_content = table_content;
		this.table_crud = table_crud;
		this.crud_reason = crud_reason;
		this.fileName = fileName;
		this.crud_date = crud_date;
	}
	public AdminDto(int table_id,String table_name) {
		super();
		this.table_name = table_name;
		this.table_id = table_id;
	}
	public int getManage_id() {
		return manage_id;
	}
	public void setManage_id(int manage_id) {
		this.manage_id = manage_id;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public int getTable_id() {
		return table_id;
	}
	public void setTable_id(int table_id) {
		this.table_id = table_id;
	}
	public String getTable_crud() {
		return table_crud;
	}
	public void setTable_crud(String table_crud) {
		this.table_crud = table_crud;
	}
	public String getCrud_reason() {
		return crud_reason;
	}
	public void setCrud_reason(String crud_reason) {
		this.crud_reason = crud_reason;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getCrud_date() {
		return crud_date;
	}
	public void setCrud_date(Date crud_date) {
		this.crud_date = crud_date;
	}
	
	public String getTable_content() {
		return table_content;
	}
	public void setTable_content(String table_content) {
		this.table_content = table_content;
	}
	public AdminDto() {
		super();
	}
	
	
	
	
}
