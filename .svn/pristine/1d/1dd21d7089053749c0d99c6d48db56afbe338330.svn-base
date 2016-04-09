<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($CardepkID=='-1') 添加计次卡批次 #elseif($Edit=="true")编辑影片
	#else 查看查看影片 #end</title>
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
						rules : {
							'epkName' : {
								required : true,
								maxlength:50
							},
							'type' : {
								required : true,
							},
							'epkDateEnd' : {
								required : true,
							},
							'epkPerval' : {
								required : true,
								digits:true,
								max : 999999,
							},
							'epkNum' : {
                                required : true,
                                number : true,
                                max : 999999,
                            },
							'epkRemark' : {
								maxlength:300,
                            }
							
						},
						messages : {
							'epkName' : {
								required : "观影码名称不能为空!",
								maxlength:"观影码名称不能超过50个字符"
							},
							'type' : {
								required : "卡号长度不能为空!"
							},
							'epkDateEnd' : {
								required : "失效时间不能为空!"
							},
							'epkPerval' : {
								required : "面值金额不能为空!",
								digits : "面值金额为整数!",
								max : "面值金额不能超过999999",
							},
							'epkNum' : {
                                required : "生成数量不能为空!",
                                max : "生成数量不能超过999999",
                            },
							'epkRemark' : {
								maxlength:"备注不能超过300个字符"
                            }

						},
						errorPlacement : $.handleError,
						success : $.handleSuccess,
						invalidHandler : $.invalidAlertHandler
					});

					$('#SaveCardEpk').click(
							function() {
								if (validator.form()) {
									var url = window.ctx
											+ '/cms/card/addCardepk.action';
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
						<legend>#if($CardepkID=='-1') 添加观影码批次
							#elseif($Edit=="true") 编辑影片 #else 查看影片 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
							
							<td width="10%" class="pn-flabel pn-flabel-h">观影码名称</td>
                                <td class="pn-fcontent">#if($Edit=="true") <input name="epkName"
                                    class="text" id="epkName" type="text" value="" /> <em
                                    class="required">*</em> #else $!{MovieInfo.identify} #end</td>
							
								<td width="10%" class="pn-flabel pn-flabel-h">卡号长度</td>
								<td class="pn-fcontent"><select name="type"
									id="type">
										<option value="">==请选择==</option>
										<option value="0">8</option>
										<option value="1">10</option>
								</select> <em class="required">*</em></td>
							</tr>
							
							
							
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">失效时间</td>
								<td class="pn-fcontent"> <input type="text" id="epkDateEnd"
									name="epkDateEnd" value="$!{epkDateEnd}" style="width: 100px"
									readonly="readonly" onclick="WdatePicker({minDate:'%y-%M-%d}'})" class="Wdate" />
									<em class="required">*</em>
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">面值金额</td>
                                <td class="pn-fcontent"> #if($Edit=="true") <input name="epkPerval"
                                    class="text" id="epkPerval" maxlength="11" type="text" value="" />(元) <em
                                    class="required">*</em> #else $!{MovieInfo.identify} #end</td>
							</tr>

							<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">生成数量</td>
                                <td class="pn-fcontent"> #if($Edit=="true") <input name="epkNum"
                                    class="text" id="epkNum" type="text" value=""
                                    onkeyup="value=value.replace(/[^(\d)]/g,'')" /> <em
                                    class="required">*</em> #else $!{MovieInfo.identify} #end</td>

								<td width="10%" class="pn-flabel pn-flabel-h">备注</td>
								<td class="pn-fcontent"><input type="hidden" name='idq'
									value="$CardepkID" /> #if($Edit=="true") <textarea rows="3"
										cols="17" class="text" id="epkRemark" type="text"
										name="epkRemark"></textarea> #else
									$!{MovieInfo.identify} #end</td>
							</tr>


						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($CardepkID=='-1')
					<button type="button" id="SaveCardEpk" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateMovie" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
