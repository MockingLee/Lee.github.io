package com.Lee;

public class Account {
	
	private String username;
	private String password;
	private String realname;
	private String birth;
	private String school;
	private String tele;

	public Account(String a, String b) {
		// TODO Auto-generated constructor stub
		username = a;
		password = b;
		
		
	}
	
	public Account(String a, String b, String c , String d ,String e , String f) {
		// TODO Auto-generated constructor stub
		username = a;
		password = b;
		realname = c;
		birth = d;
		school = e;
		tele = f;
		
	}
	
	public Account(String a, String c , String d ,String e , String f) {
		// TODO Auto-generated constructor stub
		username = a;
		
		realname = c;
		birth = d;
		school = e;
		tele = f;
		
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setUsername(String a) {
		username = a;
	}
	
	public void setPassword(String a) {
		password = a;
	}
	
	public void setRealname(String a ) {
		realname = a;
	}
	
	public void setBirth(String a ) {
		birth = a;
	}
	
	public void setSchool(String a ) {
		school = a;
	}
	public void setTele(String a ) {
		tele = a;
	}
	
	public String getRealname() {
		return realname;
	}
	
	public String getBirth() {
		return birth;
	}
	
	public String getSchool() {
		return school;
	}
	public String getTele() {
		return tele;
	}
}
