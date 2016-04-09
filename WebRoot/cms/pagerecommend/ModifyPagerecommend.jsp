<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($PagerecommendID=='-1') 新增活动推荐 #elseif($Edit=="true")编辑活动推荐
	#else 查看活动推荐#end</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
			#tagLibs()
			<link type="text/css" rel="stylesheet"
				href="${ctx}/static/css/base.css" />
			<link type="text/css" rel="stylesheet"
				href="${ctx}/static/css/public.css" />
			<script type="text/javascript"
				src="${ctx}/static/js/validate/jquery.validate.min.js"></script>
			<script type="text/javascript"
				src="${ctx}/static/js/validate/validate-tip.js"></script>
			<style>
table .alink {
	color: blue;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}
</style>
			<script type="text/javascript">
				$(function() {
					var validator = $("#fom").validate({
						onsubmit : false,
						rules : {
							'title' : {
								required : true,
								maxlength : 20,
							},
							'sort' : {
								required : true,
								digits:true,
								max : 100,
								min : 0
							}
						},
						messages : {
							'title' : {
								required : "标题不能为空!",
								maxlength : "标题长度不能超过20个字符",
							},
							'sort' : {
								required : "排序不能为空!",
								digits : "排序必须为整数!",
								max : "排序必须为0-100的数字",
                                min : "排序必须为0-100的数字"
							}
						},
						errorPlacement : $.handleError,
						success : $.handleSuccess,
						invalidHandler : $.invalidAlertHandler
					});

					$('#SavePagerecommend').click(
							function() {
								if (validator.form()) {
									var url = window.ctx
											+ '/cms/pagerecommend/addpagerecommend.action';
									var data = $('#fom').serializeArray();
									$.post(url, data,
											function(feedback) {
												alert(feedback.message);
												if (feedback.successful) {
													window.dialogArguments
															.reloadPage();
													window.close();
												}
											});
								}
							});
					
					
					$('#UpdatePagerecommend')
							.click(
									function() {
										if (validator.form()) {
											var url = window.ctx
													+ '/cms/pagerecommend/modifypagerecommend.action';
											var data = $('#fom')
													.serializeArray();
											$
													.post(
															url,
															data,
															function(feedback) {
																alert(feedback.message);
																if (feedback.successful) {
																	window.dialogArguments
																			.reloadPage();
																	window
																			.close();
																}
															});
										}
									});
				});
			</script>
</head>

<body class="ContentBody">
	<form method="post" name="fom" id="fom">
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="2"
			style="border: 1px solid #cfcfcf; background: #ffffff;">
			<tr>
				<td colspan="2">
					<fieldset style="height: 100%;">
						<legend>#if($PagerecommendID=='-1') 新增活动推荐#elseif($Edit=="true")
							编辑活动推荐#else 查看活动推荐#end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px;">标题</font></td>
									
									<td class="pn-fcontent"> #if($Edit=="true") <input name="title"
									class="text" id="title" type="text"
									value="$!{PagerecommendInfo.title}" /> 
									#else $!{PagerecommendInfo.title} #end</td>
									
									<td width="10%" class="pn-flabel pn-flabel-h">状态
        						</td>
        						
        						<td class="pn-fcontent" colspan='13'>
        						<select name="status" id="status">
                                    	<option value="">==请选择==</option>
   										<option value="0" #if(${PagerecommendInfo.status} == '0') selected="selected" #end >下线</option>
   										<option value="1" #if(${PagerecommendInfo.status} == '1') selected="selected" #end >上线</option>
	       							</select></td>
	       							#if($PagerecommendID>0) <input type="hidden"
									name="id" value="$PagerecommendID" />#end
							</tr>
							
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px;">名称</font></td>
									
									<td class="pn-fcontent"> #if($Edit=="true") <input name="objectname"
									class="text" id="objectname" type="text"
									value="$!{PagerecommendInfo.objectname}" /> 
									#else $!{PagerecommendInfo.objectname} #end</td>
									
									<td width="10%" class="pn-flabel pn-flabel-h">图片标识
        						</td>
        						
        						<td class="pn-fcontent" colspan='13'>
        						#if($Edit=="true") <input name="identify"
									class="text" id="identify" type="text"
									value="$!{PagerecommendInfo.identify}" /> 
									#else $!{$!{PagerecommendInfo.identify}} #end
        						</td>
							</tr>
							
							
							
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px;">排序</font></td>
									
									<td class="pn-fcontent"> #if($Edit=="true") <input name="sort"
									class="text" id="sort" type="text"
									value="$!{PagerecommendInfo.sort}" /> 
									#else $!{PagerecommendInfo.sort} #end</td>
									
									<td width="10%" class="pn-flabel pn-flabel-h">类型
        						</td>
        						
        						<td class="pn-fcontent" colspan='13'>
        						<select name="type" id="type">
                                    	<option value="">==请选择==</option>
   										<option value="0" #if(${PagerecommendInfo.type} == '0') selected="selected" #end >详情页</option>
   										<option value="1" #if(${PagerecommendInfo.type} == '1') selected="selected" #end >视频</option>
   										<option value="2" #if(${PagerecommendInfo.type} == '2') selected="selected" #end >活动推荐</option>
   										<option value="3" #if(${PagerecommendInfo.type} == '3') selected="selected" #end >单专题</option>
   										<option value="4" #if(${PagerecommendInfo.type} == '4') selected="selected" #end >多专题</option>	
	       							</select></td>
	       							#if($PagerecommendID>0) <input type="hidden"
									name="id" value="$PagerecommendID" />#end
							</tr>
							
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px;">图片地址</font></td>
									
									<td class="pn-fcontent" colspan='15'> #if($Edit=="true") <input name="imgurl"
									class="text" id="imgurl" type="text"
									value="$!{PagerecommendInfo.imgurl}" /> 
									#else $!{PagerecommendInfo.imgurl} #end</td>
        						
							</tr>
							
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">
					#if($PagerecommendID=='-1')
						<button type="button" id="SavePagerecommend" class="flatbutton">新增</button>
					#elseif($Edit=="true")
						<button type="button" id="UpdatePagerecommend" class="flatbutton">更新</button>
					#end
					<button type="button" onclick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
