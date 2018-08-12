<%@page import="bean.Snav"%>
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
<title>二级导航栏--查看详情与更新</title>

<script type="text/javascript" src="<%=basePath%>lib/jquery/jquery-3.3.1.min.js"></script>
<script src="/customizableSys/ckeditor5/ckeditor.js"></script>		<!-- 引入web在线文本编辑器的配置文件 -->
<!-- Tab标签 -->
<link href="<%=basePath%>/jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="<%=basePath%>/jqueryUIcustom/js/jquery-1.8.3.js"></script>
<script src="<%=basePath%>/jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
<%	request.setCharacterEncoding("UTF-8");		
%>
<style type="text/css">
	.box{
		width:100%;
		
	}
	
/*编辑器样式*/
.document-editor {
    
    width: 500px;

   
}
</style>
<script>
window.onload=function(){
	//初始化父标题
	var select=$("#fid").val();
	$("select option[value='"+select+"']").attr("selected", "selected");
 }
$(function() {
    $( "#tabs" ).tabs();
  });
//点击“提交”按钮
function onSubmit(){				
        var editor=window.editor;
        
        //获取值
    	if (editor) {
    		//设置值 editor.setData(htmlStr);
    		
    		var remark=editor.getData();//获取文本编辑器中的值
    		var name=$('#snav_name').val();
    		var fnav_id=$('#gotitle_id').val();	
    		var id=$("#sid").val();
    		if(name==""||remark==""||fnav_id=="0"){
    			alert('二级标题信息不完整。');
    			return;
    		}      				        		 		        		 		        		 		        		 
    		 $.ajax({				
					url:'/customizableSys/UpdSvlt',
					type:'post',
					data:{"tbname":"snav","id":id,"name":name,"remark":remark,"fnav_id":fnav_id},
					dataType:'json',
					success:function(data){
						alert(data.msg);
						if(data.msg=="修改成功"){
							window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=snav";
						}
					}
				}) 
			
    	}else{
    		alert("error");
    	}	
        
	}
//点击返回按钮，跳转到s_nav.jsp
function redirect(){
	window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=snav";
}
</script>
</head>
<body>
	<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">更改二级标题</a></li>		    
		  </ul>
		  <div id="tabs-1">
		  		<div class="box">
		
			   <form >
				<table>
					<tr>
						<td width="10%">父标题：</td>
						<td>	
							<input type="hidden" name="fid" id="fid" value="${ob.fnav_id }"/>
							<select id="gotitle_id" name="gotitle_id"  >
							<option value="0" >选择父标题</option>
							<c:forEach var='a' items='${otitlelist}'>
								
								<option value="${a.id }">${a.name }</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>	
						<td width="10%">二级标题：</td>
						<td>
						<input type="text" name="snav_name" id="snav_name" value="${ob.snav_name }" size='100'/>
						<input type="hidden" name="sid" id="sid" value="${ob.id }"/>
						</td>
					</tr>
					<tr >
						<td width="10%">内容：</td>
						<td  ><textarea name="content" id="editor" style="width:70%"></textarea></td>
						
					</tr>
					<tr>
						<td width="10%"></td>
						<td align="center">
						<input type="button" value="修改" onclick="onSubmit()"  style="padding:3px 20px;margin-right:30px;">
						<input type="button" value="取消" onclick="redirect()" style="padding:3px 20px;">
						</td>
					</tr>
				</table>   			
			   </form>
	  
	</div>
		  </div>
	</div>
	
<script>
 				// 加载了适配器			  
			    class UploadAdapter {
			        constructor(loader) {
			            this.loader = loader;
			        }
			        upload() {
			            return new Promise((resolve, reject) => {
			            const data = new FormData();			           
			            data.append('upload', this.loader.file);
			            data.append('allowSize', 10);//允许图片上传的大小/兆
			            //alert( this.loader.file.name);	//输出上传图片 的名称
			            console.log(data);			            
			            $.ajax({
			                url: '/customizableSys/EditorUploadSvlt',
			                type: 'POST',
			                data: data,
			                dataType: 'json',
			                processData: false,	// jQuery不要去处理发送的数据
			                contentType: false, // jQuery不要去设置Content-Type请求头s
			                success: function (data) {
			                    if (data.res) {
			                    	
			                        resolve({
			                            default: data.url
			                            
			                        });
			                    } else {
			                        reject(data.msg);
			                    }
			                }
			            });

			        });
			        }
			        abort() {
			        }
			    };
			    
			   ClassicEditor
			   .create( document.querySelector( '#editor' ))
			   .then( editor => {	
			    	//配置上传文件适配器
			    	editor.plugins.get('FileRepository').createUploadAdapter = (loader)=>{
				        return new UploadAdapter(loader);
				    };
				    window.editor=editor;
			        editor.setData('${ob.remark}');
			        console.log( editor );
			    } )
			    .catch( error => {
			        console.error( error );
			    } );
			   
			   
			    
				
 </script>
</body>
</html>