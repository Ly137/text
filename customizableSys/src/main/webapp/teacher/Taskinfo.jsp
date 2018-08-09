<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实验任务的详细信息及提交实验</title>
<script src="/customizableSys/ckeditor5/ckeditor.js"></script>		<!-- 引入web在线文本编辑器的配置文件 -->
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
	
	/*ckeditor编辑器样式*/
	.editor{
		display:none;
	}
</style>


<script>
$(document).ready(function(){
  $(".showeditor").click(function(){
    $(".editor").show();
    $(".btnF").show();
    $(".btnSb").show();
    $(".showeditor").hide();
  });
  
  
//加载了适配器			  
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
              url: '/customizableSys/zyUploadSvlt',
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
       editor.setData('${a.remark}');
       console.log( editor );
   } )
   .catch( error => {
       console.error( error );
   } );
});
/*返回按钮*/
function redirect(){
	  window.location.href="/customizableSys/InitSvlt?flgs=1&tbname=tshiyan";
};

/*提交按钮*/
function onSubmit(){
	   var editor=window.editor;
     
     //获取值
 	if (editor) {
 		//设置值 editor.setData(htmlStr);
 		var teatask_id=${a.id};
 		var title = $("#title").val();
 		var deadline=$("#deadline").val();
 		var remark=editor.getData();//获取文本编辑器中的值  		
 		if(title =="" || remark=="" || deadline==""){
			alert('作业信息不完整。');
			return;
		}
 		$.ajax({
				url:'/customizableSys/UpdSvlt',
				type:'post',
				data:{"tbname":"teatask","teatask_id":teatask_id,"title":title,"remark":remark,"deadline":deadline},
				dataType:'json',
				success:function(data){
					alert(data.msg);
				}
			});
			
 	}else{
 		alert("error");
 	}	
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
			<td colspan="6" class="td">发布时间:${a.time}<span style="width:50px;display:inline-block;"></span>最后期限:${a.deadline}</td>
			
		</tr>
		<tr>
			<td>作业要求:</td>
			<td colspan="5"><div>${a.remark}</div></td>
		</tr>	
		
		
	</table>
	<form class="editor" style="width:100%,margin-top:20px;display:none;">
		
		<table  border="0" cellpadding="0" cellspacing="0" style="width:90%" align="center">
			<caption style="text-align:center;color:black;border:1px solid #6d0404;background:#d9e0fb59;padding:5px;box-shadow: 0 2px 2px 0 rgba(0,0,0,0.2), 0 2px 2px 0 rgba(0,0,0,0.19);">编辑区</caption>			
			<tr>
				<td>作业标题：</td>
				<td><input type="text" id="title"  value="${a.title}"></td>
			</tr>
			<tr>
				<td>最后期限：</td>
				<td><input type="date" name="deadline" id="deadline" value="${a.deadline}"></td>
			</tr>
			<tr>
				<td>作业内容：</td>
				<td><textarea name="content" id="editor"></textarea></td>
			</tr>	
			<tr>
				<td colspan="2">
				
				<p align="center">
					<input  class="button" type="button" value="返回" onclick="redirect()"><input class="button" type="button" value="更改" onclick="onSubmit()">				
				</p>
				
				</td>
			
			</tr>
		</table>
	</form>
	
	<p align="center"><button class="button showeditor" style="vertical-align:middle"><span>编辑 </span></button></p>
</fieldset>
<script>
	
</script>
</body>
</html>