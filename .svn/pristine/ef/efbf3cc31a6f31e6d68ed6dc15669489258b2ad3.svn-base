<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($RightID=='-1')添加用户 #elseif($Edit=="true")编辑用户#else查看用户 #end</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
    <script type="text/javascript" src="${ctx}/static/js/validate/jquery.validate.min.js"></script>	
    <script type="text/javascript" src="${ctx}/static/js/validate/validate-tip.js"></script>
	<style>
		table .alink {
			color:blue;
			text-decoration:underline;
			font-weight:bold;
			cursor:pointer;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var addvalidator = $("#fom").validate({
					onsubmit : false, 
					rules: {
						'rightName': {
							required: true,
							maxlength : 40,
						}, 
						'rightAction': {
							required: true,
							maxlength : 255,
						}, 
						'rightDesc': {
							required: true,
							maxlength : 255,
						}
				},messages: {
					
					'rightName' : {
							required : "权限名称不能为空!",
							maxlength : "权限名称长度不能超过个40字符",
					},
					'rightAction' : {
							required : "权限地址不能为空!",
							maxlength : "权限地址长度不能超过个255字符",
					},
					'rightDesc' : {
							required : "权限描述不能为空!",
							maxlength : "权限描述长度不能超过个255字符",
					}
			},
			errorPlacement: $.handleError,
			success: $.handleSuccess,
			invalidHandler: $.invalidAlertHandler
			});
			
			$('#SaveRight').click(function(){
				if (addvalidator.form()) {
					var url = window.ctx+'/cms/right/addright.action';
					var data = $('#fom').serializeArray();
					$.post(url, data, function(feedback) {
										alert(feedback.message);
										if(feedback.successful) {
											window.dialogArguments.reloadPage();
                                            window.close();
										}
					});
				}
			});
			$('#UpdateRight').click(function(){
				if (addvalidator.form()) {
					var url = window.ctx+'/cms/right/modifyright.do';
					var data = $('#fom').serializeArray();
					$.post(url, data, function(feedback) {
										alert(feedback.message);
										if(feedback.successful) {
											window.dialogArguments.reloadPage();
                                            window.close();
										}
					});
				}
			});
		});
	</script>
</head>

<body class="ContentBody">
	<form method="post"  name="fom" id="fom">
	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" style="border:1px solid #cfcfcf;background:#ffffff;">
    <tr>
      <td colspan="2">
      	<fieldset style="height:100%;">
				<legend>#if($RightID=='-1')添加权限#elseif($Edit=="true")编辑用户#else查看用户 #end</legend>
					<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">权限名称</td>
							<td class="pn-fcontent">
								<input type="hidden" name='id' value="$RightID"/>
								#if($Edit=="true")
								<input name="rightName" class="text" id="rightName" type="text" value="$!{RightInfo.rightName}"/>
								<em class="required">*</em>
								#else
								$!{RightInfo.rightName}
								#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">权限描述</td>
							<td class="pn-fcontent">
								#if($Edit=="true")
								<input name="rightDesc" class="text" id="rightDesc" type="text" value="$!{RightInfo.rightDesc}"/>
								<em class="required">*</em>
								#else
								$!{RightInfo.rightDesc}
								#end 
							</td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">权限地址</td>
							<td class="pn-fcontent" colspan='3'>
							#if($Edit=="true")
								<input name="rightAction" style="width:80%;" id="rightAction" type="text" value="$!{RightInfo.rightAction}"/>
								<em class="required">*</em>
							#else
								$!{RightInfo.rightAction}
							#end 
							</td>
						</tr>
					</table>
				</fieldset>	
		</td>
    </tr>
   <tr>
    <td width="17%">&nbsp;</td>
    <td width="83%">
    #if($RightID=='-1')
    	<button type="button" id="SaveRight" class="flatbutton">保存</button>
	#elseif($Edit=="true")
		<button type="button" id="UpdateRight" class="flatbutton">更新</button>
	#end
		<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
    </td>
   </tr>
	</table>
	</form>
</body>
</html>
