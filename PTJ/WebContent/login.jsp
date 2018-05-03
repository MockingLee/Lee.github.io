<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/login.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Insert title here</title>
</head>
<body>

<nav class="nav navbar-default" role="navigation">

    <h1 class="bg-primary">Part time job for College Students</h1>

</nav>

<div class="container clearfix">
    <div style="height: 130px"></div>
    <div class="col-sm-3"></div>
    <div class="col-sm-6">

            <form action="login" method="post" role="form" class="form-group" id="form">
                <div class="form-group">
                    <p class="lead">Username</p>
                    <input class="form-control" type="text" name="username" id="username" placeholder="username">
                </div>

            <div class="form-group">
                <p class="lead">Password</p>
                <input class="form-control" type="password" name="pwd" id="password" placeholder="password">
                </div>
                <div class="form-group">
                    <div class="col-xm-offset-2 checkbox">
                        <label>
                            <input type="checkbox">记住密码
                    </label>
                </div>
                </div>
                <div class="form-group">
                <div class= "col-xm-offset-2">
                    <input type="button" class="btn-primary" id="submit_btn" value="登陆">
                </div>
            </div>
                <div class="form-group">
                    <p>没有账号?<a href="sign_in.jsp">注册</a></p>


    </div>
        </form>

    </div>
    <div class="col-sm-3"></div>



</div>







</body>
</html>