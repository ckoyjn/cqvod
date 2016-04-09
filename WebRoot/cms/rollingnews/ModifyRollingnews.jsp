<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($RollingnewsId=='-1') 新增滚动信息 #elseif($Edit=="true")编辑滚动信息
	#else 查看滚动信息#end</title>
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
							'name' : {
								required : true,
								maxlength : 20
							},
							'status' : {
								required : true,
							},
							'identify' : {
								required : true,
								maxlength : 20
							}
						},
						messages : {
							'name' : {
								required : "专题名称必填",
								maxlength : "专题名称长度不能超过20字符"
							},
							'status' : {
								required : "状态必选",
							},
							'identify' : {
								required : "图片标识必填",
								maxlength : "图片标识不能超过20字符"
							}

						},
						errorPlacement : $.handleError,
						success : $.handleSuccess,
						invalidHandler : $.invalidAlertHandler
					});

					$('#SaveRollingnews')
							.click(
									function() {
										if (validator.form()) {
											var url = window.ctx
													+ '/cms/rollingnews/addrollingnews.action';
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
					$('#UpdateRollingnews')
							.click(
									function() {
										if (validator.form()) {
											var url = window.ctx
													+ '/cms/rollingnews/modifyrollingnews.action';
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
						<legend>#if($RollingnewsId=='-1') 新增滚动信息 #elseif($Edit=="true")
							编辑滚动信息 #else 查看滚动信息 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px; font-weight: bold;">滚动信息</font></td>
								<td class="pn-fcontent" colspan='3'></td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">内容</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="content" class="text" id="content" type="text"
									value="$!{rollingnews.content}" /> <em class="required">*</em> #else
									$!{rollingnews.content} #end
								</td>

								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="status" id="status">
										<option value="">==请选择==</option>
										<option value="1" #if($rollingnews.status==1) selected #end>启用
										</option>
										<option value="0" #if($rollingnews.status==0) selected #end>禁用
										</option>
								</select> <em class="required">*</em>#else #if($rollingnews.status==1) 启用
									#else 禁用 #end #end
								</td>
							</tr>

							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
								#if($RollingnewsId>0) <input type="hidden"
									name="id" value="$RollingnewsId" />#end
								<td class="pn-fcontent" colspan="3">#if($Edit=="true") <input
									name="sort" class="text" id="sort" type="text"
									value="$!{rollingnews.sort}" /> 
									<!-- #if($RollingnewsId>0) <input type="hidden"
									name="id" value="$RollingnewsId" />#end -->
									<em class="required">*</em>
									#else $!{rollingnews.sort} #end    
								</td>
							</tr>

						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($RollingnewsId=='-1')
					<button type="button" id="SaveRollingnews" class="flatbutton">新增</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateRollingnews" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
