<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page language="java" import="com.Lee.Account"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css
">
<script src="js/jquery-3.3.1.min.js"></script>
 <script src="js/Welcome_auto_jump.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    Account account = (Account)session.getAttribute("account");
%>

<div style="height: 300px"></div>

<div class="container">



    <div class="col-sm-4"></div>
    <div class="col-sm-4">
        <h2>
            Welcome to "<%= account.getUsername()%>" Login System!
        </h2>
        <a id= "auto_jump" href="mainPage.jsp">页面自动3秒后自动跳转，若没反应请点击</a>
    </div>
    <div class="col-sm-4"></div>

</div>


</body>
</html>