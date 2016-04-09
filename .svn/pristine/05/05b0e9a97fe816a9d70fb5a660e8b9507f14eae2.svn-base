<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($ProductID=='-1') 添加产品 #elseif($Edit=="true")编辑产品
	#else 查看产品 #end</title>
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
					var validator; 
					if($ProductID=='-1'){
					 validator = $("#fom").validate({
						onsubmit : false,
						
						rules : {
							'name' : {
								required : true,
								maxlength :40,
							},
							'vodid' : {
								required : true,
								maxlength :40,
								remote : {
                                    url : window.ctx
                                            + '/cms/product/checkVodID.action'
                                }
							},
							'price' : {
								required : true,
								maxlength :10,
							},
							'productdesc' : {
								maxlength : 255,
							}
						},
						messages : {
							'name' : {
								required : "产品名称不能为空!",
								maxlength : "产品名称长度不能超过40个字符",
							},
							'vodid' : {
								required : "VoD ID不能为空!",
								maxlength : "VoD ID长度不能超过40个字符",
								remote : 'VOD ID已经添加过，不能重复',
							},
							'price' : {
								required : "价格不能为空!",
								maxlength : "价格长度不能超过10个字符",
							},
							'productdesc' : {
								maxlength : "备注长度不能超过255个字符",
							},
						},
						errorPlacement : $.handleError,
						success : $.handleSuccess,
						invalidHandler : $.invalidAlertHandler
					});
					}else{
						validator = $("#fom").validate({
	                        onsubmit : false,
	                        
	                        rules : {
	                            'name' : {
	                                required : true,
	                                maxlength :40,
	                            },
	                            'vodid' : {
	                                required : true,
	                                maxlength :40,
	                            },
	                            'price' : {
	                                required : true,
	                                digits:true,
	                                maxlength :10,
	                            },
	                            'productdesc' : {
	                                maxlength : 255,
	                            }
	                        },
	                        messages : {
	                            'name' : {
	                                required : "产品名称不能为空!",
	                                maxlength : "产品名称长度不能超过40个字符",
	                            },
	                            'vodid' : {
	                                required : "VoD ID不能为空!",
	                                maxlength : "VoD ID长度不能超过40个字符",
	                            },
	                            'price' : {
	                                required : "价格不能为空!",
	                                digits:"价格为整数",
	                                maxlength : "价格长度不能超过10个字符",
	                            },
	                            'productdesc' : {
	                                maxlength : "备注长度不能超过255个字符",
	                            },
	                        },
	                        errorPlacement : $.handleError,
	                        success : $.handleSuccess,
	                        invalidHandler : $.invalidAlertHandler
	                    });
						
					}
					

					$('#SaveProduct').click(
							function() {
								if (validator.form()) {
									var url = window.ctx
											+ '/cms/product/addproduct.action';
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
					$('#UpdateProduct')
							.click(
									function() {
										if (validator.form()) {
											var url = window.ctx
													+ '/cms/product/modifyproduct.action';
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
						<legend>#if($ProductID=='-1') 添加产品 #elseif($Edit=="true")
							编辑产品 #else 查看产品 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">产品名称</td>
								<td class="pn-fcontent"><input type="hidden" name='id'
									value="$ProductID" /> #if($Edit=="true") <input name="name"
									class="text" id="name" id="name" type="text"
									value="$!{ProductInfo.name}" /> <em class="required">*</em>
									#else $!{ProductInfo.name} #end</td>
								<td width="10%" class="pn-flabel pn-flabel-h">VoD ID</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="vodid" class="text" id="vodid" type="text"
									value="$!{ProductInfo.vodid}" /> <em class="required">*</em>
									#else $!{ProductInfo.vodid} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">价格</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="price" class="text" id="price" type="text"
									value="$!{ProductInfo.price}" /> <em class="required">*</em>
									#else $!{ProductInfo.price} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">状态</td>
								<td class="pn-fcontent">#if($Edit=="true") <select
									name="status" style="width: 135px" id="status">
										<option value="0" #if($!{ProductInfo.status} ==
											0) selected #end>禁用</option>
										<option value="1" #if($!{ProductInfo.status} ==
											1) selected #end>启用</option>
								</select> #else #if($!{ProductInfo.status} == 0) 禁用 #else 启用 #end #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">备注</td>
								<td class="pn-fcontent" colspan='3'>#if($Edit=="true") <textarea
										name="productdesc" id="productdesc" width="80%" rows="4"
										cols="80">$!{ProductInfo.productdesc}</textarea> #else
									$!{ProductInfo.productdesc} #end
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($ProductID=='-1')
					<button type="button" id="SaveProduct" class="flatbutton">添加</button>
					#elseif($Edit=="true")
					<button type="button" id="UpdateProduct" class="flatbutton">更新</button>
					#end
					<button type="button" onClick="window.close();" class="flatbutton">关闭</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
