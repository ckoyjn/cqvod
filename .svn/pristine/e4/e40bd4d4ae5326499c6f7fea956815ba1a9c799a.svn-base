<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($MovieID=='-1') 添加订单   #elseif($Edit=="true")编辑影片  #else 查看查看影片 #end</title>
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
				var validator = $("#fom").validate({
					onsubmit : false, 
					rules: {
						'userId': {
							required: true,
						},
						'productId': {
                            required: true,
                        },
                        'mediaId': {
                            required: true,
                        }
				},messages: {
					'userId' : {
							required : "用户ID不能为空!"
					},
					'productId' : {
                        required : "产品名称不能为空!"
                },
					'mediaId' : {
                        required : "影片ID不能为空!"
                }
			},
			errorPlacement: $.handleError,
			success: $.handleSuccess,
			invalidHandler: $.invalidAlertHandler
			});

				
			$('#SaveMovie').click(function(){
				
				if($("#userId").val().length>20){
					alert("用户ID长度超过20个字符");
				}else{
					if (validator.form()) {
						var url = window.ctx+'/cms/order/addorder.action';
						var data = $('#fom').serializeArray();
						$.post(url, data, function(feedback) {
											alert(feedback.message);
											if(feedback.successful) {
		                                        window.dialogArguments.reloadPage();
												window.close();
											}
						});
					}
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
				<legend>#if($MovieID=='-1') 添加订单  #elseif($Edit=="true") 编辑影片  #else 查看影片 #end</legend>
					<table width="98%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">用户ID </td>
							<td class="pn-fcontent">
								<input type="hidden" name='id' value="$MovieID"/>
								#if($Edit=="true")
								<input name="userId" class="text" id="userId" type="text" value="$!{MovieInfo.identify}" onkeyup="value=value.replace(/[^(\d)]/g,'')"/>
								<em class="required">*</em>
								#else
								$!{MovieInfo.identify}
								#end 
							</td>
							<td width="10%" class="pn-flabel pn-flabel-h">产品名称</td>
                            <td class="pn-fcontent">
                                <select name="productId" id="productId">
                                    <option value="">==请选择==</option>
                                    #foreach($p in $!productIDs)
                                    	#if($!p.status=='1')
                                        <option value="$!p.id" >$!p.vodid</option>
                                        #end
                                    #end
                                </select>
                                <em class="required">*</em>
                            </td>
						</tr>
						<tr>
							<td width="10%" class="pn-flabel pn-flabel-h">影片ID</td>
                            <td class="pn-fcontent">
                                <select name="mediaId" id="mediaId">
                                    <option value="">==请选择==</option>
                                    #foreach($p in $!MediaIDs)
                                    	#if($!p.status=='1')
                                        <option value="$!p.MediaID"  >$!p.MediaID</option>
                                        #end
                                    #end
                                </select>
                                <em class="required">*</em>
                            </td>
							<td width="10%" class="pn-flabel pn-flabel-h"></td>
							<td class="pn-fcontent">
								
							</td>
						</tr>
						
					</table>
				</fieldset>	
		</td>
    </tr>
   <tr>
    <td width="17%">&nbsp;</td>
    <td width="83%">
    #if($MovieID=='-1')
    	<button type="button" id="SaveMovie" class="flatbutton">添加</button>
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
