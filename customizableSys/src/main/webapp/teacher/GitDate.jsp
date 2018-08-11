<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GitHub实验管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/syscss.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
<script type="text/javascript" src="/customizableSys/js/jquery-3.3.1.min.js"></script>
<link href="/customizableSys/jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="/customizableSys/jqueryUIcustom/js/jquery-1.8.3.js"></script>
<script src="/customizableSys/jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
<script language="JavaScript" >
$(function() {
	  $( "#tabs" ).tabs();
	});

</script>

</head>
<body>
	<div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">查看GitHub实验数据</a></li>	    	    
	  </ul>
	  <div id="tabs-1">
	  
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					
					<td style="padding-right:10px;"><div align="right" style="padding-right: 50px;">
						<table border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td class="STYLE3">
									学期：<select id="cktermsid" class="ckinput easyui-combobox">
											<option value="0">选择学期</option>
											<c:forEach var="a" items="${termslist }">
												<option value="${a.id }">${a.termname }</option>
											</c:forEach>
										</select>
								</td>
								<td class="STYLE3">
									课程：<select id="ccoursesid" name="ccoursesid" class="ckinput easyui-combobox">
											<option value="0">选择课程</option>
											<c:forEach var="a" items="${courselist }">
										    <option value="${a.id }">${a.cname }</option>
											</c:forEach>
										</select>
								</td>
								<td width="60">
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="cktj();return false;"><img src="images/search.png" width="14" height="14" /></a></div></td>
											<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="cktj();return false;">查询</a></div></td>
										</tr>
									</table>
								</td>
								<td width="60"></td>
								<td width="52"></td>
							</tr>
						</table>
					</div></td>
				</tr>
			</table></td>
		</tr>
		<tr>
			<td style="width: 100%;">
				<div id="nrdiv">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
								<tr>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">学期</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">课程</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">学号</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">姓名</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">Pulls</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">Commits</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">ChangedFiles</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">Comments</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">成绩</span></strong></div></td>
									
								</tr>
								<c:forEach var="git" items="${alist }">
									<tr>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.termname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.cname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.num }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.sname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.pulls }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.commits }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.changedFiles }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${git.comments }</span></div></td>
										<td height="22" bgcolor="#FFFFFF" ><div align="center"><span class="STYLE3">${git.score }</span></div></td>
										
									</tr>
								</c:forEach>
							</table></td>
						</tr>
						<tr>
							<td height="35">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="12" height="35"></td>
										<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="STYLE4">&nbsp;&nbsp;共有 ${allnums } 条记录，当前第 ${pagenum }/${pagenums } 页</td>
												<td><table border="0" align="right" cellpadding="0" cellspacing="0">
													<tr>
														<td width="40"><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','teacourse');return false;"><img src="images/first.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','teacourse');return false;"><img src="images/back.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','teacourse');return false;"><img src="images/next.gif" width="37" height="15"/></a></td>
														<td width="40"><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','teacourse');return false;"><img src="images/last.gif" width="37" height="15"/></a></td>
														<td width="100"><div align="center"><span class="STYLE1"> </span></div></td>
														<td width="40"></td>
													</tr>
												</table></td>
											</tr>
										</table></td>
										<td width="16"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
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
	  </div>
	 </div>
	  				
</body>
</html>