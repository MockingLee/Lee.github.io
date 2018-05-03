$(document).ready(function () {
	$("#chaxun").on("click",function () {
		   var m =document.getElementById("search").value;
		   var n= m.toString();
		   window.location.href="mainPage.jsp?paixu=no&xinxi="+n;

	        });


})

