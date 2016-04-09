<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./static/css/index.css" />
<title>沙发院线后台管理平台</title>
#tagLibs()
</head>
<script type="text/javascript">
	function logout() {
		window.top.location = './logout.html';
	}
	
	function showProgress(){
	    $("#progress").text("0");
	    $("#div_progress").show();
	    setTimeout(progress, 1000);
	}
	
	function progress(){
	    $.ajax({
	        type: "POST",
	        dataType: "json",
	        url: "/epg/REST/uploadProgress",
	        success: function(data) {
	            if(data.percent && !isNaN(data.percent) ){
	                $("#progress").text(data.percent.toFixed(2));
	            }
	            
	            if(data.percent == 100){
	                $("#div_progress").hide("slow");
	                
	            }else{
	                setTimeout(progress, 1000);
	            }
	        }
	    });
	}
	</script>
<body>
	<div class="index_content">
		<!--页面头部开始-->
		<div class="header">
			<div class="index_head">
                <div style="float:left">
                    <img class="logo" src="./static/img/logo.png" width="305" height="35" />
                </div>
				
                <div style="float: left;padding-left:130px;padding-top:10px">
                    <div id="div_progress" style="height:20px;width:500px;background-color: green;text-align: center;padding-top: 10px;color: white;display: none;">
                        正在上传……<span id="progress"></span>%
                    </div>
                </div>
				
                <div style="float: right;">
                	<input type="hidden" value="${user_session.loginName}" id="userName" />
                    <ul class="head_right">
                    <li><img src="./static/img/icon04.png" width="15" height="18" />${user_session.loginName},你好 &nbsp;&nbsp;<a href="#" style="color: #FFF"
                        onclick='logout();'>[退出]</a></li>
                    </ul>
                </div>
                
			</div>
		</div>
		<!--页面头部结束-->
		<!--左边菜单开始-->

		<div class="main">
			<div class="main_left">
				<ul class="nav">
					#foreach ($menu in $menus)
						<li><span class="nav_top" id="j$!{menu.id}_head"
							onclick="changeShowStatus('jb$!{menu.id}','j$!{menu.id}_head');"><a
								href="#">$menu.name</a></span>
							<ul id="jb$!{menu.id}" style="display: none">
								#foreach($child in $!{menu.children})
									#if($child.url&&$child.url!="")
									<li><a href="$ctx$child.url" target="mainFrame">$!child.name</a></li>
									#end
								#end
							</ul>
						</li>
					 #end
				</ul>
			</div>
		</div>
		<!--右边内容开始-->
		<div class="main_right">
			<iframe frameborder="0" width="100%" height="100%" id="mainFrame"
				name="mainFrame" scrolling="yes" src="${ctx}/cms/user/finduserlist.action"></iframe>
		</div>

	</div>
</body>
<script type="text/javascript">
	function changeShowStatus(item,head){
		if($("#" + item).css("display") == "block"){
			$("#" + head).attr("class","nav_top");
			$("#" + item).css("display","none");
		}else{
			$("#" + head).attr("class","nav_top_open");
			$("#" + item).css("display","block");
		}
		
		var main_left_height=$("div.main_left").outerHeight();
		if(!main_left_height || main_left_height<=0)
			return;
		
		$("div.main_right").height(main_left_height);
	}
</script>
</html>
