package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

import DB.DBconnection;
import com.Lee.Account;




public class UserInfoDao {
	private Connection connection;
	private Statement sql;
	private ResultSet rs;

	public UserInfoDao() {
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
	
	public ArrayList<Account> getApplyList(String id){
		ArrayList<Account> list = new ArrayList<Account>();
		try {
			rs = sql.executeQuery("select * from jspdemodb_account.userInfo,jspdemodb_account.apply where userInfo.username = apply.username and apply.info_id = '" + id + "';");
			
			while(rs.next()) {
				
				list.add(new Account(rs.getString("username") , rs.getString("realname") , rs.getString("birth") , rs.getString("school") , rs.getString("tele")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	

}
