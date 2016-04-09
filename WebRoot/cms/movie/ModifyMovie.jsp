<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>#if($MovieID=='-1') 添加影片 #elseif($Edit=="true")编辑影片 #else
	查看查看影片 #end</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="this is my page" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css" />
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css" />
	<script type="text/javascript" src="${ctx}/static/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/validate/validate-tip.js"></script>
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
							'identify' : {
								required : true,
								maxlength:40,
							},
							'rank' : {
								required : true,
								number : true,
								max  : 100000000
							},
							'name' : {
								required : true,
								maxlength : 14,
							},
							'eName' : {
								required : true,
								maxlength : 32,
							},
							'mins' : {
								required : true,
								number : true,
								max : 10000,
							},
// 							'vodID' : {
// 								required : true,
// 								maxlength : 14,
// 							},
							'mediaID' : {
								required : true,
								maxlength : 20,
							},
							'price' : {
								required : true,
							},
							'score' : {
								required : true,
								number : true,
								max : 10,
							},
							'intro' : {
								required : true,
								maxlength : 1023,
							},
							'director' : {
								maxlength : 255,
							},
							'actor' : {
								maxlength : 25,
							},

						},
						messages : {
							'identify' : {
								required : "图片标识不能为空!",
								maxlength : "图片标识长度不能超过40个字符",
							},
							'rank' : {
								required : "排序不能为空!",
								number : "排序必须为整数",
								max : "排序长度请控制在100000000以内"
							},
							'name' : {
								required : "影片中文名称不能为空!",
								maxlength : "影片中文名称长度不能超过14个字符",
							},
							'eName' : {
								required : "影片英文名称不能为空!",
								maxlength : "影片英文名称长度不能超过32个字符",
							},
							'mins' : {
								required : "时长不能为空!",
								number : "时长必须为整数",
								max : "时长不超过10000分钟",
							},
							'mediaID' : {
								required : "内部ID为空!",
								maxlength : "内部ID长度不能超过20个字符",
							},
							'price' : {
								required : "价格不能为空!"
							},
							'vodID' : {
								required : "产品包不能为空!",
								maxlength : "产品包长度不能超过14个字符",
							},
							'score' : {
								required : "评分不能为空!",
							    number : "评分必须是数字",
							    max : "评分不能大于10",
							},
							'intro' : {
								required : "简介不能为空!",
								maxlength : "简介长度不能超过1023个字符",
							},
							'director' : {
								maxlength : "导演长度不超过255个字符",
							},
							'actor' : {
								maxlength : "主演长度不超过25个字符",
							},
							'playurl' : {
								playurl : "播放地址长度不超过200个字符",
							},

						},
						errorPlacement : $.handleError,
						success : $.handleSuccess,
						invalidHandler : $.invalidAlertHandler
					});

					$('#SaveMovie').click(
							function() {
								if (validator.form()) {
									var url = window.ctx
											+ '/cms/movie/addmovie.action';
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
					$('#UpdateMovie').click(
							function() {
								if (validator.form()) {
									var url = window.ctx
											+ '/cms/movie/modifymovie.action';
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
				
			 function productName()
			 {
				 var vodID=$("#vodID").val();
				 if(vodID!='')
					 {
					 var url = window.ctx
                     + '/cms/movie/findPrice.action';
             var data = $('#fom').serializeArray();
             $.post(url, data,
                     function(feedback) {
                  $("#price").val(feedback.message);
                     });
					 }else{
						 $("#price").val(''); 
					 }
			 }
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
						<legend>#if($MovieID=='-1') 添加影片 #elseif($Edit=="true")
							编辑影片 #else 查看影片 #end</legend>
						<table width="98%" class="pn-ftable" cellpadding="2"
							cellspacing="1" border="0">
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">图片标识</td>
								<td class="pn-fcontent">
									<input type="hidden" name='id'value="$MovieID" /> 
									#if($Edit=="true") 
										<!-- <input name="identify" class="text" id="identify" type="text" value="$!{MovieInfo.identify}" />  -->
										<select name="identify" id="identify">
											<option value="">==请选择图片标识==</option>
											#foreach ($its in $identifys)
												<option value="$!{its}" #if($!MovieInfo.identify == $!its) selected="selected" #end>$!{its}</option>
											#end
										</select>
										<em class="required">*</em>
									#else 
										$!{MovieInfo.identify}
									#end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">排序</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="rank" class="text" id="rank"
									onkeyup="value=value.replace(/[^(\d)]/g,'')" type="text"
									value="$!{MovieInfo.rank}" /> <em class="required">*</em>
									#else $!{MovieInfo.rank} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">影片中文名称</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="name" class="text" id="name" type="text"
									value="$!{MovieInfo.name}" /> <em class="required">*</em>
									#else $!{MovieInfo.name} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">影片英文名称</td>
								<td class="pn-fcontent">
								#if($Edit=="true") <input
                                    name="eName" class="text" id="eName" type="text"
                                    value="$!{MovieInfo.eName}" /> <em class="required">*</em>
                                    #else $!{MovieInfo.eName} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">产品包
								</td>
								<td class="pn-fcontent"><select name="vodID" id="vodID" onchange="productName()">
										<option value="">==请选择==</option> #foreach($p in $!products)
										#if($p.status==1)
										<option value="$!p.vodid" #if($MovieInfo.vodID==$p.vodid)
											selected #end>$!p.name
											</option>#end #end
								</select> <em class="required">*</em></td>
								<td width="10%" class="pn-flabel pn-flabel-h">内部ID</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="mediaID" class="text" id="mediaID" type="text"
									value="$!{MovieInfo.mediaID}" /> <em class="required">*</em>
									#else $!{MovieInfo.mediaID} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">价格</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="price" class="text" id="price" type="text" readonly="readonly"
									value="$!{MovieInfo.price}" /> <em class="required">*</em>
									#else $!{MovieInfo.price} #end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">评分</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="score" class="text" id="score" type="text"
									value="$!{MovieInfo.score}" /> <em class="required">*</em>
									#else $!{MovieInfo.score} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">导演</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="director" class="text" id="director" type="text"
									value="$!{MovieInfo.director}" /> #else $!{MovieInfo.director}
									#end
								</td>
								<td width="10%" class="pn-flabel pn-flabel-h">主演</td>
								<td class="pn-fcontent">#if($Edit=="true") <input
									name="actor" class="text" id="actor" type="text"
									value="$!{MovieInfo.actor}" /> #else $!{MovieInfo.actor} #end
								</td>
							</tr>
							<tr>
                               <td width="10%" class="pn-flabel pn-flabel-h">影片类型</td>
                            <td class="pn-fcontent">
                            #if($Edit=="true")
                                <select name="type" style="width:135px" id="type">
                                        <option value="0" #if($!{MovieInfo.type} == 0) selected #end>高清</option>
                                        <option value="1" #if($!{MovieInfo.type} == 1) selected #end>标清</option>
                                </select>
                             #else
                                #if($!{MovieInfo.type} == 0) 高清 #else 标清  #end
                            #end 
                            </td>
                             <td width="10%" class="pn-flabel pn-flabel-h">时长</td>
                             <td class="pn-fcontent">
                             #if($Edit=="true") <input
                                    name="mins" class="text" id="mins" type="text"
                                    onkeyup="value=value.replace(/[^(\d)]/g,'')"
                                    value="$!{MovieInfo.mins}" /> <em class="required">*</em>
                                    #else $!{MovieInfo.mins} #end
                              </td>
                            </tr>
                            <tr>
								<td width="10%" class="pn-flabel pn-flabel-h">视频地址</td>
								<td class="pn-fcontent" colspan='3'>#if($Edit=="true") <textarea
										name="playurl" id="playurl" width="80%" rows="2" cols="80">$!{MovieInfo.playurl}</textarea>
									<em class="required">*</em> #else $!{MovieInfo.playurl} #end
								</td>
							</tr>
							<tr>
								<td width="10%" class="pn-flabel pn-flabel-h">简介</td>
								<td class="pn-fcontent" colspan='3'>#if($Edit=="true") <textarea
										name="intro" id="intro" width="80%" rows="4" cols="80">$!{MovieInfo.intro}</textarea>
									<em class="required">*</em> #else $!{MovieInfo.intro} #end
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="83%">#if($MovieID=='-1')
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
