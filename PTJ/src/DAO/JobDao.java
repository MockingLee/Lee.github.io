package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import DB.DBconnection;
import com.Lee.Job;

public class JobDao {
	
	private Connection connection;
	private Statement sql;
	private ResultSet rs;

	public JobDao() {
		// TODO Auto-generated constructor stub
		
		try {
			connection = new DBconnection().getConnection();
			sql = connection.createStatement();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Job> getJoblist(){
		
		try {
			rs = sql.executeQuery("SELECT * FROM jspdemodb_account.JobInfo");
			Job job;
			ArrayList joblist = new ArrayList<Job>();
			while(rs.next()) {
				job = new Job(rs.getString("info_id") , rs.getString("publisher") , rs.getString("date") , rs.getString("title") , Integer.parseInt(rs.getString("remuneration")) , rs.getString("description") , Integer.parseInt(rs.getString("num_of_people")));
				joblist.add(job);
			}
			return joblist;
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	
	}
	
	public void delete(String id) {
		try {
			
			sql.execute("delete from JobInfo where info_id = '" + id + "';");
			new ApplyDao().deletApplyWithJobInfo(id);
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Job getJob(String id) {
		try {
			rs = sql.executeQuery("SELECT * FROM jspdemodb_account.JobInfo");
			Job job;
			
			while(rs.next()) {
				job = new Job(rs.getString("info_id") , rs.getString("publisher") , rs.getString("date") , rs.getString("title") , Integer.parseInt(rs.getString("remuneration")) , rs.getString("description") , Integer.parseInt(rs.getString("num_of_people")));
				if(job.getId().equals(id))
					return job;
			}
		
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void modify(String id,String title , String publisher , int remuneration , int peoplesum , String description ) {
		try {
			sql.execute("update jspdemodb_account.JobInfo set publisher ='" + publisher + "',remuneration = '" + remuneration + "',num_of_people = '" + peoplesum + "',description ='" + description + "' where info_id ='" + id + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getNextAddonId() {
		String id = "";
		try {
			rs = sql.executeQuery("SELECT count(jspdemodb_account.JobInfo.info_id) from jspdemodb_account.JobInfo;");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs.next();
			id = rs.getString(1);
			if(id.equals("0"))
				return "001";
			id = "" + (Integer.parseInt(id) + 1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(id.length() == 3)
			return id;
		else if(id.length() == 2)
			return "0" + id;
		else if(id.length() == 1)
			return "00" + id;
		
		return "001";
		
		
	}
	
	public void publishJob(String id , String publisher , String date , String title , String remuneration , String description , String num_of_people) {
		
		try {
			System.out.println("insert into jspdemodb_account.JobInfo value('" + id + "','" + publisher + "','" + date + "','" + title + "'," + remuneration + ",'" + description + "'," + num_of_people + ")");
			sql.execute("insert into jspdemodb_account.JobInfo value('" + id + "','" + publisher + "','" + date + "','" + title + "','" + remuneration + "','" + description + "'," + num_of_people + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
