<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($InjectID=='-1') 添加注入 #elseif($Edit=="true")编辑注入
	#else 查看注入 #end</title>
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
		$('.videotype').click(function(e) {
			var type = $(this).val();
			$('.injectselect').css('display', 'none');
			if (type == 1) {
				$('#movieselect').css('display', 'inline');
			} else {
				$('#previewselect').css('display', 'inline');
			}
		});
		var validator = $("#fom").validate({
			onsubmit : false,
			rules : {
				'filetype' : {
					required : true,
					maxlength : 40
				},
				'url' : {
					required : true,
					maxlength : 255,
				}

			},
			messages : {
				'filetype' : {
					required : "文件类型不能为空!",
					maxlength : "文件类型长度不超过40个字符"
				},
				'url' : {
					required : "源地址不能为空!",
					maxlength : "源地址长度不超过255个字符"
				}
			},
			errorPlacement : $.handleError,
			success : $.handleSuccess,
			invalidHandler : $.invalidAlertHandler
		});

		$('#SaveInject').click(
				function() {
					if ($("#movieid option:selected").val() == -1
							&& $("#previewid option:selected").val() == -1) {
						alert("请选择名称");
					} else {
						if (validator.form()) {
							var url = window.ctx
									+ '/cms/inject/addinject.action';
							var data = $('#fom').serializeArray();
							$("#loading").show();
							$.post(url, data, function(feedback) {
								$("#loading").hide();
								alert(feedback.message);
								if (feedback.successful) {
									window.opener.location.reload();
									window.close();
								}

							});
						}
					}
				});
		$('#previewid').change(
				function() {
					$('#previewname').val(
							$("#previewid  option:selected").text());
					$('#preview').val(
							$("#previewid  option:selected").attr("preview"));
				});
		$('#movieid').change(function() {
			$('#moviename').val($("#movieid  option:selected").text());
			$('#movie').val($("#movieid  option:selected").attr("movie"));
		});
		$('#UpdateInject').click(function() {
			if (validator.form()) {
				var url = window.ctx + '/cms/inject/modifyinject.action';
				var data = $('#fom').serializeArray();
				$("#loading").show();
				$.post(url, data, function(feedback) {
					$("#loading").hide();
					alert(feedback.message);
					if (feedback.successful) {
						window.opener.location.reload();
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
						<legend>#if($InjectID=='-1') 添加注入 #elseif($Edit=="true")
							编辑注入 #else 查看注入 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">视频类型</td>
								<td class="pn-fcontent"><input type="hidden" name='id'
									value="$InjectID" /> #if($InjectID == "-1") <input type='radio'
									name='videotype' class='videotype' value='0'
									#if($!{InjectInfo.videotype} == 0) checked #end>片花</type> <input
										type='radio' name='videotype' class='videotype' value='1'
										#if($InjectID== '-1'||$!{InjectInfo.videotype} ==
										1) checked #end>影片</type> #else #if($!{InjectInfo.videotype}
											== 0) 片花 #else 影片 #end #end </td>
								<td width="10%" class="pn-flabel pn-flabel-h">选择名称</td>
								<td class="pn-fcontent">#if($InjectID=='-1')
									<div id="movieselect" class='injectselect'>
										<input type='hidden' id='moviename' name='moviename' value='' />
										<input type='hidden' id='movie' name='movie' value='' /> <select
											name="movieid" style="width: 135px" id="movieid">
											<option value="-1">----请选择----</option> #foreach ($mv in
											$movies)
											<option value="$mv.id" movie="$mv.mediaID">$mv.name</option>
											#end
										</select>
									</div>
									<div id="previewselect" class='injectselect'
										style="display: none;">
										<input type='hidden' id='previewname' name='previewname'
											value='' /> <input type='hidden' id='preview' name='preview'
											value='' /> <select name="previewid" style="width: 135px"
											id="previewid">
											<option value="-1">----请选择----</option> #foreach ($p in
											$previews)
											<option value="$p.id" preview="$p.mediaID">$p.name</option>
											#end
										</select>
									</div> #else $!{InjectInfo.videoname} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">播放类型</td>
								<td class="pn-fcontent">#if($InjectID=="-1") <input
									type='radio' name='live' value='0' #if($InjectID==
									'-1'||$!{InjectInfo.live} == "0") checked #end>点播</type> <input
										type='radio' name='live' value='1' #if($!{InjectInfo.live} ==
										"1") checked #end>直播</type> <em class="required">*</em> #else

											#if($!{InjectInfo.live}==0) 点播 #else 直播 #end #end </td>
								<td width="10%" class="pn-flabel pn-flabel-h">文件类型</td>
								<td class="pn-fcontent">#if($InjectID=="-1") <input
									type='text' id='filetype' name='filetype'
									value='.ts' /> <em class="required">*</em>
									#else <input
									type='text' id='filetype' name='filetype'
									value='$!{InjectInfo.filetype}' /> <em class="required">*</em> #end
								</td>
							</tr>

							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">源地址</td>
								<td class="pn-fcontent">#if($InjectID=="-1") <input
									type='text' id='url' name='url' value='$!{InjectInfo.url}' />
									<em class="required">*</em> #else $!{InjectInfo.url} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">
									<!-- 状态 -->
								</td>
								<td class="pn-fcontent">
									<!-- 
								#if($Edit=="true")
								<select name="status" style="width:135px" id="status">
										<option value="0" #if($!{InjectInfo.status} == 0) selected #end>未注入</option>
										<option value="1" #if($!{InjectInfo.status} == 1) selected #end>已注入</option>
								</select>
								#else
								#if($!{InjectInfo.status} == 0) 未注入  #else 已注入  #end
								#end 
							 -->
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($InjectID=='-1')
					<button type="button" id="SaveInject" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateInject" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
	<div id="loading">
		<div id="loadingContent">
			<img src="${ctx}/static/img/loadinglit.gif" />
			<div
				style="float: left; margin-top: 17px; font-size: 12px; font-weight: bold">#if($InjectID=='-1')保存#else更新#end中，请稍后...</div>
		</div>
	</div>
</body>
</html>
