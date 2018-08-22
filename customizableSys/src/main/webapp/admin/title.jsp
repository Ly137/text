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
<!-- Tab标签 -->
<link href="<%=basePath%>/jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="<%=basePath%>/jqueryUIcustom/js/jquery-1.8.3.js"></script>
<script src="<%=basePath%>/jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
<title>设置站名及logo</title>
<style>
	.box1{
		width:80%;
		padding:3% 10%;
		border-top:10px solid #eee;	 
	
		
	}	
	.btn{
		 background-color: #6274f8;
	    border: none;
	    color: white;
	    padding: 5px 10px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    border-radius: 8px;
	   
	}
</style>

<script>
$(function() {
    $( "#tabs" ).tabs();
  });
$(function() {
    $( ".showResult" ).click(function(){    	
    	window.open("http://localhost:8080/customizableSys/index.jsp");
    });
  });
</script>
</head>
<body>
	<div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">网站页面风格管理</a></li>	
	    <li><a href="#tabs-2" class="showResult">查看效果</a></li>			    
	  </ul>
	  <div id="tabs-1">
	  	<div class="box1">
			<!-- 上传logo -->
			<form class="fileForm"  enctype="multipart/form-data" >
				<table width="100%">
		
					<tr>	
						<td  width="5%">logo:</td>
						<td width="40%"><span style="color:#464748;font-size:12px;">(<span style="color:red;">tips</span>：png格式)</span>					
							    <input type="file" name="uploadFile" />	
							    <input type="button" value="更改"  class="upload btn"/>			    					    				    
						</td>							
					</tr>
				</table>
			</form>	
			<!-- 上传背景图片 -->
			<form class="fileFormbg"  enctype="multipart/form-data" >
				<table width="100%">
					<tr>	
						<td  width="5%">背景图片:</td>
						<td width="40%"><span style="color:#464748;font-size:12px;">(<span style="color:red;">tips</span>：jpg格式)</span>									
							    <input type="file" name="uploadFile" />
							    <input type="button" value="更改"  class="uploadbg btn" />
							    <input type="button" value="移除背景图片"  class="removebgimg btn" />							    
						</td>			
					</tr>
				</table>
			</form>	
		</div>
		<div class="box1">
			<!-- 上传站名、建设单位、地址、背景颜色，文字颜色等信息 -->
			<form >
				<table width="100%" >
					<tr>
						<td width="20%">站名:</td>
						<td width="70%" >				
								<input type="text" name="websiteTitle" id="websiteTitle" size="50" value="${other.title }">									
						</td>
					</tr>
				
					<tr>
						<td width="20%">建设单位:</td>
						<td width="70%" >				
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
				<table  width="100%" ng-app="myApp" ng-controller="myCtrl" >
					<tr>
						<td width="20%">背景颜色:</td>
						<td width="70%">
									
								<input type="text" name="bgColorCode" id="bgColorCode"  value={{Tcolor}}>								
								<input  type="color"   ng-model="Tcolor">									
						</td>
					</tr>		
					<tr >
						<td width="20%">文字颜色:</td>
						<td width="70%">			
								<input type="text" name="wordColorCode" id="wordColorCode"  value={{Fcolor}}>	
								<input  type="color"  ng-model="Fcolor">									
						</td>
						
					</tr>
					
				</table>
				<p style="text-align:center;"><button onclick="submit2()"  class="btn">提交更改</button>				    					    				    
				</p>
			</form>
			
		</div>
	  </div>
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
//移除背景图片
$(function(){
	$(".removebgimg").click(function(){
		
		$.ajax({ 
		url:'UpdSvlt',
		type:'post',
		dataType:'json',
		data:{"tbname":"indexshowimg"},
		success:function(data){			
			alert(data.msg);
		}	 
		}); 
	})
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
	//alert(websiteTitle+";"+organization+";"+address+";"+bgColorCode+";"+wordColorCode+";")
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