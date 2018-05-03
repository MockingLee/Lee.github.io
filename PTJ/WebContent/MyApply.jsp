<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page language="java" import="com.Lee.*"%>
    <%@ page language="java" import="java.util.ArrayList"%>
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
Account account = (Account)session.getAttribute("account");
%>



<div class="container" style="height: 51px">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="mainPage.jsp">PTJ</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <img class="img-circle">
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=account.getUsername()%><strong class="caret"></strong></a>
                            <ul class="dropdown-menu ">
                                <li>
                                    <a href="userCenter.jsp">个人中心</a>
                                </li>
                                <li>
                                    <a href="#">我的简历</a>
                                </li>
                                <li>
                                    <a href="myapply">我的报名</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="logout" id="logout_btn">退出</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </nav>
        </div>
    </div>
</div>

<%ArrayList<Job> list = (ArrayList<Job>)session.getAttribute("myapply_joblist");  %>

<div class="container">

    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">申请的职位</h3>
            </div>
            <div class="panel-body">
            <%for(Job p: list) {%>
            	 <div>
                    <a class="text-center" href="JobDetails?info_id=<%=p.getId() %>"><%= p.getTitle() %></a>
                </div>
           <%}%>
               
            </div>
        </div>



    </div>
    <div class="col-sm-3"></div>


</div>


</body>
</html>