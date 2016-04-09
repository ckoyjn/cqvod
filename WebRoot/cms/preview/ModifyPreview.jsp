<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($PreviewID=='-1') 添加片花 #elseif($Edit=="true")编辑片花
	#else 查看片花 #end</title>
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
			<script type="text/javascript"
				src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
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
							'identify' : {
								required : true,
								number : true,
								maxlength : 20,
							},
							'rank' : {
								required : true,
								digits:true,
								max : 100,
								min : 0
							},
							'name' : {
								required : true,
								maxlength : 14,
							},
							'mediaID' : {
								required : true,
								maxlength : 128,
							},
							'director' : {
								maxlength : 20,
							},
							'actor' : {
								maxlength : 128,
							},
						},
						messages : {
							'identify' : {
								required : "片花ID不能为空!",
								number : "片花ID必须为数字",
								maxlength : "片花ID长度不能超过20个字符",
							},
							'rank' : {
								required : "排序不能为空!",
								digits : "排序必须为整数!",
								max : "排序必须为0-100的数字",
                                min : "排序必须为0-100的数字"
							},
							'name' : {
								required : "影片名称不能为空!",
								maxlength : "影片名称长度不能超过14个字符",
							},
							'mediaID' : {
								required : "内部ID不能为空!",
								maxlength : "内部ID长度不能超过128个字符",
							},
							'director' : {
								maxlength : "导演长度不超过20个字符",
							},
							'actor' : {
								maxlength : "主演长度不超过128个字符",
							},

						},
						errorPlacement : $.handleError,
						success : $.handleSuccess,
						invalidHandler : $.invalidAlertHandler
					});

					$('#SavePreview').click(
							function() {
								if (validator.form()) {
									var url = window.ctx
											+ '/cms/preview/addpreview.action';
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
					$('#UpdatePreview')
							.click(
									function() {
										if (validator.form()) {
											var url = window.ctx
													+ '/cms/preview/modifypreview.action';
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
						<legend>#if($PreviewID=='-1') 添加片花 #elseif($Edit=="true")
							编辑片花 #else 查看片花 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">片花ID</td>
								<td class="pn-fcontent"><input type="hidden" name='id'
									value="$PreviewID" /> #if($Edit=="true") <input name="identify"
									class="text" id="identify" type="text"
									value="$!{PreviewInfo.identify}" /> <em class="required">*</em>
									#else $!{PreviewInfo.identify} #end</td>
								<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="rank" class="text" id="rank" type="text"
									value="$!{PreviewInfo.rank}" /> <em class="required">*</em>
									#else $!{PreviewInfo.rank} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">影片名称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="name" class="text" id="name" type="text"
									value="$!{PreviewInfo.name}" /> <em class="required">*</em>
									#else $!{PreviewInfo.name} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">内部ID</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="mediaID" class="text" id="mediaID" type="text"
									value="$!{PreviewInfo.mediaID}" /> <em class="required">*</em>
									#else $!{PreviewInfo.mediaID} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">导演</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="director" class="text" id="director" type="text"
									value="$!{PreviewInfo.director}" /> #else
									$!{PreviewInfo.director} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">主演</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="actor" class="text" id="actor" type="text"
									value="$!{PreviewInfo.actor}" /> #else $!{PreviewInfo.actor}
									#end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">上映时间</td>
								<td class="pn-fcontent" colspan='3'>#if($Edit=="true") <input
									type="text" id="castTime" name="castTime"
									value="$!{PreviewInfo.castTime}" style="width: 230px"
									readonly="readonly"
									onclick="WdatePicker({dateFmt:'yyyy年MM月dd日'})" class="Wdate" />
									#else $!{PreviewInfo.castTime} #end
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($PreviewID=='-1')
					<button type="button" id="SavePreview" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdatePreview" class="flatbutton">更新</button>
					#end
					<button type="button" onclick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
