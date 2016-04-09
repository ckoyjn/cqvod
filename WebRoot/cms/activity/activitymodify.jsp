<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($activityid=='-1') 新增活动 #elseif($Edit=="true")编辑活动
	#else 查看活动#end</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="this is my page" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css" />
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
		var validator = $("#fom")
				.validate(
						{
							onsubmit : false,
							rules : {
								'name' : {
									required : true,
									maxlength : 255
								},
								'status' : {
									required : true,
								},
								'identify' : {
									required : true,
									maxlength : 50
								},
								'rank' : {
									required : true,
									remote : {
										url : window.ctx
												+ '/cms/activity/updateCheckOrderby.action'
									},
									digits : true,
									max : 100,
									min : 0
								}
							},
							messages : {
								'name' : {
									required : "分类名称必填",
									maxlength : "分类名称长度不能超过255字符"
								},
								'status' : {
									required : "状态必选",
								},
								'identify' : {
									required : "分类描述必填",
									maxlength : "图片标识符不超过50字符"
								},
								'rank' : {
									required : "排序不能为空",
									digits : "排序必须为正整数",
									remote : '排序号重复',
									max : "排序必须为0-100的数字",
									min : "排序必须为0-100的数字"
								}

							},
							errorPlacement : $.handleError,
							success : $.handleSuccess,
							invalidHandler : $.invalidAlertHandler
						});

		$('#SaveActivity').click(
				function() {
					var url = window.ctx + '/cms/activity/checkOrderby.action';
					var data = $("#rank").val();
					$.get(url, {
						"rank" : data
					}, function(isRepeat) {
						if (isRepeat) {
							if (validator.form()) {
								var url = window.ctx
										+ '/cms/activity/addactivity.action';
								var data = $('#fom').serializeArray();
								$.post(url, data, function(feedback) {
									alert(feedback.message);
									if (feedback.successful) {
										window.dialogArguments.reloadPage();
										window.close();
									}
								});
							}
						} else {
							alert("排序号重复");
						}
					});

				});
		$('#UpdateActivity').click(function() {
			if (validator.form()) {
				var url = window.ctx + '/cms/activity/modifyactivity.action';
				var data = $('#fom').serializeArray();
				$.post(url, data, function(feedback) {
					alert(feedback.message);
					if (feedback.successful) {
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
	<form method="post" name="fom" id="fom">
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="2"
			style="border: 1px solid #cfcfcf; background: #ffffff;">
			<tr>
				<td colspan="2">
					<fieldset style="height: 100%;">
						<legend>#if($activityid=='-1') 新增活动
							#elseif($Edit=="true") 编辑活动 #else 查看活动 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px; font-weight: bold;">基本信息</font></td>
								<td class="pn-fcontent" colspan='3'></td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">活动名称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="name" class="text" id="name" type="text"
									value="$!{activity.name}" /> <em class="required">*</em> #else
									$!{activity.name} #end #if($activityid>0) <input type="hidden"
									name="id" value="$activityid" />#end
								</td>

								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="false")
									#if($activity.status==1) 上线 #else 下线 #end #else <select
									name="status" id="status">
										<option value="">==请选择==</option>
										<option value="1" #if($activity.status==1) selected #end>上线
										</option>
										<option value="0" #if($activity.status==0) selected #end>下线
										</option>
								</select> <em class="required">*</em> #end
								</td>
							</tr>

							<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">图片标识</td>
							<td class="pn-fcontent">#if($Edit=="true") <input
								name="identify" class="text" id="identify" type="text"
								value="$!{activity.identify}" /> <em class="required">*</em> #else
								$!{activity.identify} #end

							</td>

							<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
							<td class="pn-fcontent">#if($Edit=="true") <input
								name="rank" class="text" id="rank" type="text"
								value="$!{activity.rank}" /> <em class="required">*</em>
								#else $!{activity.rank} #end
							</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">
					#if($activityid=="-1")
					<button type="button" id="SaveActivity" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateActivity" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
