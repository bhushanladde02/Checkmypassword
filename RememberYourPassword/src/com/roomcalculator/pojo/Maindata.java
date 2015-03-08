package com.roomcalculator.pojo;

public class Maindata {
	String detailsId;
	String weblink;
	String username;
	String password;
	String userid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Maindata()
	{
		
	}
	
	
	public Maindata(String detailsId, String weblink, String username,
			String password, String userid) {
		super();
		this.detailsId = detailsId;
		this.weblink = weblink;
		this.username = username;
		this.password = password;
		this.userid = userid;
	}
	

	public String getDetailsId() {
		return detailsId;
	}
	public void setDetailsId(String detailsId) {
		this.detailsId = detailsId;
	}
	public String getWeblink() {
		return weblink;
	}
	public void setWeblink(String weblink) {
		this.weblink = weblink;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
