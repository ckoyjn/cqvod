<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($InjectID=='-1') 添加关联   #elseif($Edit=="true")编辑关联  #else 查看关联  #end</title>
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
			$('.videotype').click(function(e){
				var type=$(this).val();
				$('.injectselect').css('display','none');
				if(type==1){
					$('#movieselect').css('display','inline');
				}else{
					$('#previewselect').css('display','inline');
				}
			});
			var validator = $("#fom").validate({
				onsubmit : false, 
				rules: {
					'filetype': {
						required: true,
						maxlength:40
					},
					'url': {
                           required: true,
                           maxlength:255,
                       }
					
				},messages: {
					'filetype' : {
							required : "文件类型不能为空!",
							maxlength:"文件类型长度不超过40个字符"
					},
					'url' : {
	                       required : "源地址不能为空!",
	                       maxlength:"源地址长度不超过255个字符"
	          		}
				},
				errorPlacement: $.handleError,
				success: $.handleSuccess,
				invalidHandler: $.invalidAlertHandler
			});
			
			$('#SaveAssociate').click(function(){
				if($("#movieid option:selected").val()==-1 || $("#previewid option:selected").val()==-1){
					alert("请选择关联的资源");
				}else{
					if (validator.form()) {
						var url = window.ctx+'/cms/associate/addassociate.action';
						var data = $('#fom').serializeArray();
						$("#loading").show();
						$.post(url, data, function(feedback) {
							$("#loading").hide();
							alert(feedback.message);
							if(feedback.successful) {
								window.opener.location.reload();
								window.close();
							}
						});
					}
				}
			});
			$('#movieid').change(function(){
				$('#moviename').val($("#movieid  option:selected").text());
			});
			$('#previewid').change(function(){
				$('#previewname').val($("#previewid  option:selected").text());
				$('#preview').val($("#previewid  option:selected").attr("preview"));
			});
			
			$('#UpdateAssociate').click(function(){
				if (validator.form()) {
					var url = window.ctx+'/cms/associate/modifyassociate.action';
					var data = $('#fom').serializeArray();
					$("#loading").show();
					$.post(url, data, function(feedback) {
						$("#loading").hide();
										alert(feedback.message);
										if(feedback.successful) {
											window.opener.location.reload();
											window.close();
										}
					});
				}
			});
		});
		$(function(){
			//修改页加载
			if($('#movieid').val() != ''){
				$('#moviename').val($("#movieid  option:selected").text());
			}
			if($('#previewid').val() != ''){
				$('#previewname').val($("#previewid  option:selected").text());
				$('#preview').val($("#previewid  option:selected").attr("preview"));
			}
		})
	</script>
</head>

<body class="ContentBody">
	<form method="post"  name="fom" id="fom">
	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" style="border:1px solid #cfcfcf;background:#ffffff;">
    <tr>
      <td colspan="2">
      	<fieldset style="height:100%;">
				<legend>#if($movieid=='-1' && $previewid=='-1') 添加关联 #elseif($Edit=="true") 编辑关联
					<input type="hidden" name="pid" value="$previewid"/><input type="hidden" name="mid" value="$movieid"/>
				 #else 查看关联 #end</legend>
					<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">选择影片</td>
							<td class="pn-fcontent">
								#if($Edit == 'true')
									<input type='hidden' id='moviename' name='MovieName' value=''/>
									<select name="Movieid" style="width:135px" id="movieid">
										#if($movieid != '-1')
											<option value="$!{AssociateInfo.Movieid}" selected="selected">$!{AssociateInfo.MovieName}</option>
										#else
											<option value="-1">----请选择影片----</option>
										#end
										#foreach ($mv in $movies)
											<option value="$mv.id">$mv.name</option>
										#end
									</select>
								#else
									$!{AssociateInfo.MovieName}
								#end
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">选择片花</td>
							<td class="pn-fcontent">
								#if($Edit=='true')
								<input type='hidden' id='previewname' name='PreviewName' value=''/>
									<input type='hidden' id='preview' name='MediaID' value=''/>
									<select name="Previewid" style="width:135px" id="previewid">
										#if($previewid != '-1')
											<option value="$!{AssociateInfo.Previewid}" preview="$!{AssociateInfo.MediaID}" selected="selected">$!{AssociateInfo.PreviewName}</option>
										#else
											<option value="-1">----请选择片花----</option>
										#end
										#foreach ($p in $previews)
											<option value="$p.id" preview="$p.mediaID">$p.name</option>
										#end 
									</select>
								#else
									$!{AssociateInfo.PreviewName}
								#end
							</td>
						</tr>
						#if($Edit=='false')
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">影片ID</td>
							<td class="pn-fcontent">$!{AssociateInfo.Movieid}</td>
							<td width="10%" class="pn-flabel pn-flabel-h">片花ID</td>
							<td class="pn-fcontent">$!{AssociateInfo.Previewid}</td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">MediaID</td>
							<td class="pn-fcontent">$!{AssociateInfo.MediaID}</td>
						</tr>
						#end
					</table>
				</fieldset>	
		</td>
    </tr>
   <tr>
    <td width="17%">&nbsp;</td>
    <td width="83%">
	#if($movieid=='-1' && $previewid=='-1')
    	<button type="button" id="SaveAssociate" class="flatbutton">添加</button>
	#elseif($Edit=="true")
		<button type="button" id="UpdateAssociate" class="flatbutton">更新</button>
	#end
		<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
    </td>
   </tr>
	</table>
	</form>
	<div id="loading">
		<div id="loadingContent">
			<img src="${ctx}/static/img/loadinglit.gif"/>
			<div style="float:left;margin-top:17px;font-size:12px;font-weight: bold">#if($moiveid =='-1'&& $previeid == '-1')保存#else更新#end中，请稍后...</div> 
		</div>
	</div>
</body>
</html>
