<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($RecommendID=='-1') 新增特别推荐节目
	#elseif($Edit=="true")编辑特别推荐节目 #else 查看特别推荐节目 #end</title>
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
<script type="text/javascript" src="${ctx}/static/js/jquery-form.js"></script>
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
				'name' : {
					required : true,
					maxlength : 40
				},
				'status' : {
					required : true,
				},
				'desc' : {
					maxlength : 255
				},
				'objecttype' : {
					required : true,
				},
				'identify' : {
					required : true,
					maxlength : 20,
				}
			},
			messages : {

				'name' : {
					required : "推荐名称不能为空!",
					maxlength : "推荐名称不能超过40个字符!"
				},
				'status' : {
					required : "请选择状态!"
				},
				'desc' : {
					maxlength : "附加内容不能超过255个字符!"
				},
				'objecttype' : {
					required : "请选择类型！"
				},
				'identify' : {
					required : "图片标识不能为空",
					maxlength : "图片标识长度不能超过20个字符",
				},
			},
			errorPlacement : $.handleError,
			success : $.handleSuccess,
			invalidHandler : $.invalidAlertHandler
		});

		$('#SaveRecommend').click(function() {
			if (validator.form()) {
				var url = window.ctx + '/cms/recommend/addrecommend.action';
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
		$('#UpdateRecommend').click(function() {
			if (validator.form()) {
				var url = window.ctx + '/cms/recommend/modifyrecommend.action';
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

		$("#objecttype").change(
				function() {
					var data = {
						ObjectType : $('#objecttype').val()
					};
					//$("#objectid").empty();
					$.ajax({
						async : false,
						type : "POST",
						dataType : "json",
						data : data,
						url : window.ctx
								+ "/cms/recommend/findobjectnamebytype.action",
						success : function(data) {
							var list = data.objectlist;
							if (list.length > 0) {
								var html = "";
								for (var i = 0; i < list.length; i++) {
									html += "<option value="+list[i].id+">"
											+ list[i].name + "</option>";
									$("#objectid").html(html);
								}
							}
						}
					});

					var url = window.ctx
							+ '/cms/recommend/findobjectIdentify.action';
					var data1 = $('#fom').serializeArray();
					$.post(url, data1, function(feedback) {
						$("#identify").val(feedback.message);
					});
				});
		$("#objectid").change(function() {
			$("#identify").val('');
			$("#name").val(this.options[this.selectedIndex].text);
			var url = window.ctx + '/cms/recommend/findobjectIdentify.action';
			var data = $('#fom').serializeArray();
			$.post(url, data, function(feedback) {
				$("#identify").val(feedback.message);
			});
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
						<legend>#if($RecommendID=='-1') 新增特别推荐节目
							#elseif($Edit=="true") 编辑特别推荐节目 #else 查看特别推荐节目 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">

							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">推荐名称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="name" class="text" id="name" type="text"
									style="width: 150px;" value="$!{rec.name}" /> <em
									class="required">*</em> #else $!{rec.name} #end
								</td>

								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="status" id="status">
										<option value="">==请选择==</option>
										<option value="0" #if($!{rec.status}==0) selected #end>下线</option>
										<option value="1" #if($!{rec.status}==1) selected #end>上线</option>
								</select> <em class="required">*</em> #else #if($!{rec.status}==1) 上线
									#else 下线 #end #end
								</td>

							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">推荐类型</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="objecttype" id="objecttype">
										<option value="">==请选择影片==</option>
										<option value="0" #if($!{rec.objecttype}== '0') selected #end>电影</option>
										<option value="1" #if($!{rec.objecttype}== '1') selected #end>专题</option>
								</select> <em class="required">*</em> #else #if($!{rec.objecttype}==0) 电影
									#else 专题#end #end
								</td>

								<td width="10%" class="pn-flabel pn-flabel-h">图片标识</td>
								<td class="pn-fcontent"><input name="identify" class="text"
									id="identify" type="text" style="width: 150px;"
									value="$!{rec.Identify}" /> <em class="required">*</em></td>

							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">内容</td>
								<td class="pn-fcontent" colspan="3">#if($Edit=="true") <select
									name="objectid" id="objectid">
										#if($!{rec.objecttype}=='0') #foreach ($m in $movies)
										<option value="$!{m.id}" #if($!{rec.objectid}==$!{m.id})
											selected #end>$!{m.Name}</option> #end #else #foreach ($m in
										$specils)
										<option value="$!{m.id}" #if($!{rec.objectid}==$!{m.id})
											selected #end>$!{m.name}</option> #end #end
								</select> <em class="required">*</em> #else $!{rec.objectName} #end

								</td>
							</tr>

							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">附加内容</td>
								<td class="pn-fcontent" colspan='3'>#if($Edit=="true") <textarea
										name="desc" id="desc" width="80%" rows="4" cols="80">$!{rec.desc}</textarea>
									#else $!{rec.desc} #end
								</td>
							</tr>

						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($RecommendID=='-1')
					<button type="button" id="SaveRecommend" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateRecommend" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="RecommendID" value="${RecommendID}" />
	</form>
</body>
</html>
