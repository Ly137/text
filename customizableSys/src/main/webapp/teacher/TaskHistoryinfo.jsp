<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评成绩</title>

<script type="text/javascript" src="/customizableSys/js/jquery-3.3.1.min.js"></script>
<style>
	/*内容布局*/
	td{	 
	 padding:10px 0px;
	}
	.td1{
	 border-bottom:1px solid #566;
	 padding:10px 0px;
	}
	/*提交作业按钮*/
	.button {
	  display: inline-block;
	  border-radius: 4px;
	  background-color: #f4511e;
	  border: none;
	  color: #FFFFFF;
	  text-align: center;
	  font-size: 14px;
	  padding: 10px;
	  width: 100px;
	  transition: all 0.5s;
	  cursor: pointer;
	  margin: 5px;
	}
	
	.button span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}
	
	.button span:after {
	  content: ' ';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}
	
	.button:hover span {
	  padding-right: 20px;
	}
	
	.button:hover span:after {
	  opacity: 1;
	  right: 0;
	}
	
	
</style>


<script>
$(document).ready(function(){
  
});
/*返回按钮*/
function redirect(){
	  window.location.href="/customizableSys/InitSvlt?flgs=1&tbname=Tscore";
};

/*提交按钮*/
function onSubmit(){
 		var stutask_id=${a.id};
 		var score=$("#score").val();
 		if( score=="" ){
			alert('请填写成绩');
			return;
		}
 		$.ajax({
				url:'/customizableSys/UpdSvlt',
				type:'post',
				data:{"tbname":"Tscore","stutask_id":stutask_id,"score":score},
				dataType:'json',
				success:function(data){
					alert(data.msg);
				}
			});		
};

</script>
</head>
<body>

<fieldset style="height:100%; margin:30px;">
<legend style="color:#6d0404;border:1px solid #6d0404;background:#d9e0fb;padding:5px;box-shadow: 0 3px 3px 0 rgba(0,0,0,0.2), 0 3px 3px 0 rgba(0,0,0,0.19);">&nbsp;&nbsp;实验任务详情&nbsp;&nbsp;</legend>
	<table  border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<tr >
			<td width="10%" class="td">学期：</td><td width="20%">${a.termname} </td>
			<td width="10%" class="td">班级：</td><td width="20%">${a.classname}</td>
			<td width="10%" class="td">课程名称：</td><td width="30%">${a.cname}  </td>
		</tr>
		<tr>
			<td class="td">作业标题:</td>
			<td colspan="5" class="td">${a.title}</td>
		</tr>
		<tr style="font-size:12px;text-align:center;color:blue">
			<td colspan="6" class="td">发布时间:${a.time}<span style="width:50px;display:inline-block;"></span><span class="deadline">最后期限:${a.deadline}</span></td>
			
		</tr>
		<tr>
			<td>作业要求:</td>
			<td colspan="5"><div>${a.remark}</div></td>
		</tr>	
		<tr><td colspan="6" style="text-align:center;color:black;border:1px solid #6d0404;background:#d9e0fb59;padding:5px;box-shadow: 0 2px 2px 0 rgba(0,0,0,0.2), 0 2px 2px 0 rgba(0,0,0,0.19);" >完成情况</td></tr>
		<tr>
			<td>作业内容：</td>
			<td colspan="5"><div>${a.stusy_remark}</div></td>
		</tr>
		<tr>
			<td>成绩：</td>
			<td><input type="text" id="score" value="${a.score }"></td>
		</tr>
		<tr>
			<td colspan="6">
			
			<p align="center">
				<input  class="button" type="button" value="返回" onclick="redirect()">
				<input class="button " type="button" value="提交" onclick="onSubmit()">				
			</p>
			
			</td>
		
		</tr>
	</table>
	
	
</fieldset>
<script>
	
</script>
</body>
</html>