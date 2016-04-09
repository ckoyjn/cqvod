<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($specialid=='-1') 新增专题 #elseif($Edit=="true")编辑专题
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

					$('#SaveSpecial')
							.click(
									function() {
										if (validator.form()) {
											var movieIDs = [];
											var movieNames = [];
											if ($("#rightcolumNname option").length == 0) {
												alert("请选择要关联的影片")
												return false;
											}
											$("#rightcolumNname option").each(
													function() {
														movieIDs.push($(this)
																.val());
														movieNames.push($(this)
																.text());
													});
											$("#movieIDs").val(movieIDs);
											$("#movieNames").val(movieNames);
											var url = window.ctx
													+ '/cms/special/addspecial.action';
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
					$('#UpdateSpecial')
							.click(
									function() {
										if (validator.form()) {
											var movieIDs = [];
											var movieNames = [];
											if ($("#rightcolumNname option").length == 0) {
												alert("请选择要关联的影片")
												return false;
											}
											$("#rightcolumNname option").each(
													function() {
														movieIDs.push($(this)
																.val());
														movieNames.push($(this)
																.text());
													});
											$("#movieIDs").val(movieIDs);
											$("#movieNames").val(movieNames);

											var url = window.ctx
													+ '/cms/special/modifyspecial.action';
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
					//选中的从左移到右
					$("#leftBut")
							.click(
									function() {
										var leftElement = document
												.getElementById("leftcolumNname");
										var optionElements = leftElement
												.getElementsByTagName("option");
										var len = optionElements.length;
										var rightElement = document
												.getElementById("rightcolumNname");
										for (var i = 0; i < len; i++) {
											var option = optionElements[i];
											if (leftElement.selectedIndex != -1) {
												rightElement
														.appendChild(optionElements[leftElement.selectedIndex]);
											}
										}
									});
					//全部从左移到右
					$("#leftAlltBut").click(
							function() {
								var leftoptions = document
										.getElementById("leftcolumNname");
								var len = leftoptions.length;
								var right = document
										.getElementById("rightcolumNname");
								for (var i = 0; i < len; i++) {
									right.appendChild(leftoptions[0]);
								}
							});
					//选中从右移到左	
					$("#rightBut")
							.click(
									function() {
										var rightElement = document
												.getElementById("rightcolumNname");
										var optionElements = rightElement
												.getElementsByTagName("option");
										var len = optionElements.length;
										var leftElement = document
												.getElementById("leftcolumNname");
										for (var i = 0; i < len; i++) {
											var option = optionElements[i];
											if (rightElement.selectedIndex != -1) {
												leftElement
														.appendChild(optionElements[rightElement.selectedIndex]);
											}
										}
									});

					//全部从右移到左
					$("#rightAllBut").click(
							function() {
								var rightoptions = document
										.getElementById("rightcolumNname");
								var len = rightoptions.length;
								var filmName = document
										.getElementById("leftcolumNname");
								for (var i = 0; i < len; i++) {
									filmName.appendChild(rightoptions[0]);
								}
							});
					//双击从左移到右
					$("#leftcolumNname")
							.dblclick(
									function() {
										var leftElement = document
												.getElementById("leftcolumNname");
										var optionElements = leftElement
												.getElementsByTagName("option");
										var right = document
												.getElementById("rightcolumNname");
										for (var i = 0; i < optionElements.length; i++) {
											right
													.appendChild(optionElements[leftElement.selectedIndex]);
										}
									});

					//双击从右移到左
					$("#rightcolumNname")
							.dblclick(
									function() {
										var rightElement = document
												.getElementById("rightcolumNname");
										var optionElements = rightElement
												.getElementsByTagName("option");
										var filmName = document
												.getElementById("leftcolumNname");
										for (var i = 0; i < optionElements.length; i++) {
											filmName
													.appendChild(optionElements[rightElement.selectedIndex]);
										}
									});

					if ('$!{special.movieIDs}' != '') {
						var movieIDs = '$!{special.movieIDs}';
						var IDs = [];
						IDs = movieIDs.split(",");
						for (i = 0; i < IDs.length; i++) {
							$("#leftcolumNname option").each(function() {
								if (IDs[i] == $(this).val()) {
									$(this).remove();
									$("#rightcolumNname").append($(this));
								}
							});
						}

					}
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
						<legend>#if($specialid=='-1') 新增专题 #elseif($Edit=="true")
							编辑专题 #else 查看专题 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h"><font
									style="font-size: 15px; font-weight: bold;">基本信息</font></td>
								<td class="pn-fcontent" colspan='3'></td>
							</tr>
							<tr>
								<input type="hidden" value="$!{special.name}"  id="id"/>
								<td width="10%" class="pn-flabel pn-flabel-h">专题名称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="name" class="text" id="name" type="text"
									value="$!{special.name}" /> <em class="required">*</em> #else
									$!{special.name} #end
								</td>

								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="status" id="status">
										<option value="">==请选择==</option>
										<option value="1" #if($special.status==1) selected #end>上线
										</option>
										<option value="0" #if($special.status==0) selected #end>下线
										</option>
								</select> <em class="required">*</em>#else #if($special.status==1) 上线
									#else 下线 #end #end
								</td>
							</tr>

							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">图片标识</td>
								<td class="pn-fcontent" colspan="3">#if($Edit=="true") <input
									name="identify" class="text" id="identify" type="text"
									value="$!{special.identify}" /> <em class="required">*</em>
									#else $!{special.identify} #end
								</td>
							</tr>

							<tr>
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
												style="letter-spacing: 5px; width: 50px; cursor: pointer; font-size: 11px;"
												type="button" id="leftBut" onclick="leftBut()" value="右移">
										</div>

										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="letter-spacing: 5px; width: 50px; cursor: pointer; font-size: 11px;"
												type="button" id="leftAlltBut" onclick="leftAlltBut()"
												value="全右移">
										</div>

										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="letter-spacing: 5px; width: 50px; cursor: pointer; font-size: 11px;"
												type="button" id="rightBut" onclick="rightBut()"
												value="左移">
										</div>

										<div style="margin: 5px 20px 20px 0px;">
											<input
												style="letter-spacing: 5px; width: 50px; cursor: pointer; font-size: 11px;"
												type="button" id="rightAllBut" onclick="rightAllBut()"
												value="全左移">
										</div>
									</div>
									<div style="margin-left: 400px; margin-top: -200px;">
										<select size="20"
											style="width: 200PX; border: 1px solid #D2D8DB; height: 200px;"
											id="rightcolumNname" ondblclick="rightcolumNname()"
											name="rightcolumNname" multiple="multiple">
									</div> </select> #else $!{special.movieNames} #end
								</td>
							</tr>


						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($specialid=='-1')
					<button type="button" id="SaveSpecial" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateSpecial" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="movieIDs" id="movieIDs" value="" /> <input
			type="hidden" name="movieNames" id="movieNames" value="" /> <input
			type="hidden" name="id" value="$!{special.id}" />
	</form>

</body>
</html>
