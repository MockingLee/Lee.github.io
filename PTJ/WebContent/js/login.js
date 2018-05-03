/**
 * 
 */

$(document).ready(function () {
    $("#submit_btn").on("click",function () {
        if($("#username").val() == "" || $("#password").val()== ""){
            alert("账号密码不能为空");
        }else {
            $("#form").submit();
        }
    });

});

