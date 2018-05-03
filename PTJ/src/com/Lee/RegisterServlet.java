package com.Lee;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

import DB.DBconnection;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = request.getParameter("username");
		String password = request.getParameter("pwd");
		if(!AccountList.getInstance().nameExist(name)) {
			
			try {
				Statement sql = new DBconnection().getConnection().createStatement();
				sql.execute("insert into account value('" + name + "'" + "," + "'" + password + "');" );
				sql.execute("insert into userInfo value('" + name + "',null,null,null,null);");
				AccountList.update();
				session.setAttribute("account",new Account(name , password));
				response.sendRedirect("sign_success.jsp");
				
			} catch (InstantiationException | IllegalAccessException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			
			System.out.println("用户名存在");
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = request.getParameter("username");
		AccountList.update();
		if(AccountList.getInstance().nameExist(name)) {
			response.getWriter().print("no");
		}else {
			response.getWriter().print("ok");
		}
		
	}

}
