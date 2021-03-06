<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>实验任务</title>
		
		<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
		
		
			
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js.下载"></script>
		<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js.下载"></script>
		<link href="<%=basePath %>jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
		<!-- 翻页-->
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<!-- 头部底部 -->
		<link rel="stylesheet" href="<%=basePath%>css/titleFooter.css" />
<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
     /* background-image:${other.imgPath};   */
      color: ${other.wordColor};     
    }
/*实验任务进度对话框*/
	.dialog{
		display:none;
	}
	.dialog p{
		text-align:center;
	}
	.dialog p span{
		color:darkred;
	}
	.dialog p a{
		 background-color: #6274f8;
	    border: none;
	    color: white;
	    padding: 5px 15px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 6px 0 rgba(0,0,0,0.19)
	}
	.hiddenli{
  display:none !important;
  
  }
  @media screen and (max-width: 640px) {
   .hiddenli{
  display:block !important;
  
  }
</style>
<script type="text/javascript">
window.onload=function(){	
	
	var TaskTipSize=${TaskTipSize};
	if(TaskTipSize != "0"){
		 $( ".dialog" ).dialog();
	}
	
 };
 function closeDlg(){
	 $( ".dialog" ).dialog("close");
 }
$(document).ready(function(){
	var date=new Date();	//现在的日期
	var time=date.toLocaleDateString();
	var deadlines = new Array(); //或者写成：var btns= [];

	$('.deadline').each(function(key,value){
		deadlines[key] = $(this).text();			    
	});  		  		  
	  for(var i=0;i<deadlines.length;i++){
		 
		  var deadline=deadlines[i];
		  deadline=deadline.replace("-","/");
		  deadline=deadline.replace("-","/");
		 var date2=new Date(deadline);
		  if(date2>date){	
			  $("body").find(".deadline").eq(i).css("color","#FF0000");
		  };
	  }
	  
});

//查询
function cktj(){
	var sqls="select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id ";
	var termsid=$("#ckterm").val();
	var courseid=$("#ckcourse").val();
	if(termsid!="0"){
		sqls+=" and terms.id="+termsid;
	}
	if(courseid!="0"){
		sqls+=" and course.id="+courseid;
	}
	sqls+=" and classinfo.id in (select classinfo_id from students where id="+${userid}+") group by id";
	$.ajax({
		url:'<%=basePath%>CkSvlt',
		type:'post',
		data:{"sql":sqls},
		dataType:'json',
		success:function(data){
			if(data.msg==1){
				window.location.href="<%=basePath%>InitSvlt?tbname=stutaskinfo";
			}else{
				alert(data.msg);
			}
		}
	});
}
</script>
</head>
<body>	
	
	<header class="am-topbar am-topbar-fixed-top">	
			<!-- 顶部标题栏 -->
			<div class="banner" id="banner" >				        
		    	<div class="banner-title">${other.title }</div>        
			</div>	
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">实验任务</h4></li>
				</ul>
				
				
			</div>
		</header>
		<!-- end page -->
		
		
		<div class="admin">
			<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="<%=basePath%>assets/img/avatar-6.jpg" alt="user-img" title="${userinfo.sname } " class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5>${userinfo.sname } </h5>
	                        <ul class="list-inline">
	                        	<li>
	                                <a href="<%=basePath %>teacher/help.html" target="_blank" class="text-custom">
	                                    <i class="fa fa-question-circle" aria-hidden="true"> 帮助</i>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="<%=basePath %>InitSvlt?flgs=1&tbname=studentInfo" class="text-custom">
	                                    <i class="fa fa-cog" aria-hidden="true"> 设置</i>
	                                </a>
	                            </li>
								<li>
	                                <a href="<%=basePath %>loginOut.jsp" class="text-custom">
	                                    <i class="fa fa-sign-out" aria-hidden="true"> 退出</i>
	                                </a>
	                            </li>
	
	                            
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    
						    <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse" class="am-cf"> 我的课程</span></a></li>
					        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=stutaskinfo" class="am-cf"> 实验任务</span></a></li>
					        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=mstutask"> 实验记录</a></li>
					        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=Sscore"> 查看成绩</a></li>
						    <li class="hiddenli"><a href="<%=basePath %>InitSvlt?flgs=1&tbname=studentInfo"> 个人设置</a></li>
					        <li class="hiddenli"><a href="<%=basePath %>teacher/help.html"> 帮助</a></li>
					        <li class="hiddenli"><a href="<%=basePath %>loginOut.jsp"> 退出登录</a></li>					    
						    
						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
		<!-- ========== Left Sidebar end ========== -->
		<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="card-box">
					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
				          <div class="am-btn-toolbar">
				            <div class="am-btn-group am-btn-group-xs">
				              
				              
				            </div>
				          </div>
				        </div>	
				        
						<div class="am-u-sm-12 am-u-md-6">
				          <div class="am-input-group am-input-group-sm">
				          	  学期：<select id="ckterm"   >
									<option value="0">选择学期</option>
									<c:forEach var="a" items="${termslist }">
										<option value="${a.id }">${a.termname }</option>
									</c:forEach>
								</select>
							 课程：<select id="ckcourse"  class="ckinput easyui-combobox" >
									<option value="0">选择课程</option>
									<c:forEach var="s" items="${courselist }">
										<option value="${s.id }">${s.cname }</option>
									</c:forEach>
								</select>
				          <span class="am-input-group-btn">
				            <button class="am-btn am-btn-default" type="button" onclick="cktj();return false;">查询</button>
				          </span>
				          </div>
				        </div>
				      </div>
					  <!-- Row end -->
					  
					  <!-- Row start -->
					  	<div class="am-g">
	<div class="am-u-sm-12">
     <!--    <form class="am-form">  --> 
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"></th><th class="table-title">学期</th><th >课程</th><th class="table-type">实验标题</th><th>发布日期</th><th>截止日期</th><th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="a" items="${alist }">
              <tr>
                <td><input name="delid" type="checkbox" value="${a.id }"/></td>                
                <td >${a.termname }</td>
				<td >${a.cname }</td>
				<td >${a.title }</td>
				<td >${a.time }</td>										
				<td class="deadline">${a.deadline }</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">

                      <a href="<%=basePath %>GetDataSvlt?id=${a.id }&tbname=teaTask">
                      <button class="am-btn am-btn-default am-btn-xs am-text-secondary" ><span class="am-icon-edit"></span> 详情</button>
                      </a>
                    </div>
                  </div>
                </td>
              </tr>
              </c:forEach>
			</tbody>
            </table>
            <div class="am-cf">
              共有 ${allnums } 条记录，当前第 ${pagenum }/${pagenums } 页
              <div class="am-fr">
                <ul class="am-pagination">
                  <li ><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','stutaskinfo');return false;">«</a></li>
                  <li ><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','stutaskinfo');return false;">&lt;</a></li>
                  <li ><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','stutaskinfo');return false;">&gt;</a></li>                 
                  <li><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','stutaskinfo');return false;">»</a></li>
                </ul>
              </div>
            </div>
            
            
        <input type="hidden" id="hrownums" value="${rownums }" />
		<input type="hidden" id="hpagenum" value="${pagenum }" />
		<input type="hidden" id="hpagenums" value="${pagenums }" />
		<input type="hidden" id="idi" value="" />
		<input type="hidden" id="flagi" value="" />
		<div style="display: none;">
			<form id="fm" action="" method="post">
				<input id="pt" name="tbname"/>
			</form>
		</div>
        <hr />
         
      <!--      </form>-->
          <!-- add-dialog -->
				
		
        </div>
		
	 <!-- Row end -->					  
	 </div>	
	
    </div>  			
   </div>	
   <div class="am-g">
		<!-- 底部信息 -->
		<div class="footer">
		    <span class="school">建设单位：${other.footer_name}</span>
		    <span class="address">${other.footer_Addr }</span>
		</div>
   </div>		
</div>
</div>
		<!-- end right Content here -->
		<!--</div>-->
		
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
<!-- 任务提醒对话框 -->
	
    <div class="dialog" title="实验任务进度提示" >
	  <p>您共有<span> ${TaskTipSize } </span>个实验任务可完成</p>	  
	  <p><a href="<%=basePath%>InitSvlt?flgs=1&tbname=TaskTip"  onclick="closeDlg()">立即查看</a></p>
	</div>
	<!-- 任务提醒对话框  end-->		
		<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
		<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>
		<script src="<%=basePath %>jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
	</body>
	
</html>



