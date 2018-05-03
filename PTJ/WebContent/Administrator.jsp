<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="com.Lee.*"%>
    <%@ page language="java" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<head>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/Administrator.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="list" class="DAO.JobDao"></jsp:useBean>
<%Administrator ad = (Administrator)session.getAttribute("ad"); 
ArrayList<Job> joblist =  list.getJoblist();
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

    <div class="row">
        <div class="col-md-2 column">
                    <ul class="nav nav-tabs nav-stacked">
                        <li class="active">
                            <a href="#Joblist" data-toggle="tab">兼职信息List</a>
                        </li>
                        <li>
                            <a href="#Accountlist" data-toggle="tab">账户List</a>
                        </li>
                        <li>
                            <a href="#publish" data-toggle="tab">发布兼职信息</a>
                        </li>


                     </ul>
        </div>
        <div class="col-md-10 column">

            <div id="myTabContent" class="tab-content">
                <div class="col-md-offset-3 tab-pane fade in active" id="Joblist" >
                    <table class="table">
                        <thead>
                        <tr>

                            <th>
                                标题
                            </th>
                            <th>
                                发布人
                            </th>
                            <th>
                                时间
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Job p : joblist){%>

                        <tr>

                            <td>
                                <%= p.getTitle() %>
                            </td>
                            <td>
                                <%= p.getPublisher() %>
                            </td>
                            <td>
                                <%= p.getDate() %>
                            </td>
                            <td>
                                <li class="dropdown" style="list-style-type: none">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                        管理<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="jobinfo_ad.jsp?info_id=<%= p.getId() %>">编辑</a></li>
                                        <li><a href="applylist.jsp?info_id=<%= p.getId() %>">申请管理</a></li>
                                        <li><a href="Ad_deleteJobInfo?info_id=<%= p.getId() %>">删除</a></li>
                                    </ul>
                                </li>


                            </td>
                        </tr>

                        <%} %>
                        </tbody>
                    </table>
                </div>
<jsp:useBean id="accountdao" class="DAO.AccountDao"></jsp:useBean>
                <div class="col-md-offset-3 tab-pane fade" id="Accountlist">
                    <table class="table">
                        <caption>PTJ账户列表</caption>
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>学校</th>
                            <th>生日</th>
                            <th>电话</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%ArrayList<Account> accountlist = accountdao.getAccountList(); %>
					<%for(Account p : accountlist){ %>
                        <tr class="active">
                            <td><%= p.getUsername() %></td>
                            <td><%= p.getRealname() %></td>
                            <td><%= p.getSchool() %></td>
                            <td><%= p.getBirth() %></td>
                            <td><%= p.getTele() %></td>
                            
                            <td>
                                <li class="dropdown" style="list-style-type: none">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                        管理<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        
                                        <li><a href="Ad_deleteAccount?username=<%= p.getUsername() %>">删除</a></li>
                                    </ul>
                                </li>


                            </td>
                            
                        </tr>
					<%} %>
                        </tbody>
                    </table>
                </div>

                <div class="col-md-offset-3 tab-pane fade" id="publish">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">标题：<input class="form-control" id="title"></h3>
                        </div>
						<jsp:useBean id="jobdao" class="DAO.JobDao"></jsp:useBean>
                        <table class="table">
                            <tr><td>ID</td><td><input id="id" value="<%= jobdao.getNextAddonId() %>" disabled></td></tr>
                            <tr><td>发布人</td><td><input id="publisher" class="form-control" ></td></tr>
                            <tr><td>时薪</td><td><input id="remuneration" class="form-control" ></td></tr>
                            <tr><td>人数</td><td><input id="peoplesum" class="form-control"></td></tr>
                        </table>

                        <div class="panel-body">
                            <textarea class="form-control" id="description"></textarea>
                        </div>
                        <button class="btn-danger btn-sm" id="publish_btn">发布</button>
                    </div>
                </div>

            </div>






        </div>
    </div>

</div>







    <script>
        $(function () { $('#myModal').modal({
            keyboard: true
        })});
    </script>

<script>
    $(function () {
        $('#myTab li:eq(1) a').tab('show');
    });
</script>
</body>
</html>