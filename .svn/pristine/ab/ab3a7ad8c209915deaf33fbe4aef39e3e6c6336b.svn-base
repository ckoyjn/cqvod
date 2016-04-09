<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>计次卡批次管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		#tagLibs()
		<link type="text/css" rel="stylesheet"
			href="${ctx}/static/css/base.css" />
		<link type="text/css" rel="stylesheet"
			href="${ctx}/static/css/public.css" />

		<script type="text/javascript">
			jQuery(document)
					.ready(
							function() {
								$('#addcardepk')
										.click(
												function() {
													window
															.showModalDialog(
																	"${ctx}/cms/card/tomodifycardepk.action?id=-1&Edit=true&"
																			+ new Date(),
																	window,
																	"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
												});
								$('#searchb')
										.click(
												function() {
													var epkId = $.trim($(
															"#epkId").val());
													$('#_p').val('1');
													if (epkId.length > 8) {
														alert("批次卡不能超过８位数");
														$("#epkId").val('');
														return;
													}
													$('#queryForm')
															.attr(
																	"action",
																	window.ctx
																			+ "/cms/card/findcardepklist.action")
															.submit();
												});

								$('#reset')
										.click(
												function() {
													$(":input")
															.not(
																	":button,:submit,:reset,:hidden")
															.val('');
												});
								//导出
								$('#export')
										.click(
												function() {
													var len = $('input:checked[type=checkbox]');
									                var epkIds = [];
									                 var epkItems = "";
									                 var count = 0;
									                if (len.length == 0) {
									                    alert("请选择要激活的批次");
									                    return false;
									                } else {
									                    len.each(function() {
									                              if(($(this).val().split("::c::")[2] == "1")) {
									                                  count = -998;
									                                  alert("未激活批次不能导出,批次号为:" + $(this).val().split("::c::")[0]);
									                                  $('[type=checkbox]').attr('checked',false);
									                                  return false;
									                              }else if(($(this).val().split("::c::")[2] == "3")) {
									                                  count = -998;
									                                  alert("已下发的批次不能再导出,批次号为:" + $(this).val().split("::c::")[0]);
									                                  $('[type=checkbox]').attr('checked',false);
									                                  return false;
									                              }else{
									                                  epkItems += $(this).val() + "::r::";
									                                  count++;
									                              }
									                    });
									                    if(count == -998){
									                          return false;
									                      }
														$("#epkIds")
																.val(epkItems);
														$('#queryForm')
																.attr(
																		"action",
																		window.ctx
																				+ "/cms/card/exportcardepk.action")
																.submit();
														$('#queryForm')
																.attr(
																		"action",
																		window.ctx
																				+ "/cms/card/findcardepklist.action");
													}
												});
						

								$("#checkall").click(
										function() {
											if (this.checked) {
												$("[type='checkbox']").attr(
														'checked', 'checked');
											} else {
												$("[type='checkbox']").attr(
														'checked', false);
											}

										});

							});
			
			function act(){
				var len = $('input:checked[type=checkbox]');
                var epkIds = [];
                 var epkItems = "";
                 var count = 0;
                if (len.length == 0) {
                    alert("请选择要激活的批次");
                    return false;
                } else {
                    len.each(function() {
                              if(($(this).val().split("::c::")[2] == "2")) {
                                  count = -998;
                                  alert("已激活的批次不能再激活,批次号为:" + $(this).val().split("::c::")[0]);
                                  $('[type=checkbox]').attr('checked',false);
                                  return false;
                              }else if(($(this).val().split("::c::")[2] == "3")) {
                                  count = -998;
                                  alert("已下发的批次不能再激活,批次号为:" + $(this).val().split("::c::")[0]);
                                  $('[type=checkbox]').attr('checked',false);
                                  return false;
                              }else{
                                  epkItems += $(this).val() + "::r::";
                                  count++;
                              }
                    });
                    if(count == -998){
                          return false;
                      }
                    
                    var url = window.ctx+'/cms/card/insertIntoEvcn.action';
                    var data={epkIds:epkItems};
                    $.post(url, data,
                            function(feedback) {
                                alert(feedback.message);
                                if (feedback.successful) {
                                    reloadPage();
                                }
                            });
                 
                }
	            
	        }
			function reloadPage() {
                $('#queryForm').attr("action",
                        window.ctx + "/cms/card/findcardepklist.action")
                        .submit();
            }
		</script>
</head>

<body leftmargin="8" topmargin="8"
	background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="get">
		<input type="hidden" id="orderColumn" name="orderColumn" value="77777" />
		<table width='98%' border='0' cellpadding='1' cellspacing='1'
			align='center' bgcolor='#cfcfcf' style="margin-top: 8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>卡号批次<input type='text' name='epkId' id='epkId'
								value='$!{cardEpk.epkId}'
								onkeyup="value=value.replace(/[^(\d)]/g,'')" /></td>
							<td><input type="button" id="searchb" class="flatbutton"
								value="查询" /></td>
							<td><input type="button" id="reset" class="flatbutton"
								value="重置" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top: 8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="12" style="padding-left: 10px;">观影码批次管理</td>
				<div
					style="margin-left: 800px; position: absolute; margin-top: 13px;">
					<input type="button" id="act1" class="flatbutton" onclick="act()" value="激活" /> <input
						type="button" id="export" class="flatbutton" value="导出批次" />
				</div>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><input type="checkbox" id="checkall" /></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Identify" lastOrderBy="$!orderColumn" class="tb_head">观影码批次号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Identify" lastOrderBy="$!orderColumn" class="tb_head">观影码名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="VodID" lastOrderBy="$!orderColumn" class="tb_head">生成数量</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Name" lastOrderBy="$!orderColumn" class="tb_head">卡号长度</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Mins" lastOrderBy="$!orderColumn" class="tb_head">说明备注</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Mins" lastOrderBy="$!orderColumn" class="tb_head">激活状态</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Mins" lastOrderBy="$!orderColumn" class="tb_head">失效时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"
					name="Price" lastOrderBy="$!orderColumn" class="tb_head">生成时间</a></td>
				<!-- 
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Director"  lastOrderBy="$!orderColumn"class="tb_head">操作</a></td>
			       -->

			</tr>
			#if ($null.isNull($pml.pagedModelList) ||
			$pml.pagedModelList.size()==0)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td colspan="11"><h1>没有检索到数据</h1></td>
			</tr>
			#end #foreach ($m in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td><input type="checkbox" value="${m.epkId}::c::${m.epkNum}::c::${m.epkStatus}::c::${m.type}"/></td>
				<td>$!{m.epkId}</td>
				<td>$!{m.epkName}</td>
				<td>$!{m.epkNum}</td>
				<td>#if($!{m.type}==0) 8位 #end #if($!{m.type}==1) 10位 #end</td>
				<td>$!{m.epkRemark}</td>
				<td>
				#if($!{m.epkStatus}==1) 未激活 
				#elseif($!{m.epkStatus}==2) 已激活 
				#else 已下发
				#end
				</td>
				<td>$!{m.epkDateEnd}</td>
				<td>$!{m.epkDateStart}</td>
				<!-- 
				<td colspan="2">
					<img onClick="editMovie('$!m.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='ç¼è¾' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showMovie('$!m.id')" src='${ctx}/static/img/part-list.gif' title="详情" alt="æ¥ç" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delMovie('$!m.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="å é¤" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
				 -->
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; <input type="button"
					class="flatbutton" id="addcardepk" value='生成新的计次卡号' />
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="11" align="center">
					<div class="pagelistbox">#rendPageInfo(${pml})</div>
				</td>
			</tr>
		</table>
		<input type="hidden" name="epkIds" id="epkIds" value="" />
	</form>
</body>
</html>
