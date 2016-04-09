<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>影片管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
<meta http-equiv="description" content="this is my page"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
<script src="${ctx}/static/js/plupload/plupload.full.min.js"></script>
<style>
	body{ font-size: 12px;}
	body,p,div{ padding: 0; margin: 0;}
	.wraper{ padding: 30px 0;}
	.btn-wraper{ text-align: center;}
	.btn-wraper input{ margin: 0 10px;}
	#file-list{ width: 350px; margin: 20px auto;}
	#file-list li{ margin-bottom: 10px;}
	.file-name{ line-height: 30px;}
	.progress{ height: 4px; font-size: 0; line-height: 4px; background: orange; width: 0;}
	.tip1{text-align: center; font-size:14px; padding-top:10px;}
	.tip2{text-align: center; font-size:12px; padding-top:10px; color:#b00}
	.catalogue{ position: fixed; _position:absolute; _width:200px; left: 0; top: 0; border: 1px solid #ccc;padding: 10px; background: #eee}
	.catalogue a{ line-height: 30px; color: #0c0}
	.catalogue li{ padding: 0; margin: 0; list-style: none;}
</style>
</head>

<body>
	<div class="wraper">
		<div class="btn-wraper">
			<input type="button" value="选择文件..." id="browse" />
			<input type="button" value="开始上传" id="upload-btn" />
			<input type="button" value="清空" id="empty" />
		</div>
		<ul id="file-list">

		</ul>
	</div>
	<script>

	var uploader = new plupload.Uploader({ //实例化一个plupload上传对象
		browse_button : 'browse',
		url : 'doupload.action',
		flash_swf_url : '${ctx}/static/plupload/js/Moxie.swf',
		silverlight_xap_url : '${ctx}/static/plupload/Moxie.xap',
	});
	uploader.init(); //初始化

	var filequeue = null;
	//绑定文件添加进队列事件
	uploader.bind('FilesAdded',function(uploader,files){
		filequeue = files;
		for(var i = 0, len = files.length; i<len; i++){
			var file_name = files[i].name; //文件名
			//构造html来更新UI
			var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name + '</p><p class="progress"></p></li>';
			$(html).appendTo('#file-list');
		}
	});

	//绑定文件上传进度事件
	uploader.bind('UploadProgress',function(uploader,file){
		$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
	});
	
	uploader.bind('Error', function(up, err) {  
        $('#filelist').append("<div>Error: " + err.code +  
            ", Message: " + err.message +  
            (err.file ? ", File: " + err.file.name : "") +  
            "</div>"  
        );  
        up.refresh();  
    });  

	//上传按钮
	$('#upload-btn').click(function(){
		uploader.start(); //开始上传
	});
	
	/*清空按钮*/
	$('#empty').click(function(){
		if(filequeue.length>0){
			$("#file-list").html("");
			for(var i = 0, len = filequeue.length; i<len; i++){
				uploader.removeFile(filequeue[i]);
			}	
		}
	});
	

	</script>
</body>
</html>
