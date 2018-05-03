package com.Lee;

public class Job {

	private String id;
	private String publisher;
	private String date;
	private String title;
	private int remuneration;
	private String description;
	private int num_of_people;
	
	
	public Job(String a , String b, String c , String d , int e ,String f , int g ) {
		// TODO Auto-generated constructor stub
		id = a; publisher = b; date = c; title = d;remuneration = e;description = f;num_of_people = g;
	}
	
	public Job(String a,String b) {
		id = a;title = b;
	}
	
	

	public String getId() {
		return id;
	}

	public String getPublisher() {
		return publisher;
	}
	
	public String getDate() {
		return date;
	}
	
	public String getTitle() {
		return title;
	}
	
	public int getRemuneration() {
		return remuneration;
	}
	
	public String getDescription() {
		return description;
	}
	
	public int getNum_of_people() {
		return num_of_people;
	}
}
