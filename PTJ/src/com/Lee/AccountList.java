package com.Lee;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import DB.DBconnection;

public  class AccountList implements Iterable<Account>{
	
	
	private static AccountList instance;
	

	private AccountList() {
		// TODO Auto-generated constructor stub
		
		a_list = new ArrayList<Account>();
		
	}
	
	private ArrayList<Account> a_list;
	
	
	
	public static AccountList getInstance(){
        if(instance==null){
            instance=new AccountList();
            update();
        }
        
       
        
        return instance;
    }
	
	
	

	@Override
	public Iterator<Account> iterator() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void addAccount(Account account) {
		
		a_list.add(account);
		
		
	}
	
	public boolean checkAccount(Account account) {
		for(Account p : a_list) {
			
			if(p.getUsername().equals(account.getUsername()) && p.getPassword().equals(account.getPassword()))
				return true;
			
		}
		return false;
	}
	
	public int numOfAccount() {
		return a_list.size();
	}
	
	public boolean nameExist(String a) {
		
		for(Account p : a_list) {
			
			if(p.getUsername().equals(a))
				return true;
			
		}
		
		return false;
		
	}
	
	public static void update() {
		
		
		
		
		
		
		try {
			
			Statement sql = new DBconnection().getConnection().createStatement();
			ResultSet rs = sql.executeQuery("SELECT * FROM jspdemodb_account.account;");
			String dbread_username;
			String dbread_password;
			instance = new AccountList();
			AccountList list = AccountList.getInstance();
			while(rs.next()) {
				
				dbread_username = rs.getString("userName");
				dbread_password = rs.getString("password");
				list.addAccount(new Account(dbread_username , dbread_password));
				
				
			}
			
			
		}catch(SQLException se) {
			se.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	

}
