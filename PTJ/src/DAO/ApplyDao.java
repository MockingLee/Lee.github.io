package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DB.DBconnection;

public class ApplyDao {
	
	private Connection connection;
	private Statement sql;
	private ResultSet rs;

	public ApplyDao() {
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
	
	public void deleteApply(String info_id , String username) {
		try {
			sql.execute("delete from jspdemodb_account.apply where info_id = '" + info_id + "' and username = '" + username + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deletApplyWithJobInfo(String id) {
		try {
			sql.execute("delete from jspdemodb_account.apply where info_id = '" + id + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
