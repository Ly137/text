<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<body>
<script>
window.onload=function(){
	$.ajax({				
		url:'HomePage',
		type:'post',				
		success:function(data){
			window.location.href="http://localhost:8080/mivlab2/indexShow.jsp";
		}
	}) 

 }
</script> 

</body>
</html>