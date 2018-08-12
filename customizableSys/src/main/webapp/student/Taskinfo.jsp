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
	var date=new Date();
	  var time=date.toLocaleDateString();
	  var deadline='${a.deadline}';
	  deadline=deadline.replace("-","/");
	  deadline=deadline.replace("-","/");
	  var date2=new Date(deadline);
	 // alert(date2);
	  if(date>date2){		 		  
		  
		  $(".showeditor").text("截止提交");
		  $(".showeditor").attr("disabled","disabled");
		  $(".showeditor").css("background","#948e8c");
	  };
		  	 
//打开编辑区	
	
  $(".showeditor").click(function(){
    $(".editor").show();
    $(".btnF").show();
    $(".btnSb").show();
    $(".showeditor").hide();
  });
  /*返回按钮*/
  $(".btnF").click(function(){
	  window.location.href="/customizableSys/InitSvlt?flgs=1&tbname=stutaskinfo"; 
  });
  /*提交按钮*/
   $(".btnSb").click(function(){
	   var editor=window.editor;
       
       //获取值
   	if (editor) {
   		//设置值 editor.setData(htmlStr);
   		var teatask_id=${a.id};
   		var remark=editor.getData();//获取文本编辑器中的值  		
   		if(remark==""){
   			alert('请填写作业内容');
   			return;
   		}
   		$.ajax({
				url:'/customizableSys/AddSvlt',
				type:'post',
				data:{"tbname":"stutask","teatask_id":teatask_id,"remark":remark},
				dataType:'json',
				success:function(data){
					alert(data.msg);
				}
			});
			
   	}else{
   		alert("error");
   	}	
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
       editor.setData('');
       console.log( editor );
   } )
   .catch( error => {
       console.error( error );
   } );
});


</script>
</head>
<body>

<fieldset style="height:100%; margin:30px;">
<legend style="color:#6d0404;border:1px solid #6d0404;background:#d9e0fb;padding:5px;box-shadow: 0 3px 3px 0 rgba(0,0,0,0.2), 0 3px 3px 0 rgba(0,0,0,0.19);">&nbsp;&nbsp;实验任务详情&nbsp;&nbsp;</legend>
	<table  border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<tr >
			<td width="10%">学期：</td><td width="20%">${a.termname} </td>
			<td width="10%">班级：</td><td width="20%">${a.classname}</td>
			<td width="10%">课程名称：</td><td width="30%">${a.cname}  </td>
		</tr>
		<tr>
			<td>作业标题:</td>
			<td colspan="5" >${a.title}</td>
		</tr>
		<tr style="font-size:12px;text-align:center;color:blue">
			<td colspan="6">发布时间:${a.time}<span style="width:50px;display:inline-block;"></span>最后期限:${a.deadline}</td>
			
		</tr>
		<tr>
			<td>作业要求:</td>
			<td colspan="5"><div>${a.remark}</div></td>
		</tr>	
		<tr  class="editor">
			<td width="10%">编辑作业：</td>
			<td  colspan="5"><textarea name="content" id="editor" style="width:70%"></textarea></td>			
		</tr>
		
	</table>
	<p align="center">
		<button class="button btnF" style="vertical-align:middle;display:none;"><span>返回 </span></button>
		<button class="button btnSb" style="vertical-align:middle;display:none;"><span>提交作业 </span></button>				
	</p>
	<p align="center"><button class="button showeditor" style="vertical-align:middle"><span>提交作业 </span></button></p>
</fieldset>
<script>
	
</script>
</body>
</html>