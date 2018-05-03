 $(document).ready(function () {

    var namecheck = false;


        $("#check").blur(function () {
            $.post("sign_in",{username:$("#check").val()},function (data) {
                if ($("#check").val()!="" && data == "ok"){
                    $("#check").css("border" , "2px solid green");
                   $("#check_name").text("Available");
                    namecheck = true;
                }
                if($("#check").val() == "" ||data == "no"){
                    $("#check").css("border" , "2px solid red");
                    $("#check_name").text("Unavailable");
                    namecheck = false;
                }
            })
        });


        $("#password2").on("oninput",function () {
         if($("#password2").val() == $("#password1").val()){
             $("#password1").css("border" , "2px solid green");
             $("#password2").css("border" , "2px solid green");
             $("#check_pwd2").text("ok");
         }
     });







            $("#password2").blur(function () {
                    if($("#password2").val() == $("#password1").val() && $("#password1").val() != "" && $("#password2").val()!=""){

                            $("#password1").css("border" , "2px solid green");
                            $("#password2").css("border" , "2px solid green");
                            $("#check_pwd2").text("ok");

                    }

                    if($("#password2").val() != $("#password1").val() ||  ($("#password1").val() == ""  && $("#password2").val()=="" )  ){
                        $("#password1").css("border" , "2px solid red");
                        $("#password2").css("border" , "2px solid red");
                        $("#check_pwd2").text("inconsistent");
                    }




     });

        $("#sub").on("click",function () {
            if($("#check").val()=="" || $("#password1").val() =="" || $("#password2").val()=="" || $("#password1").val() != $("#password2").val() || !namecheck){

            }else
            {
                $("#sub_signin").submit();
            }

        });





    });