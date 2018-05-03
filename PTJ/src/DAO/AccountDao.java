package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.Lee.Account;

import DB.DBconnection;

public class AccountDao {
	
	private Connection connection;
	private Statement sql;
	private ResultSet rs;
	
	public AccountDao() {
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
	
	public ArrayList<Account> getAccountList(){
		ArrayList<Account> list = new ArrayList<Account>();
		try {
			rs = sql.executeQuery("select * from jspdemodb_account.userInfo");
			
			while(rs.next()) {
				list.add(new Account(rs.getString("username") , rs.getString("realname") , rs.getString("birth") , rs.getString("school") , rs.getString("tele")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public void deleteAccount(String username) {
		try {
			sql.execute("delete from jspdemodb_account.account where userName = '" + username + "';");
			sql.execute("delete from jspdemodb_account.userInfo where username = '" + username + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void ChangePassword(Account account , String newPassword) {
		
		try {
			sql.execute("update jspdemodb_account.account set password = '" + newPassword + "' where username = '" + account.getUsername() + "' and password = '" + account.getPassword() + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	

}
