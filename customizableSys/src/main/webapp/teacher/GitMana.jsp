<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GitHub实验管理</title>

<script type="text/javascript" src="/customizableSys/js/jquery-3.3.1.min.js"></script>
<link href="/customizableSys/jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="/customizableSys/jqueryUIcustom/js/jquery-1.8.3.js"></script>
<script src="/customizableSys/jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
<script language="JavaScript" >

$(function() {
  $( "#tabs" ).tabs();
});

function onlyNumber(obj){	//只允许输入小数
	//得到第一个字符是否为负号
	var t = obj.value.charAt(0);
	//先把非数字的都替换掉，除了数字和.
	obj.value = obj.value.replace(/[^\d\.]/g,'');
	//必须保证第一个为数字而不是.
	obj.value = obj.value.replace(/^\./g,'');
	//保证只有出现一个.而没有多个.
	obj.value = obj.value.replace(/\.{2,}/g,'.');
	//保证.只出现一次，而不能出现两次以上
	obj.value = obj.value.replace('.','$#$').replace(/\./g,'').replace('$#$','.');
	//如果第一位是负号，则允许添加
	if(t == '-'){
	//obj.value = '-'+obj.value;
	alert("请输入非负小数");
	
	}
}
function submitGitdate(){
	var org=$("#org").val();
	var proj=$("#proj").val();
	var cktermsid=$("#cktermsid").val();
	var ccoursesid=$("#ccoursesid").val();
	
	var pulls=$("#pulls").val();
	var pullsFull=$("#pullsFull").val();
	var commits=$("#commits").val();
	var commitsFull=$("#commitsFull").val();
	var files=$("#files").val();
	var filesFull=$("#filesFull").val();
	var comments=$("#comments").val();
	var commentsFull=$("#commentsFull").val();
	if(org =="" || proj=="" || cktermsid=="0" || ccoursesid=="0" || pulls=="" || pullsFull=="" || commits=="" || commitsFull=="" || files=="" || filesFull=="" || comments=="" || commentsFull==""){
		alert("请将信息填写完整");
		return ;
	}
	var sum=parseFloat(pulls)+parseFloat(commits)+parseFloat(files)+parseFloat(comments);
	//alert(sum);
	if(sum != 1){
		alert("“Pulls+Commits+Files+Comments”的和不等于1，请检查")
		return ;
	}
	alert("初次统计数据时，时间为几十分钟至几小时，请耐心等待...")
	$.ajax({
		url:'/customizableSys/testgitSlvt',
		type:'post',
		data:{"org":org,"proj":proj,"cktermsid":cktermsid,"ccoursesid":ccoursesid,"pulls":pulls,"pullsFull":pullsFull,"commits":commits,"commitsFull":commitsFull,"files":files,"filesFull":filesFull,"comments":comments,"commentsFull":commentsFull,},
		dataType:'json',
		success:function(data){			
				alert(data.msg);
				window.location.href="/customizableSys/GetDataSvlt?tbname=newgit&org="+org+"&proj="+proj;
		}
	});
}
$(function() {
    $( document ).tooltip();
  });
$(function() {
    $( ".tabs-2" ).click(function(){
    	window.location.href="/customizableSys/GetDataSvlt?tbname=newgit&org=hzuapps&proj=web-wechat-2017&id=1";
    });
  });  
</script>
<style>
	.titlename{
		display:block;
		padding:5px;
		background:#fafcff;
		box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2), 0 1px 1px 0 rgba(0,0,0,0.19);
		margin:20px 0px;
	}
	.td{
		padding:5px;
	}
</style>
</head>
<body>
	<div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">GitHub实验成绩录入</a></li>
	    <li><a href="#tabs-2" class="tabs-2">查看实验数据</a></li>
	    
	  </ul>
	  <div id="tabs-1">
	  		<form >
	  			
				<p>组织库名称：<input type="text" name="org" id="org"></p>
				<p>实验库名称：<input type="text" name="proj" id="proj"></p>
				<span class="titlename">请选择关联到的课程信息：</span>
				<p>	
					学期：<select id="cktermsid" name="cktermsid" class="ckinput easyui-combobox">
							<option value="0">选择学期</option>
							<c:forEach var="a" items="${termslist }">
						    <option value="${a.id }">${a.termname }</option>
							</c:forEach>
						</select>
				</p>
				<p>	
					课程：<select id="ccoursesid" name="ccoursesid" class="ckinput easyui-combobox">
							<option value="0">选择课程</option>
							<c:forEach var="a" items="${courselist }">
						    <option value="${a.id }">${a.cname }</option>
							</c:forEach>
						</select>
				</p>
				<span class="titlename">设置分值比重：</span>
				<table  border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
					<tr>
					  <th>评分参数</th>
					  <th>比例 (Pulls+Commits+Files+Comments=1)</th>
					  <th>满分次数</th>
					</tr>
					<tr >
						<th width="20%" class="td" >Pulls：</th>
						<td width="20%" align="center"><input name="pulls" id="pulls" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.4"/></td>						
						<td width="20%" class="td" align="center"><input name="pullsFull" id="pullsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
					</tr>
					<tr >
						<th width="20%" class="td" >Commits：</th>
						<td width="20%" align="center"><input name="commits" id="commits" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.4"/></td>						
						<td width="20%" class="td" align="center"><input name="commitsFull" id="commitsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
					</tr>
					<tr >
						<th width="20%" class="td" >Files：</th>
						<td width="20%" align="center"><input name="files" id="files" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.1"/></td>						
						<td width="20%" class="td" align="center"><input name="filesFull" id="filesFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
					</tr>
					<tr >
						<th width="20%" class="td" >Comments：</th>
						<td width="20%" align="center"><input name="comments" id="comments" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.1"/></td>						
						<td width="20%" class="td" align="center"><input name="commentsFull" id="commentsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
					</tr>
					<tr><td align="center" colspan="3" for="sub"><input type="button" value="统计数据" onclick="submitGitdate()" id="sub" title="提交前，请核对您的GitHub身份认证信息、组织库、实验库信息是否正确，否则无法获取实验数据"></td></tr>							
				</table>

				
			</form>
	  </div>
	  <div id="tabs-2">
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
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">成绩</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1"></span></strong></div></td>
								</tr>
								<c:forEach var="a" items="${alist }">
									<tr>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.num }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.num }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.num }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.num }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.num }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a class="releaseBtn" href="GetDataSvlt?tbname=teacourse&planid=${a.id}"><img src="images/release.png" width="14" height="14" />发布作业</a></span></div></td>
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