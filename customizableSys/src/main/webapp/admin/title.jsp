<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>lib/jquery/jquery-3.3.1.min.js"></script>
<script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
<style>
	.box1{
		width:80%;
		padding:3% 10%;
		background-color:#edf0fd;		 
		box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2), 0 1px 1px 0 rgba(0,0,0,0.19);
		
	}	
</style>
<title>设置站名及logo</title>
</head>
<body>


<div class="box1">
	<!-- 上传logo -->
	<form class="fileForm"  enctype="multipart/form-data" >
		<table width="100%">

			<tr>	
				<td  width="10%">logo:</td>
				<td width="40%"><span style="color:#464748;font-size:12px;">(<span style="color:red;">tips</span>：图片为png格式，大小XXX)</span>					
					    <input type="file" name="uploadFile" />	
					    <input type="button" value="更改"  class="upload"/>			    					    				    
				</td>							
			</tr>
		</table>
	</form>	
	<!-- 上传背景图片 -->
	<form class="fileFormbg"  enctype="multipart/form-data" >
		<table width="100%">
			<tr>	
				<td  width="10%">背景图片:</td>
				<td width="40%"><span style="color:#464748;font-size:12px;">(<span style="color:red;">tips</span>：图片为jpg格式，大小XXX)</span>									
					    <input type="file" name="uploadFile" />
					    <input type="button" value="更改"  class="uploadbg"/>						    
				</td>			
			</tr>
		</table>
	</form>	
</div>
<div class="box1">
	<!-- 上传站名、建设单位、地址、背景颜色，文字颜色等信息 -->
	<form >
		<table >
			<tr>
				<td width="20%">站名:</td>
				<td width="70%">				
						<input type="text" name="websiteTitle" id="websiteTitle" size="50" value="${other.title }">									
				</td>
			</tr>
		
			<tr>
				<td width="20%">建设单位:</td>
				<td width="70%">				
						<input type="text" name="organization" id="organization" size="50" value="${other.footer_name }">									
				</td>
			</tr>
			<tr>
				<td width="20%">单位地址:</td>
				<td width="70%">				
						<input type="text" name="address" id="address" size="50" value="${other.footer_Addr }">									
				</td>
			</tr>
		</table>
		<table  ng-app="myApp" ng-controller="myCtrl" >
			<tr>
				<td width="20%">背景颜色:</td>
				<td width="50%">
							
						<input type="text" name="bgColorCode" id="bgColorCode"  value={{Tcolor}}>								
						<input  type="color"   ng-model="Tcolor">									
				</td>
			</tr>		
			<tr >
				<td width="20%">文字颜色:</td>
				<td width="50%">			
						<input type="text" name="wordColorCode" id="wordColorCode"  value={{Fcolor}}>	
						<input  type="color"  ng-model="Fcolor">									
				</td>
				<td width="30%" rowspan="4"><button onclick="submit2()">更改</button>
				</td>
			</tr>
			
		</table>
		<p style="text-align:center;"><a href="<%=basePath%>index.jsp"   target='_target'
		style="text-decoration:none;display:inline-block;padding:10px 20px;
		background:#ced8fe;color:#004000;box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2), 0 1px 1px 0 rgba(0,0,0,0.19);">查看效果</a>				    					    				    
		</p>
	</form>
	
</div>

<script>
//上传logo
$(function () { 
	 $(".upload").click(function () { 
	  var formData = new FormData($('.fileForm')[0]); 
	 // alert(formData);
  $.ajax({ 
	  type: 'post', 
	  url: "LogoUpload",
	  dataType : 'json',
	  data: formData, 
	  cache: false, 
	  processData: false, 
	  contentType: false, 	 
	  success:function(data){		  		  
		  alert(data.msg);	
		  window.location.href="InitSvlt?tbname=indexshow";
		}			
	  })	 
	 }); 
});
//上传背景图片
$(function () { 
	 $(".uploadbg").click(function () { 
	  var formData = new FormData($('.fileFormbg')[0]); 
	 // alert(formData);
  $.ajax({ 
	  type: 'post', 
	  url: "BgImgUpload",
	  dataType : 'json',
	  data: formData, 
	  cache: false, 
	  processData: false, 
	  contentType: false, 	 
	  success:function(data){		  		  
		  alert(data.msg);	
		  window.location.href="InitSvlt?tbname=indexshow";
		}			
	  })	 
	 }); 
});

//绑定颜色
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.Tcolor = "${other.bgColor}";
    $scope.Fcolor = "${other.wordColor}";
});

//提交文字与颜色修改

function submit2(){
	var websiteTitle=$("#websiteTitle").val();
	var organization=$("#organization").val();
	var address=$("#address").val();
	var bgColorCode=$("#bgColorCode").val();
	var wordColorCode=$("#wordColorCode").val();
	alert(websiteTitle+";"+organization+";"+address+";"+bgColorCode+";"+wordColorCode+";")
	$.ajax({
		url:'UpdSvlt',
		type:'post',
		dataType:'json',
		data:{"tbname":"indexshow","websiteTitle":websiteTitle,"organization":organization,"address":address,"bgColorCode":bgColorCode,"wordColorCode":wordColorCode},
		success:function(data){
			alert(data.msg);
			window.location.href="InitSvlt?tbname=indexshow";			
		}
	});
}

</script>	
</body>
</html>