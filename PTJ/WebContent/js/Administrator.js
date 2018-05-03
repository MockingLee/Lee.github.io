/**
 * 
 */

$(document).ready(function () {


   $("#publish_btn").on("click",function () {
       $.post("PublishJob",{
           info_id:$("#id").val(),
           publisher:$("#publisher").val(),
           title:$("#title").val(),
           remuneration:$("#remuneration").val(),
           peoplesum:$("#peoplesum").val(),
           description:$("#description").val()
       },function (data) {
           if(data = "ok"){
               alert("发布成功");
               window.location.href = "Administrator.jsp";
           }

       });
   }) ;
});