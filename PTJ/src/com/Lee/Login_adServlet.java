package com.Lee;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DBconnection;

/**
 * Servlet implementation class Login_adServlet
 */
@WebServlet("/Login_adServlet")
public class Login_adServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_adServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username;
		String password;
		username = request.getParameter("username");
		password = request.getParameter("pwd");
		Boolean a = false;
		try {
			Statement sql = new DBconnection().getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from jspdemodb_account.administrator;");
			while(rs.next()) {
				if(rs.getString("administrator_id").equals(username) && rs.getString("password").equals(password)) {
					a = true;
					break;
				}
			}
			
			if(a) {
				Administrator ad = new Administrator(username);
				session.setAttribute("ad", ad);
				
				
				response.sendRedirect("Administrator.jsp");
				
				
				
			}
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
