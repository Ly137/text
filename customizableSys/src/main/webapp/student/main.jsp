<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

 <%request.setCharacterEncoding("UTf-8"); %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生主页</title>
<!--  
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->

<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.min.js.下载"></script>
 <style> 
  .banner{
  margin-bottom:10px;
  }
  .banner, .footer {
      background-color: ${other.bgColor};
      background-image:${other.imgPath};
      color: ${other.wordColor};
    }

    .banner, .footer{
      padding-left: 10%;
      padding-right: 10%;
    }

    .banner-title {
      margin-left: 90px;
      font-size: 24px;
      padding-bottom: 15px;
    }

    .logo {
      padding-top: 2%;
    }
	/*左侧菜单*/
	.userInfo{
	width:100%;
	  font-size:1em;
	  padding:10px;
	  	  
	 display: inline-block;	 
	background-color:#d9e0fb;		 
	box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2), 0 1px 1px 0 rgba(0,0,0,0.19);
	filter:alpha(opacity=100 finishopacity=50 style=1 startx=0,starty=0,finishx=0,finishy=150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=white,endcolorstr=#c6d0fa,gradientType=0); 
	-ms-filter:alpha(opacity=100 finishopacity=50 style=1 startx=0,starty=0,finishx=0,finishy=150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=white,endcolorstr=#c6d0fa,gradientType=0); 
	background:#c6d0fa;  
	background:-moz-linear-gradient(top, white, #c6d0fa); 
	background:-webkit-gradient(linear, 0 0, 0 bottom, from(#ffffff), to(#c6d0fa));  
	 
	}
	
	.menu a{
		background-color:#fadfdd1f; 
		color:#0e2245;
		text-decoration:none;
		width:80%;
		padding: 5px 10px;		
		margin: 4px 2px;
		display: inline-block;	 
		background-color:#d9e0fb;		 
		box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2), 0 1px 1px 0 rgba(0,0,0,0.19);
		filter:alpha(opacity=100 finishopacity=50 style=1 startx=0,starty=0,finishx=0,finishy=150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=white,endcolorstr=#d9e0fb,gradientType=0); 
		-ms-filter:alpha(opacity=100 finishopacity=50 style=1 startx=0,starty=0,finishx=0,finishy=150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=white,endcolorstr=#d9e0fb,gradientType=0); 
		background:#d9e0fb;  
		background:-moz-linear-gradient(top, white, #d9e0fb); 
		background:-webkit-gradient(linear, 0 0, 0 bottom, from(#ffffff), to(#d9e0fb));  	    
	}
	.menu a:hover{
		background-color:white; 
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 4px 12px 0 rgba(0,0,0,0.19);
		-webkit-transition-duration: 0.4s; /* Safari */
	    transition-duration: 0.4s;
	}
	.menu a img{
		margin-right:10px;
	}	
	
	/*页脚*/
    .footer {
      padding-top: 20px;
      padding-bottom: 20px;
      width: 100%;
      font-size:14px;
    }

    .footer .address {
      padding-left: 40px;
    }

</style>
</head>
<body>
<!-- 顶部标题栏 -->
<div class="banner" id="banner" >	
    <img class="logo" src="/allProjUpload/customizableSys/LogoImage/logo.png" alt="logo">    
    <div class="banner-title">${other.title }
    	
    </div> 
           
</div> 
<!-- 中间内容部分 -->
 <div class="row"  style="margin-left:0px;margin-right:0px;">
 	<!-- 左侧菜单栏 --> 
    <div class="col-sm-2 col-xs-12" style="min-height:550px;border-right:2px #eee solid; font-size:14px;">
    <!-- <div class="userInfo">
    	 	<img alt="Avatar" src="../images/my.png" style="width:10px;height:10px;border-radius:50% 50%;border:1px solid #566;padding:5px;margin-right:15px;">
    	 	<span>您好！${userinfo.sname }</span>
  			<p align="center"><a href="../loginOut.jsp">[ 退出 ]</a></p>
    	 </div>-->
    	<div class="userInfo">
   	 	<img alt="Avatar" src="../images/my.png" style="width:50px;height:50px;border-radius:50% 50%;padding:5px;margin-right:5px;">
   	 	<span>您好！${userinfo.sname }</span>
 		<a style="margin-left:5px;color:blue" href="../loginOut.jsp">[退出]</a>
   		</div>
		<div class="menu">
		   <a href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse"  target='SubMenu'> 
		      <img src="../images/link.png" width=15 height=15  border=1>我的课程
		   </a><br>
		   <a href="<%=basePath %>InitSvlt?flgs=1&tbname=stutaskinfo"  target='SubMenu'> 
		      <img src="../images/link.png" width=15 height=15  border=1>实验任务
		   </a><br>
		   <a href="<%=basePath %>InitSvlt?flgs=1&tbname=mstutask"  target='SubMenu'> 
		      <img src="../images/link.png" width=15 height=15  border=1>实验记录
		   </a><br>
		   <a href="<%=basePath %>InitSvlt?flgs=1&tbname=Sscore"  target='SubMenu'> 
		      <img src="../images/link.png" width=15 height=15  border=1>查看成绩
		   </a><br>
		   <a href="./studentInfo.jsp"  target='SubMenu'> 
		      <img src="../images/link.png" width=15 height=15  border=1>个人信息
		   </a><br>		
    	</div>
	</div>
	<!-- 右侧内容显示 --> 
	<div class="col-sm-10 col-xs-12" style="font-size:14px; min-height:550px;min-width:500px;">
	 <iframe id="SubMenu" src="/customizableSys/teacher/bg.jsp" name="SubMenu" frameborder="0" style="vertical-align: middle; 
             text-align: center; width: 100%; background-color:transparent;min-height:550px;" scrolling="auto" >
     </iframe>
    </div>
</div>
    
<!-- 底部信息 -->
<div class="footer">
    <span class="school">建设单位：${other.footer_name}</span>
    <span class="address">${other.footer_Addr }</span>
</div>
</body>
</html>