<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="com.Lee.Job"%>
    <%@ page language="java" import="com.Lee.Administrator"%>
    <%@ page language="java" import="DAO.JobDao"%>
    <%@ page language="java" import="com.Lee.Account"%>
  	<%@ page language="java" import="java.util.ArrayList"%>
  	<%@ page import="java.util.Calendar"%>
  	<%@ page language="java" import="java.lang.Integer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String info_id = request.getParameter("info_id");
Administrator ad = (Administrator)session.getAttribute("ad");
%>

<jsp:useBean id="userinfodao" class="DAO.UserInfoDao"></jsp:useBean>
<jsp:useBean id="jobdao" class="DAO.JobDao"></jsp:useBean>

<% 

ArrayList<Account>list = userinfodao.getApplyList(info_id);
Job job = jobdao.getJob(info_id);


%>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="container" style="height: 51px">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="">PTJ后台管理</a>
                            </div>

                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                                <ul class="nav navbar-nav navbar-right">
                                    <li>
                                        <img class="img-circle">
                                    </li>
                                    <a>欢迎<%= ad.getName() %></a>
                                </ul>
                            </div>

                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%= list.size() %>


    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <div class="page-header">
            <h1>
                PTJ <small>apply list</small>
            </h1>
        </div>

        <table class="table table-striped">
            <caption>申请列表</caption>
            <thead>
            <tr>
                <th>账号</th>
                <th>姓名</th>
                <th>学校</th>
                <th>年龄</th>
                <th>电话</th>
            </tr>
            </thead>
            <tbody>
            <%for(Account p : list){ %>
            <tr>
            	
            	<jsp:useBean id="now" class="java.util.Date" scope="page"/>
            	
            	<% 
            	
            			
            	Calendar c=Calendar.getInstance();
            	int y=c.get(Calendar.YEAR);
            	int m=c.get(Calendar.MONTH) +1;
            	int d=c.get(Calendar.DATE);
            			
            		int year = Integer.parseInt(p.getBirth().split("-")[0]);
            		int month = Integer.parseInt(p.getBirth().split("-")[1]);
            		int day = Integer.parseInt(p.getBirth().split("-")[2]);
            	
            		int age;
            		
            		
            		if(m > month)
            			age = y - year;
            		else if(m == month)
            			if(d >= day)
            				age = y - year;
            			else age = y - year -1;
            		else age = y - year -1;
            	%>
              	
                <td><%= p.getUsername() %></td>
                <td><%= p.getRealname() %></td>
                <td><%= p.getSchool() %></td>
                <td><%= age %></td>
                <td><%= p.getTele() %></td>
                <td>
                    <li class="dropdown" style="list-style-type: none">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            管理<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="Ad_applydelete?info_id=<%= info_id %>&username=<%= p.getUsername() %>">删除</a></li>
                        </ul>
                    </li>


                </td>
            </tr>
			<%} %>
            </tbody>
        </table>


       
    </div>
    <div class="col-sm-3"></div>

</div>



</body>
</html>