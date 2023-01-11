package com.newlecture.web.entity;

import java.util.Date;

public class NoticeView extends Notice {
	private String userName;
	
	public NoticeView() {	// CTRL + Space
		// TODO Auto-generated constructor stub
	}

	public NoticeView(int id, String title, String writerId, Date regDate, String content, int hit, String files, String userName) {	// Source > Generate Constructure from superclass
		super(id, title, writerId, regDate, content, hit, files);
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "NoticeView [userName=" + userName + ", getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getWriterId()=" + getWriterId() + ", getRegDate()=" + getRegDate() + ", getContent()="
				+ getContent() + ", getHit()=" + getHit() + ", getFiles()=" + getFiles() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
