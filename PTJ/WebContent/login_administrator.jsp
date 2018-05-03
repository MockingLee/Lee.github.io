<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>

<div style="height: 230px;"></div>

<div class="container">
    <div class="page-header">PTJ管理系统</div>
    <div class="col-sm-3"></div>
    <form action="login_administrator" method="post" role="form" class="form-group col-xm-offset-2" id="form">
        <div class="form-group">
            <p class="lead">Username</p>
            <input class="form-control" type="text" name="username" id="username" placeholder="username">
        </div>

        <div class="form-group">
            <p class="lead">Password</p>
            <input class="form-control" type="password" name="pwd" id="password" placeholder="password">
        </div>

        <div class="form-group">
            <div class= "col-xm-offset-2">
                <input type="submit" class="btn-primary" id="submit_btn" value="登陆">
            </div>
        </div>


    </form>
    <div class="col-sm-3"></div>
</div>

</body>
</html>