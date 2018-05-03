package com.Lee;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import DB.DBconnection;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		Job job = (Job)session.getAttribute("job");
		
		Account account = (Account)session.getAttribute("account");
		
		Boolean a = false;
		try {
			Statement sql = new DBconnection().getConnection().createStatement();
			ResultSet rs = sql.executeQuery("select * from jspdemodb_account.apply where username = '" + account.getUsername() + "';");
			while(rs.next()) {
				
				if(rs.getString("info_id").equals(job.getId())) {
					a = true;
					break;
				}
					
					
			}
			
			if(!a) {
				
				sql.execute("insert into apply value('" + account.getUsername() + "','" + job.getId() + "');");
				response.getWriter().print("ok");
			}
			else {
				response.getWriter().print("no");
			}
			
			
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
		doGet(request, response);
	}

}
