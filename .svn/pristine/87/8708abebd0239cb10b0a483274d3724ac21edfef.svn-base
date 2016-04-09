<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($GroupID=='-1') 添加用户组   #elseif($Edit=="true")编辑用户组 #else 查看用户组 #end</title>
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
				var validator = $("#fom").validate({
					onsubmit : false, 
					rules: {
						'groupName': {
							required: true,
							maxlength:40
						}
				},messages: {
					'groupName' : {
							required : "组名称不能为空!",
							maxlength:"组名称长度不超过40个字符"
					}
			},
			errorPlacement: $.handleError,
			success: $.handleSuccess,
			invalidHandler: $.invalidAlertHandler
			});
			
			$('#SaveGroup').click(function(){
				if (validator.form()) {
					var url = window.ctx+'/cms/group/addgroup.action';
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
			$('#UpdateGroup').click(function(){
				if (validator.form()) {
					var url = window.ctx+'/cms/group/modifygroup.do';
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
				<legend>#if($GroupID=='-1') 添加用户组  #elseif($Edit=="true") 编辑用户组  #else 查看用户组 #end</legend>
					<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">用户组名称 </td>
							<td class="pn-fcontent">
								<input type="hidden" name='id' value="$GroupID"/>
								#if($Edit=="true")
								<input name="groupName" class="text" id="groupName" type="text" value="$!{GroupInfo.groupName}"/>
								<em class="required">*</em>
								#else
								$!{GroupInfo.groupName}
								#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h"> 状态 </td>
							<td class="pn-fcontent">
							#if($Edit=="true")
								<select name="status" style="width:135px" id="status">
										<option value="0" #if($GroupInfo.status == "0")  selected="selected" #end> 禁用  </option>
										<option value="1" #if($GroupInfo.status == "1")  selected="selected" #end> 启用  </option>
								</select>
							 #else
								#if($GroupInfo.status == "0") 禁用 #else 启用   #end
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
    #if($GroupID=='-1')
    	<button type="button" id="SaveGroup" class="flatbutton">添加</button>
	#elseif($Edit=="true")
		<button type="button" id="UpdateGroup" class="flatbutton">更新</button>
	#end
		<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
    </td>
   </tr>
	</table>
	</form>
</body>
</html>
