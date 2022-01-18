package com.newlecture.web.entity;

import java.util.Date;

public class NoticeView extends Notice {
	private String memberName;
	
	public NoticeView() {	// CTRL + Space
		// TODO Auto-generated constructor stub
	}

	public NoticeView(int id, String title, String writerId, Date regDate, String content, int hit, String files, String memberName) {	// Source > Generate Constructure from superclass
		super(id, title, writerId, regDate, content, hit, files);
		this.memberName = memberName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "NoticeView [memberName=" + memberName + ", getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getWriterId()=" + getWriterId() + ", getRegDate()=" + getRegDate() + ", getContent()="
				+ getContent() + ", getHit()=" + getHit() + ", getFiles()=" + getFiles() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
