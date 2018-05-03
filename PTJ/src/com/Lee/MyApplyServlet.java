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
 * Servlet implementation class MyApplyServlet
 */
@WebServlet("/MyApplyServlet")
public class MyApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Account account = (Account)session.getAttribute("account");	
		try {
			
			Statement sql = new DBconnection().getConnection().createStatement();
			
			ResultSet rs = sql.executeQuery("select title,JobInfo.info_id from jspdemodb_account.apply,jspdemodb_account.JobInfo where apply.username = '" + account.getUsername() + "' AND JobInfo.info_id = apply.info_id;");
			Job job;
			ArrayList myapply_joblist = new ArrayList<Job>();
			while(rs.next()) {
				job = new Job(rs.getString("info_id"),rs.getString("title")); //只加入id和title，列表只显示title，id用来访问job
				myapply_joblist.add(job);
			}
			
			session.setAttribute("myapply_joblist", myapply_joblist);
			response.sendRedirect("MyApply.jsp");
			
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
