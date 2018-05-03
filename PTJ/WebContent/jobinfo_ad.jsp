<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="com.Lee.Job"%>
    <%@ page language="java" import="com.Lee.Administrator"%>
    <%@ page language="java" import="DAO.JobDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jobinfo_ad.js"></script>
<title>Insert title here</title>
</head>
<body>

<%	Administrator ad = (Administrator)session.getAttribute("ad");
	String id = request.getParameter("info_id");
	JobDao jobdao = new JobDao();
	Job job = jobdao.getJob(id);
%>

<div class="container">
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="container" style="height: 51px">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="">PTJ后台管理系统</a>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <img class="img-circle">
                                </li>
                                <label class="text-center">欢迎<%= ad.getName() %></label>
                            </ul>
                        </div>

                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="col-sm-3"></div>
    <div class="col-sm-6">

        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title"><%= job.getTitle() %></h3>
            </div>

            <table class="table">
                <tr><td>ID</td><td><input id="id" value="<%= job.getId() %>" disabled></td></tr>
                <tr><td>发布人</td><td><input id="publisher" class="form-control" value="<%= job.getPublisher() %>"></td></tr>
                <tr><td>时薪</td><td><input id="remuneration" class="form-control" value="<%= job.getRemuneration() %>"></td></tr>
                <tr><td>人数</td><td><input id="peoplesum" class="form-control" value="<%= job.getNum_of_people() %>"></td></tr>
            </table>

            <div class="panel-body">
                <textarea class="form-control" id="description"><%= job.getDescription() %></textarea>
            </div>
        </div>

        <button class="btn-danger btn-sm" id="apply">保存</button>

    </div>
    <div class="col-sm-3"></div>


</div>


</body>
</html>