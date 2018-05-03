package com.Lee;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DBconnection;

/**
 * Servlet implementation class userInfoServlet
 */
@WebServlet("/userInfoServlet")
public class userInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("123");
		Account account = (Account)session.getAttribute("account");
		try {
			Statement sql = new DBconnection().getConnection().createStatement();
			ResultSet rs = sql.executeQuery("SELECT * FROM jspdemodb_account.userInfo where username = '" + account.getUsername() + "';");
				rs.next();
				account.setRealname(rs.getString("realname"));
				account.setBirth(rs.getString("birth"));
				account.setSchool(rs.getString("school"));
				
				
				session.setAttribute("account", account);
				response.getWriter().println("ok");
				
				
			
			
			
		} catch (InstantiationException | IllegalAccessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");
		try {
			Statement sql = new DBconnection().getConnection().createStatement();
			System.out.println(request.getParameter("realname"));
			
			sql.execute("update jspdemodb_account.userInfo set realname = '" + request.getParameter("realname") + "',birth = '" + request.getParameter("birth") + "',school = '" + request.getParameter("school") +  "',tele = '" + request.getParameter("tele") + "' where username = '" + account.getUsername() +  "'");
			ResultSet rs = sql.executeQuery("SELECT * FROM jspdemodb_account.userInfo where username = '" + account.getUsername() + "';");
			rs.next();
			
			account.setRealname(rs.getString("realname"));
			account.setBirth(rs.getString("birth"));
			account.setSchool(rs.getString("school"));
			account.setTele(rs.getString("tele"));
			
			session.setAttribute("account", account);
			response.sendRedirect("userCenter.jsp");
			
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

}
