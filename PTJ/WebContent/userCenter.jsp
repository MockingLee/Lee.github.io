<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="com.Lee.Account"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap-datetimepicker.js"></script>
    <script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="css/bootstrap-datetimepicker.css" type="text/css" rel="stylesheet">
    <script src="js/userCenter.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Account account = (Account)session.getAttribute("account");
%>


<div class="page-header">
    <div class="container">
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
                                        <a href="myapply">我的申请</a>
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
</div>



<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">

            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#home" data-toggle="tab">
                        个人信息
                    </a>
                </li>
                <li><a href="#accountsetting" data-toggle="tab">账户管理</a></li>

            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">

                        <div class="form-group row"style="margin-bottom: 5px">
                            <label class="col-sm-3 control-label">真实姓名</label>
                            <div class="col-sm-8">
                                <input class="form-control col-sm-6" type="text" name="realname" value="<%=account.getRealname()%>" id="realname">
                            </div>

                        </div>
                        <div class="form-group row" style="margin-bottom: 5px">
                            <label class="col-sm-3 control-label" >出生</label>
                            <div class="col-sm-8 input-append date form_datetime" >
                            <input class="form-control col-sm-6" type="text" name="birth" id="datetimepicker" readonly value="<%=account.getBirth()%>">

                        </div>
                        </div>
                        <div class="form-group row"style="margin-bottom: 5px">
                            <label class="col-sm-3 control-label">学校</label>
                            <div class="col-sm-8">
                                <input class="form-control col-sm-6" type="text" name="school" value="<%=account.getSchool()%>" id="school">
                            </div>
                        </div>
                        <div class="form-group row"style="margin-bottom: 5px">
                            <label class="col-sm-3 control-label">手机号</label>
                            <div class="col-sm-8">
                                <input class="form-control col-sm-6" type="text" name="tele" value="<%=account.getTele()%>" id="tele">
                            </div>
                        </div>
                        <div class="form-group btn-group-lg">
                            <button id="saveInfobtn">保存</button>
                        </div>

                </div>
                <div class="tab-pane fade" id="accountsetting">


                    <div class="form-group row"style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label">修改密码</label>
                        <div class="col-sm-8">
                            <input class="form-control col-sm-6" type="text" name="realname" value="" id="changepass">
                            <button class="btn-sm" id="password_change">提交</button>
                        </div>


                    </div>


                </div>

            </div>

        </div>
        <div class="col-md-2"></div>
    </div>


<script type="text/javascript">
            $('#datetimepicker').datetimepicker({
                format: "yyyy-mm-dd",
                language:  'zh-CN',
                weekStart: 1,
                todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
            
            
            $(document).ready(function () {
            	   $("#password_change").bind("click",function () {
            	       $.post("ChangePassword",{newPassword:$("#changepass").val()},function (data) {
            	           if (data == "ok"){
            	               alert("修改成功")
            	               $.get("logout")
            	               window.location.href = "login.jsp"
            	           }

            	       })
            	   });
            	});

            $("#saveInfobtn").bind("click",function () {
                $.post("UserInfo",{
                    realname:$("#realname").val(),
                    birth:$("#datetimepicker").val(),
                    school:$("#school").val(),
                    tele:$("#tele").val()
                },function () {
                    window.location.href = "userCenter.jsp"
                    }
                )
            });
            
</script>
</body>
</html>