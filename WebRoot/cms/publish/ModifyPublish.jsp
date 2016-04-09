<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($Edit=="true")编辑发布  #else 查看发布  #end</title>
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
				$('.injectselect').css('display','none')
				if(type==2){
					$('#movieselect').css('display','inline')
				}else{
					$('#previewselect').css('display','inline')
				}
		});
				var validator = $("#fom").validate({
					onsubmit : false, 
					rules: {
						'groupName': {
							required: true,
						}
				},messages: {
					'groupName' : {
							required : "组名称不能为空!"
					}
			},
			errorPlacement: $.handleError,
			success: $.handleSuccess,
			invalidHandler: $.invalidAlertHandler
			});
			
			$('#UpdateInject').click(function(){
				if (validator.form()) {
				#if($!{publish.videotype} == 0) 
					var url = window.ctx+'/cms/preview/modifypreview.action';
				#else 
					var url = window.ctx+'/cms/movie/modifymovie.action';
				#end
					
					var data = $('#fom').serializeArray();
					$.post(url, data, function(feedback) {
										alert(feedback.message);
										if(feedback.successful) {
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
	<form method="post"  name="fom" id="fom">
	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" style="border:1px solid #cfcfcf;background:#ffffff;">
    <tr>
      <td colspan="2">
      	<fieldset style="height:100%;">
				<legend>#if($Edit=="true")编辑发布  #else 查看发布  #end</legend>
					<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">视频类型</td>
							<td class="pn-fcontent">
								<input type="hidden" name='id' value="$!{publish.videoid}"/>
									#if($!{publish.videotype} == 0) 片花  #else 影片 #end
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">名称</td>
							<td class="pn-fcontent"> 
									$!{publish.videoname}
							</td>
						</tr>
					
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">影片ID</td>
							<td class="pn-fcontent">
								$!{publish.identify}
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">播放类型</td>
							<td class="pn-fcontent">
								#if($!{publish.live}=="0") 点播  #else 直播 #end 
							</td>
						</tr>
						<tr>
						<td width="10%" class="pn-flabel pn-flabel-h">产品包</td>
							<td class="pn-fcontent">
								$!publish.productname
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">内部ID</td>
							<td class="pn-fcontent">
								$!{publish.mediaID}
							</td>
						</tr>
						<tr>
						<td width="10%" class="pn-flabel pn-flabel-h">价格</td>
							<td class="pn-fcontent">
								$!{publish.price}
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h"> 评分</td>
							<td class="pn-fcontent">
									$!{publish.score}
							</td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">导演</td>
							<td class="pn-fcontent">
								$!{publish.director}
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">主演 </td>
							<td class="pn-fcontent">
								$!{publish.actor}
							</td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">简介</td>
							<td class="pn-fcontent" colspan='3'>
								$!{publish.intro}
							</td>
						</tr>						
						<tr>
						<td width="10%" class="pn-flabel pn-flabel-h">源地址</td>
							<td class="pn-fcontent">
									$!{publish.url}
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">文件类型</td>
							<td class="pn-fcontent">
									$!{publish.filetype}
							</td>
						</tr>
						
						<tr>
						<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
							<td class="pn-fcontent">
								#if($Edit=="true")
								<input type="text" name="rank" id="rank" value="${publish.rank}"/>
								#else
									${publish.rank}
								#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
							<td class="pn-fcontent">
								#if($Edit=="true")
								<select name="status" style="width:135px" id="status">
										<option value="0" #if($!{publish.status} == 0) selected #end>下线</option>
										<!-- <option value="2" #if($!{publish.status} == 2) selected #end>预上线</option> -->
										<option value="1" #if($!{publish.status} == 1) selected #end>上线</option>
										
								</select>
								#else
								#if($!{publish.status} == 0) 下线  #elseif($!{publish.status} == 1) 上线  #else 预上线  #end
								#end 
							</td>
						</tr>
					</table>
				</fieldset>	
		</td>
    </tr>
   <tr>
    <td width="17%">&nbsp;</td>
    <td width="83%">
    #if($Edit=="true")
		<button type="button" id="UpdateInject" class="flatbutton">更新</button>
	#end
		<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
    </td>
   </tr>
	</table>
	</form>
</body>
</html>
