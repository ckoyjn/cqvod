<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($UserId=='-1')添加用户
	#elseif($Edit=="true")编辑用户  #else查看用户 #end</title>
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
					var addvalidator;
						addvalidator = $("#fom").validate(
								{
									rules : {
										'loginName' : {
											required : true,
											maxlength : 40,
										},
										'nickName' : {
											required : true,
											maxlength : 40,
										},
										'password' : {
											required : true,
											maxlength : 40,
										},
										'phone' : {
											required : true,
											maxlength : 20,
										},
										'provin' : {
											required : true
										},
										'city' : {
											required : true
										}
									},
									messages : {
										'loginName' : {
											required : "登录账号不能为空!",
											maxlength : "登录账号长度不能超过40个字符",
										},
										'nickName' : {
											required : "用户昵称不能为空!",
											maxlength : "用户昵称长度不能超过40个字符",
										},
										'password' : {
											required : "密码不能为空!",
											maxlength : "密码长度不能超过40个字符",
										},
										'phone' : {
											required : "联系电话不能为空!",
											maxlength : "联系电话长度不能超过20个字符",
										},
										'provin' : {
											required : "所在地区不能为空!"
										},
										'city' : {
											required : "所在地区不能为空!"
										}
									},
							errorPlacement : $.handleError,
							success : $.handleSuccess,
							invalidHandler : $.invalidAlertHandler
						});
					$('#SaveUser').click(function() {
						alert(document.getElementById("ID").value);
						if($("#loginName").val().length>20 | $("#nickName").val().length>20){
							alert("登录账号或昵称长度超过20个字符");
						} else if(!/^[a-zA-Z0-9]*$/.test($("#loginName").val())){
							alert("登录账号不能包含空格和特殊字符");
						}else{
							if (addvalidator.form()) {
								var url = window.ctx
										+ '/cms/user/adduser.action';
								var data = $('#fom')
										.serializeArray();
								$.post(
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
						}
					});
					$('#UpdateUser').click(function() {
							if($("#loginName").val().length>20 | $("#nickName").val().length>20){
								alert("用户ID或昵称长度超过20个字符");
							}else{
								if (addvalidator.form()) {
									var url = window.ctx
											+ '/cms/user/modifyuser.action';
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

								/* if (updatevalidator.form()) {
									var url = window.ctx
											+ '/cms/user/modifyuser.do';
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
									} */
								}
							});
				});
				function changeCity(obj, cid) {
					if (obj.value == '') {
						jQuery('#' + cid + ' option').remove();
						jQuery('#' + cid)
								.append(
										"<option value=''>=\u8bf7\u9009\u62e9=</option>");
						return;
					}
					jQuery.get(
									window.ctx
											+ "/cms/user/changeCity.action?proId="
											+ obj.value,
									"",
									function(res) {
										if (res == null) {
											return;
										}
										jQuery('#' + cid + ' option').remove();
										jQuery('#' + cid)
												.append(
														"<option value=''>=\u8bf7\u9009\u62e9=</option>");
										for ( var c in res) {
											jQuery("#" + cid).append(
													"<option value='"
							+ res[c].areacode + "'>"
															+ res[c].name
															+ "</option>");
										}
									});
					return false;
				}
				
			</script>
</head>

<body class="ContentBody"
	onload="showCity('provin','city','$proId','$cityId');">
	<input type="hidden" id="userid" value="$UserId"/>
	<form method="post" name="fom" id="fom">
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="2"
			style="border: 1px solid #cfcfcf; background: #ffffff;">
			<tr>
				<td colspan="2">
					<fieldset style="height: 100%;">
						<legend>#if($UserId=='-1')添加用户
							#elseif($Edit=="true")编辑用户#else查看用户 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
							#if($UserId=='-1')
							<input name="ID" class="text" id="ID" type="hidden" value="0" />
							#elseif($Edit=="true")
							<input name="ID" class="text" id="ID" type="hidden" value="$!{UserInfo.ID}" />
							#end
								<td width="10%" class="pn-flabel pn-flabel-h">登录账号</td>
								<td class="pn-fcontent">
									<!-- 
								<input type="hidden" name='iD' value="$UserId"/>
								#if($Edit=="true")
								<input name="loginName" class="text" id="loginName" type="text" value="$!{UserInfo.loginName}"/>
								<em class="required">*</em>
								#else
								$!{UserInfo.loginName}
								#end 
								 --> <input type="hidden" name='userID' value="$UserId" />
									#if($Edit=="false") $!{UserInfo.loginName}
									#elseif($UserId=='-1') <input name="loginName" class="text"
									id="loginName" type="text" value="$!{UserInfo.loginName}" /> <em
									class="required">*</em> #else <input name="loginName"
									class="text" id="loginName" type="text"
									value="$!{UserInfo.loginName}" readonly="readonly" /> <em
									class="required">*</em> #end

								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">密码</td>
								<td class="pn-fcontent">#if($Edit=="false") ******
									#elseif($UserId=='-1') <input name="password" type="password"
									value="" id="password" /> <em class="required">*</em> #else <input
									name="tmp_pass" type="password" value="******" disabled /> <em
									class="required">*</em> #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">用户昵称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="nickName" class="text" id="nickName" type="text"
									value="$!{UserInfo.nickName}" /> <em class="required">*</em>
									#else $!{UserInfo.nickName} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">联系电话</td>
								<td class="pn-fcontent">#if($Edit=="true") 
								<!--input
									name="phone" class="text" id="phone" type="text"
									value="$!{UserInfo.phone}" onchange="checkPhoneNum(this)" /--> 
								<input
									name="phone" class="text" id="phone" type="text"
									value="$!{UserInfo.phone}" /> 
									<em class="required">*</em> #else $!{UserInfo.phone} #end
								</td>
							</tr>

							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">所在地区</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="provin" id="provin" onchange="changeCity(this,'city');">
										<option value="-1">==请选择==</option> #foreach($p in $!provins)
										<option value="$!p.id">$!p.name</option> #end
								</select> <select name="city" id="city"> #foreach($c in $!citys)
										<option value="$!c.areacode">$!c.name</option> #end
								</select><em class="required">*</em> #else $!{UserInfo.cityName} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="status" style="width: 135px" id="status">
										<option value="0" #if($!{UserInfo.status} == 0) selected #end>禁用</option>
										<option value="1" #if($!{UserInfo.status} == 1) selected #end>启用</option>
								</select> #else #if($!{UserInfo.status} == 0) 禁用 #else 启用 #end #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">所属用户组</td>

								<td class="pn-fcontent">#if($Edit=="true") <!--  <input type="text" value="$!{UserInfo.groupName}"disabled='disabled'/>-->
									<select name="groupID" id="groupID" style="width: 135px">
										<option value="-1">==请选择==</option> #foreach($g in
										$groups)
										<option value="$!g.id" #if($!{UserInfo.groupID} ==
											$!g.id) selected #end>$!g.groupName</option> #end
								</select> #else <select name="groupdd" id="groupdd" style="width: 135px"
									disabled="disabled">
										<option value="-1">==请选择==</option> #foreach($g in
										$groups)
										<option value="$!g.id" #if($!{UserInfo.groupID} ==
											$!g.id) selected #end>$!g.groupName</option> #end
								</select> #end
								</td>


								<td width="10%" class="pn-flabel pn-flabel-h">注册时间</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									type="text" value="$!{UserInfo.createTime}" disabled='disabled' />
									#else $!{UserInfo.createTime} #end
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($UserId=='-1')
					<button type="button" id="SaveUser" class="flatbutton">保存</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateUser" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
