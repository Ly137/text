<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="/customizableSys/js/jquery-3.3.1.min.js"></script>
<!-- css files -->
<link href="../css/adminLogin.css" rel='stylesheet' type='text/css' media="all" />
<!-- /css files -->
<title>管理员登录页面</title>
<script>
$(document).ready(function(){
	  $(".sign-in").click(function(){
	
	var username=$("#userid").val();
	var password=$("#psw").val();
		  
	if(username=="用户账号"||password=="PASSWORD"){
		alert("请输入账号或密码");
		return;
	}
	var userType=$("#userType").val();
	$.ajax({				
		url:'../LoginSvlt',
		type:'post',
		data:{"username":username,"password":password,"userType":userType},
		dataType:'json',
		success:function(data){
			if(data.msg==1){
				window.location.href="./main.jsp";
			}else{
				alert(data.msg);
			}
		}
	}) 
});
});
			    		  		  	 
</script>
</head>
<body>
<h1>基于GitHub的实验教学系统</h1>
<div class="log">
	<div class="content1">
	
		<!--  <h2><img src="../images/user3.png" style="width:100px; height:100px;" /></h2>-->
		<form>
			<input type="text" name="userid" id="userid" value="用户账号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户账号';}">
			<input type="password" name="psw" id="psw" value="PASSWORD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWORD';}">
			<input type="hidden" value="admin" id="userType" name="userType"/>
			<div class="button-row">
				<input type="button" class="sign-in" value="登录"  >
				<input type="reset" class="reset" value="重置">
				<div class="clear"></div>
			</div>
		</form>
	</div>
	
</div>


</body>
</html>