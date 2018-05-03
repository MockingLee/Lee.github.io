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
 * Servlet implementation class JobDetailsServlet
 */
@WebServlet("/JobDetailsServlet")
public class JobDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String info_id = request.getParameter("info_id");
		Statement sql;
		try {
			sql = new DBconnection().getConnection().createStatement();
			ResultSet rs = sql.executeQuery("SELECT * FROM jspdemodb_account.JobInfo where info_id = '" + info_id + "';");
			rs.next();
			Job job = new Job(rs.getString("info_id") , rs.getString("publisher") , rs.getString("date") , rs.getString("title") , Integer.parseInt(rs.getString("remuneration")) , rs.getString("description") , Integer.parseInt(rs.getString("num_of_people")));
			session.setAttribute("job", job);
			response.sendRedirect("JobDetails.jsp");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
