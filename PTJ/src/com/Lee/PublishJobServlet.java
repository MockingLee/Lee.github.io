package com.Lee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Calendar;
import java.util.Date;

import DAO.JobDao;

/**
 * Servlet implementation class PublishJobServlet
 */
@WebServlet("/PublishJobServlet")
public class PublishJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishJobServlet() {
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
		Calendar c=Calendar.getInstance();
    	int y=c.get(Calendar.YEAR);
    	int m=c.get(Calendar.MONTH) +1;
    	int d=c.get(Calendar.DATE);
		new JobDao().publishJob(request.getParameter("info_id"), request.getParameter("publisher"), y + "-" + m + "-" + d , request.getParameter("title"), request.getParameter("remuneration"), request.getParameter("description"), request.getParameter("peoplesum"));
		response.getWriter().print("ok");
		
	}

}
