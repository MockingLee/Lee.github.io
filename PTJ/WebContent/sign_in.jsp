<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/sign_in.js"></script> 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>






    <div class="container">
        <div class="col-sm-3"></div>
        <div class="col-sm-6 ">

            <form action="sign_in" method="get" role="form"  id="sub_signin">
                    <p class="lead">Username</p>
                    <div class="input-group">

                    <input class="form-control col-sm-3  " type="text" name="username" id="check" placeholder="username"><label class="input-group-addon"><span class="" id="check_name"></span></label>

            </div>
                <p class="lead">Password</p>
                <div class="input-group">


                    <input class="form-control col-sm-5" type="password" name="pwd" id="password1" placeholder="password"><label class="input-group-addon"><span class="" id="check_pwd1"></span></label>
                </div>
                <p class="lead">Confirm Pwd</p>
                <div class="input-group">



                       <input class="form-control col-sm-5" type="password" name="pwd" id="password2" placeholder="Confirm"><label class="input-group-addon"><span class="" id="check_pwd2"></span></label>
                </div>

                <br>

                <div class="form-group col-sm-12">
                <div class="btn">
                    <input type="button" class="btn-primary disabled" id="sub" value="提交">
                </div>
            </div>


            </form>

        </div>
        <div class="col-sm-3"></div>




    </div>







</body>
</html>