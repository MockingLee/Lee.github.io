/**
 * 
 */
$(document).ready(function () {

    $("#apply").bind("click" , function () {
        
        $.get("apply",function (data) {
            if(data == "ok"){
                alert("申请成功")
            }


            if(data == "no")
                alert("你已报名过")
        })
    });

})
