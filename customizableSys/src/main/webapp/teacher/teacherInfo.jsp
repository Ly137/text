<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link href="../jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="../jqueryUIcustom/js/jquery-1.8.3.js"></script>
<script src="../jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
<title>教师个人信息</title>
 <script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>


<style>
	p{
		text-align:center;
	}
/*表单*/
	.form{
		width:85%;
		margin-left:auto;
		margin-right:auto;
		padding:30px 50px;
		background:#f3f4fc;
		border-radius:25px;
		box-shadow: 5px 5px 2px #d9dbdc;
		
	}
</style>
</head>
<body>
	<div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">基本信息</a></li>
	    <li><a href="#tabs-2">GitHub信息</a></li>
	    <li><a href="#tabs-3">修改密码</a></li>
	  </ul>
	  <div id="tabs-1">
	   	<form >	
			<input type='hidden' name='num' id="num" value="${userinfo.id}" >
			<input type='hidden' name='pwd' id="pwd" value="${userinfo.tPwd}" >
		  <p>  教&nbsp;&nbsp;工&nbsp;&nbsp;号：<input type='text' name='no' id="no" value="${userinfo.tNo}" disabled="disabled" > </p>
		  <p>  姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type='text' name='name' id="name" value="${userinfo.tName}"  disabled="disabled"> </p>
		  <p>  性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type='text' name='sex' id="sex"  value="${userinfo.sex }" disabled="disabled"> </p>
		  <p>  电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input type='text' name='tphone' id="tphone" value="${userinfo.tPhone }" > </p>	  	 
		 
		  <p style="text-align:center;"><input  type='button' value='更新' onclick="Submit()">
		  
		  </p>
		    
		</form>
	  </div>
	  <div id="tabs-2">
	   	  <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   	  GitHub用户名：<input size="60" type='text' name='gitUsername' id="gitUsername" value="${userinfo.gitUsername}" > </p>
		  <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  	TOKEN：<input size="60" type='text' name='TOKEN' id="TOKEN" value="${userinfo.TOKEN}"  > </p>
		  <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  	CLIENT_ID：<input size="60" type='text' name='CLIENT_ID' id="CLIENT_ID"  value="${userinfo.CLIENT_ID }" > </p>
		  <p>  CLIENT_SECRET：<input size="60" type='text' name='CLIENT_SECRET' id="CLIENT_SECRET" value="${userinfo.CLIENT_SECRET }" > </p>	  	 
	  	  <p style="text-align:center;"><input  type='button' value='更新' onclick="SubmitGit()">
	  </div>
	  <div id="tabs-3">
	    <form  class="form2">
			<p>  原始密码：<input type='password' name='oldPwd' id="oldPwd" onblur="ckOldPwd(this)"> </p>	  
		    <p>  新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type='password' name='newPwd'  id="newPwd"  >  </p>	 
		    <p>  确认密码：<input type='password' name='ckNewPwd' id="ckNewPwd"  > </p>	
		    <p style="text-align:center;"><input type='button' value='更新' onclick="SubmitPwd()"></p>
		</form>
	  </div>
</div>
	
	<script type="text/javascript">
	//检查是否知道原始密码
		function ckOldPwd(e){
			var ckPwd=$("#pwd").val();
			var pwd=$("#oldPwd").val();
			if(pwd!=ckPwd){
				alert("与原密码不一致");
				return ;
			}			
		};
		
	function Submit(){
		
		var num=$("#num").val();
		var tphone=$("#tphone").val();
		if( tphone==""){
			alert("请填写电话号码");
			return ;
		}		
		$.ajax({
			url:'../UpdSvlt',
			type:'post',
			dataType:'json',
			data:{"tbname":"teaInfo","id":num,"tphone":tphone,"flag":"tphone"},
			success:function(data){	
				if(data.msg=="修改成功"){
					alert("修改成功");
					
					//window.location.href="./teacherInfo.jsp";					 
				}else{
					alert("请重新提交");
				}
				
			}
		});
		
	};
	//修改密码
	function showChangePwd(){
		$(".form2").css("display","block");
	}
	function SubmitPwd(){
		
		var num=$("#num").val();
		var name=$("#name").val();		
		var pwd=$("#pwd").val();	//初始密码对照值
		var oldpwd=$("#oldPwd").val();
		var newpwd=$("#newPwd").val();
		var ckNewPwd=$("#ckNewPwd").val();		
		if(name=="" || oldpwd=="" || newpwd=="" || ckNewPwd=="" ){
			alert("请将信息填写完整");
			return ;
		}
		if(pwd==newpwd){
			alert("新密码不能与原密码相同");
			return ;			
		}
		if(newpwd!=ckNewPwd){
			alert("新密码与确认密码不一致");
			return;
		}
		$.ajax({
			url:'../UpdSvlt',
			type:'post',
			dataType:'json',
			data:{"tbname":"teaInfo","id":num,"name":name,"newpwd":newpwd,"flag":"pwd"},
			success:function(data){	
				if(data.msg=="修改成功"){
					alert("修改成功,请重新登录");
					//window.location.href="./login.jsp";
					window.parent.frames.location.href="../index.jsp" 
				}else{
					alert("请重新提交");
				}
				
			}
		});
		
	};
	
	//更改教师GitHub账号信息
	function SubmitGit(){
		var num=$("#num").val();
		var gitUsername=$("#gitUsername").val();		
		var TOKEN=$("#TOKEN").val();
		var CLIENT_ID=$("#CLIENT_ID").val();
		var CLIENT_SECRET=$("#CLIENT_SECRET").val();
				
		if(gitUsername=="" || TOKEN=="" || CLIENT_ID=="" || CLIENT_SECRET=="" ){
			alert("信息不完整，无法使用Git生成实验报告");
			
		}
		//alert(gitUsername+TOKEN+CLIENT_ID+CLIENT_SECRET)
		$.ajax({
			url:'../UpdSvlt',
			type:'post',
			dataType:'json',
			data:{"tbname":"teaInfo","id":num,"gitUsername":gitUsername,"TOKEN":TOKEN,"CLIENT_ID":CLIENT_ID,"CLIENT_SECRET":CLIENT_SECRET,"flag":"git"},
			success:function(data){	
				if(data.msg=="修改成功"){
					alert("修改成功");
					
				}else{
					alert("请重新提交");
				}
				
			}
		});
		
	}
	
	</script>
</body>
</html>