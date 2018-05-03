/**
 * 
 */

$(document).ready(function () {
   $("#apply").on("click", function () {
       $.post("Ad_modify",{

           publisher:$("#publisher").val(),
           remuneration:$("#remuneration").val(),
           peoplesum:$("#peoplesum").val(),
           id:$("#id").val(),
           description:$("#description").val()



       },function (data) {
           if(data == "ok"){
               alert("保存成功");
           }
       })
   })
});