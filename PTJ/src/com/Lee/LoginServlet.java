package com.Lee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DBconnection;

import java.sql.*;
import java.util.ArrayList;
/**
 * Servlet implementation class ServletDemo
 */
@WebServlet("/ServletDemo")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = request.getParameter("username");
		String password = request.getParameter("pwd");
		Account account = new Account(name , password);
		
		AccountList.update();
		if(AccountList.getInstance().checkAccount(account)) {
			
			ServletContext app = this.getServletContext();
			ArrayList<Account> onlinelist = (ArrayList<Account>)app.getAttribute("onlinelist");
			if(onlinelist == null) {
				onlinelist = new ArrayList<Account>();
			}
			
			
			
			if(!onlinelist.contains(account)) {
				onlinelist.add(account);
				app.setAttribute("onlinelist", onlinelist);
			
			
			
			Statement sql;
			try {
				sql = new DBconnection().getConnection().createStatement();
				ResultSet rs = sql.executeQuery("SELECT * FROM jspdemodb_account.userInfo where username = '" + account.getUsername() + "';");
				rs.next();
				account.setRealname(rs.getString("realname"));
				account.setBirth(rs.getString("birth"));
				account.setSchool(rs.getString("school"));
				account.setTele(rs.getString("tele"));
				session.setAttribute("account", account);
			}catch (InstantiationException | IllegalAccessException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("Welcome.jsp");
			
			
			}else {
				response.sendRedirect("login_fail.jsp");
			}
				
			
			}else{
				response.sendRedirect("login_fail.jsp");
			}
			
			
		
	}
	
/*	public void init() throws ServletException {
		  // 初始化代码...
		
		Connection connection;
		Statement sql;
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		try {
			String url = "jdbc:mysql://localhost/jspdemodb_account";
			String username = "root";
			String password = "lijixuan";
			connection = DriverManager.getConnection(url, username, password);
			sql = connection.createStatement();
			rs = sql.executeQuery("SELECT * FROM jspdemodb_account.account;");
			String dbread_username;
			String dbread_password;
			AccountList list = AccountList.getInstance();
			while(rs.next()) {
				
				dbread_username = rs.getString("userName");
				dbread_password = rs.getString("password");
				list.addAccount(new Account(dbread_username , dbread_password));
				
				
			}
			
			System.out.println("读取数据库里有" + list.numOfAccount()   + " 个账号");
			
			
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		
		
		
		
		}*/

}
