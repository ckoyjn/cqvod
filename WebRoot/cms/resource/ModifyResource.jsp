<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($ResourceID=='-1')添加资源 #elseif($Edit=="true")编辑资源#else查看资源 #end</title>
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
					rules: {
						'resourcename': {
							required: true,
							maxlength: 40,
						}, 
						'resourcedesc': {
							required: true,
							maxlength : 255,
						}, 
						'parentId': {
							required: true,
						},
						'action' : {
							maxlength :200,
						},
						'sort' : {
							digits : true,
							max : 100,
						}
				},messages: {
					'resourcename' : {
							required : "资源名称不能为空!",
							maxlength : "资源名称长度不能超过40个字符",
					},
					'resourcedesc' : {
							required : "资源描述不能为空!",
							maxlength : "资源描述长度不能超过255个字符",
					},
					'parentId' : {
							required : "所属菜单不能为空!",
							maxlength : "",
					},
					'action' : {
						maxlength : "资源地址长度不能超过200个字符",
					},
					'sort' : {
						digits : "排序必须为整数",
						max : "排序不能大于100",
					}
			},
			errorPlacement: $.handleError,
			success: $.handleSuccess,
			invalidHandler: $.invalidAlertHandler
			});
			
			$('#SaveResource').click(function(){
				if (addvalidator.form()) {
					var url = window.ctx+'/cms/resource/addresource.action';
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
			$('#UpdateResource').click(function(){
				if (addvalidator.form()) {
					var url = window.ctx+'/cms/resource/modifyresource.action';
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

<body class="ContentBody"  onload="showCity('provin','city','$proId','$cityId');">
	<form method="post"  name="fom" id="fom">
	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" style="border:1px solid #cfcfcf;background:#ffffff;">
    <tr>
      <td colspan="2">
      	<fieldset style="height:100%;">
				<legend>#if($ResourceID=='-1')添加资源#elseif($Edit=="true")编辑资源#else查看资源 #end</legend>
					<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">资源名称</td>
							<td class="pn-fcontent">
								<input type="hidden" name='resourceId' value="$ResourceID"/>
								#if($Edit=="true")
								<input name="resourcename" class="text" id="resourcename" type="text" value="$!{ResourceInfo.resourcename}"/>
								<em class="required">*</em>
								#else
								$!{ResourceInfo.resourcename}
								#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">资源描述</td>
							<td class="pn-fcontent">
							#if($Edit=="true")
								<input name="resourcedesc" class="text" id="resourcedesc" type="text" value="$!{ResourceInfo.resourcedesc}"/>
								<em class="required">*</em>
								#else
								$!{ResourceInfo.resourcedesc}
								#end 
							</td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">资源地址</td>
							<td class="pn-fcontent" colspan='3'>
							#if($Edit=="true")
								<input name="action" style='width:80%' id="action" type="text" value="$!{ResourceInfo.action}"/>
							#else
								$!{ResourceInfo.action}
							#end 
							</td>
						</tr>
						
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">所属菜单</td>
							<td class="pn-fcontent">
							#if($Edit=="true")
								<select name="parentId" id="parentId">
                					<option value="0">==请选择==</option>
									#foreach($p in $!parents)
                                        <option value="$!p.id" #if($!ResourceInfo.parentId==$!p.id) selected  #end>$!p.resourcename</option>
                					#end
                                </select>
                                <em class="required">*</em>
                            #else
								$!{ResourceInfo.parentName}
							#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
							<td class="pn-fcontent">
							#if($Edit=="true")
								<input type="text" name="sort" value="$!{ResourceInfo.sort}"/>
							#else
								$!{ResourceInfo.sort}
							#end 
							</td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
							<td class="pn-fcontent">
							#if($Edit=="true")
								<select name="status" style="width:135px" id="status">
										<option value="0" #if($!{ResourceInfo.status} == 0) selected #end>禁用</option>
										<option value="1" #if($!{ResourceInfo.status} == 1) selected #end>启用</option>
								</select>
							 #else
								#if($!{ResourceInfo.status} == 0) 禁用  #else 启用  #end
							#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">注册时间</td>
							<td class="pn-fcontent">
							#if($Edit=="true")
								<input type="text" value="$!{ResourceInfo.createtime}" disabled='disabled'/>
							#else
								$!{ResourceInfo.createtime}
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
    #if($ResourceID=='-1')
    	<button type="button" id="SaveResource" class="flatbutton">保存</button>
	#elseif($Edit=="true")
		<button type="button" id="UpdateResource" class="flatbutton">更新</button>
	#end
		<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
    </td>
   </tr>
	</table>
	</form>
</body>
</html>
