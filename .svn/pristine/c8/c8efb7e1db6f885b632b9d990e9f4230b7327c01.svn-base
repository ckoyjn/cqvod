<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($MorespecialID=='-1') 新增专题 #elseif($Edit=="true")编辑专题
	#else 查看专题#end</title>
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

				$('#SaveMorespecial').click(
						function() {
							if (validator.form()) {
								var url = window.ctx
										+ '/cms/morespecial/addmorespecial.action';
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
				
				
				$('#UpdateMorespecial')
						.click(
								function() {
									if (validator.form()) {
										var url = window.ctx
												+ '/cms/morespecial/modifymorespecial.action';
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
						<legend>#if($MorespecialID=='-1') 新增专题 #elseif($Edit=="true")
							编辑专题 #else 查看专题 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px; font-weight: bold;">基本信息</font></td>
								<td class="pn-fcontent" colspan='3'></td>
							</tr>
							<tr>
								<input type="hidden" value="$!{MorespecialInfo.specialnames}"  id="id"/>
								<td width="10%" class="pn-flabel pn-flabel-h">专题名称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="specialNames" class="text" id="specialNames" type="text"
									value="$!{MorespecialInfo.specialNames}" /> <em class="required">*</em> #else
									$!{MorespecialInfo.specialNames} #end
								</td>

								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="status" id="status">
										<option value="">==请选择==</option>
										<option value="1" #if($MorespecialInfo.status==1) selected #end>上线
										</option>
										<option value="0" #if($MorespecialInfo.status==0) selected #end>下线
										</option>
								</select> <em class="required">*</em>#else #if($MorespecialInfo.status==1) 上线
									#else 下线 #end #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">图片标识</td>
								<td class="pn-fcontent" colspan="3">#if($Edit=="true") <input
									name="identify" class="text" id="identify" type="text"
									value="$!{MorespecialInfo.identify}" /> <em class="required">*</em>
									#else $!{MorespecialInfo.identify} #end
								</td>
							</tr>

							<!-- <tr>
								<td width="10%" class="pn-flabel pn-flabel-h">关联的影片</td>
								<td class="pn-fcontent" colspan='3'>#if($Edit=="true") <select
									size="20" multiple="multiple" ondblclick="leftcolumNname()"
									style="width: 200px; border: 1px solid #D2D8DB; height: 200px; margin-top: 10px;"
									id="leftcolumNname"> #foreach($c in $movies)
										<option value="$!{c.id}">$!{c.Name}</option> #end
								</select>
									<div
										style="margin-left: 280px; position: absolute; margin-top: -200px;">
										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="border-radius:5px;font-size: 11px;padding:5px;"
												type="button" id="leftBut" onclick="leftBut()" value="右移">
										</div>

										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="border-radius:5px;font-size: 11px;padding:5px;"
												type="button" id="leftAlltBut" onclick="leftAlltBut()"
												value="全右移">
										</div>

										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="border-radius:5px;font-size: 11px;padding:5px;"
												type="button" id="rightBut" onclick="rightBut()"
												value="左移">
										</div>

										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="border-radius:5px;font-size: 11px;padding:5px;"
												type="button" id="rightAllBut" onclick="rightAllBut()"
												value="全左移">
										</div>
									</div>
									<div style="margin-left: 400px; margin-top: -200px;">
										<select size="20"
											style="width: 200PX; border: 1px solid #D2D8DB; height: 200px;"
											id="rightcolumNname" ondblclick="rightcolumNname()"
											name="rightcolumNname" multiple="multiple">
									</div> </select> #else $!{MorespecialInfo.movieNames} #end
								</td>
							</tr> -->
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($MorespecialID=='-1')
					<button type="button" id="SaveMorespecial" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateMorespecial" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
				#if($MorespecialID>0) <input type="hidden"
									name="id" value="$MorespecialID" />#end
			</tr>
		</table>
		<!-- <input
			type="hidden" name="id" value="$!{MorespecialInfo.id}" /> -->
	</form>

</body>
</html>
