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
<script type="text/javascript" src="<%=basePath%>lib/jquery/jquery-3.3.1.min.js"></script>
<script src="/customizableSys/ckeditor5/ckeditor.js"></script>		<!-- 引入web在线文本编辑器的配置文件 -->
<style>
	/*内容布局*/
	td{
	 
	 padding:10px 0px;
	}
	/*发布作业按钮*/
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
//点击“提交”按钮
function onSubmit(){				
        var editor=window.editor;
        
        //获取值
    	if (editor) {
    		//设置值 editor.setData(htmlStr);    		
    		var remark=editor.getData();//获取文本编辑器中的值
    		var termid=$('#termid').val();
    		var classid=$('#classid').val();	
    		var courseid=$("#courseid").val();
    		var title =$("#title").val();
    		var deadline=$("#deadline").val();
    		
    		if(title =="" || remark=="<p>&nbsp;</p>" || deadline==""){
    			alert('作业信息不完整。');
    			return;
    		}
    		$.ajax({
				url:'/customizableSys/AddSvlt',
				type:'post',
				data:{"tbname":"teaTask","termid":termid,"classid":classid,"courseid":courseid,"title":title,"remark":remark,"deadline":deadline},
				dataType:'json',
				success:function(data){					
					if(data.msg=="1"){
						alert("发布成功");
					}else{
						alert("发布失败");
					}
				}
			});
			
    	}else{
    		alert("error");
    	}	
        
	}
//点击返回按钮，跳转到s_nav.jsp
function redirect(){
	window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse";
}
</script>
<title>发布课程作业</title>
</head>
<body>
	<form>
	<fieldset style="height:100%; margin:30px;">
		<legend style="color:#6d0404;border:1px solid #6d0404;background:#d9e0fb;padding:5px;box-shadow: 0 3px 3px 0 rgba(0,0,0,0.2), 0 3px 3px 0 rgba(0,0,0,0.19);">&nbsp;&nbsp;发布作业&nbsp;&nbsp;</legend>
	
		<table  border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
			<tr>
				<td>学期：</td><td>${a.termname} <input type="hidden" value="${a.terms_id}" id="termid"></td>
				<td>班级：</td><td>${a.classname} <input type="hidden" value="${a.classinfo_id}" id="classid"></td>
				<td>课程名称：</td><td>${a.cname} <input type="hidden" value="${a.course_id}" id="courseid"></td>
			</tr>
			<tr>
				<td>作业标题</td>
				<td><input type="text" id="title" ></td>
			</tr>
			<tr>
				<td>最后期限:</td>
				<td><input type="date" name="deadline" id="deadline" ></td>
			</tr>
			<tr>
				<td>作业内容</td>
				<td><textarea name="content" id="editor"></textarea></td>
			</tr>	
			<tr>
				<td colspan="6">
				
				<p align="center">
					<input  class="button" type="button" value="返回" onclick="redirect()"><input class="button" type="button" value="发布" onclick="onSubmit()">				
				</p>
				
				</td>
			
			</tr>
		</table>
		</fieldset>
	</form>
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
			            var test="test";
			            alert("test="+test);
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
			        editor.setData('');
			        console.log( editor );
			    } )
			    .catch( error => {
			        console.error( error );
			    } );
			   
			    
				
 </script>
</body>
</html>