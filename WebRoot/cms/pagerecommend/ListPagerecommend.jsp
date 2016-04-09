<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>首页广告活动推荐列表</title> #tagLibs()
		<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css" />
		<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css" />
		<script type="text/javascript">
			jQuery(document)
					.ready(
							function() {
								$('#addPagerecommend')
										.click(
												function() {
													window
															.showModalDialog(
																	"${ctx}/cms/pagerecommend/tomodifypagerecommend.action?id=-1&Edit=true&"
																			+ new Date(),
																	window,
																	"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
												});
								$('#searchb')
										.click(
												function() {
													$('#_p').val('1');
													$('#queryForm')
															.attr(
																	"action",
																	window.ctx
																			+ "/cms/pagerecommend/findpagerecommendlist.action")
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
							});
			function editPagerecommend(id) {
				window
						.showModalDialog(
								"${ctx}/cms/pagerecommend/tomodifypagerecommend.action?id="
										+ id + "&Edit=true&" + new Date(),
								window,
								"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
			}
			function showPagerecommend(id) {
				window
						.showModalDialog(
								"${ctx}/cms/pagerecommend/tomodifypagerecommend.action?id="
										+ id + "&Edit=false&" + new Date(),
								window,
								"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
			}
			function delPagerecommend(id) {
				var url = window.ctx + '/cms/pagerecommend/delpagerecommend.action';
				if (confirm("是否删除")) {
					$.post(url, {
						id : id
					}, function(feedback) {
						alert(feedback.message);
						if (feedback.successful) {
							reloadPage();
						}
					});
				}
			}
	
			function reloadPage() {
				$('#queryForm')
						.attr(
								"action",
								window.ctx
										+ "/cms/pagerecommend/findpagerecommendlist.action")
						.submit();
			}
		</script>
	</head>

	<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
		<form id="queryForm" name='form0' action='' method='post'>
			<input type="hidden" id="orderColumn" name="orderColumn" value="$!{map.orderColumn}" />
			<table width='98%' border='0' cellpadding='1' cellspacing='1' bgcolor='#cfcfcf' align="center" style="margin-top: 8px">
				<tr bgcolor='#EEF4EA'>
					<td>
						<table border='0' cellpadding='0' cellspacing='0' height="32">
							<tr class="search">
								<td>标题：
									<input type='text' name='title' value='$!{map.title}' />
								</td>
								<td>类型：
									<select name="type" id="type">
										<option value="">==请选择==</option>
										<option value="0" #if(${map.type}=='0' ) selected="selected" #end>影片详情页</option>
										<option value="1" #if(${map.type}=='1' ) selected="selected" #end>视频</option>
										<option value="2" #if(${map.type}=='2' ) selected="selected" #end>活动推荐</option>
										<option value="3" #if(${map.type}=='3' ) selected="selected" #end>单专题</option>
										<option value="4" #if(${map.type}=='4' ) selected="selected" #end>多专题</option>
									</select>
								</td>
								<td>
									<input type="button" id="searchb" class="flatbutton" value="查询" />
								</td>
								<td>
									<input type="button" id="reset" class="flatbutton" value="重置" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top: 8px">
				<tr bgcolor="#EEF4EA">
					<td height="28" colspan="12" style="padding-left: 10px;">首页广告活动推荐列表</td>
				</tr>
				<tr align="center" bgcolor="#FBFCE2" height="25">
					<td><a href="javascript:void(0);" name="title" lastOrderBy="$!orderColumn" class="tb_head">标题</a></td>
					<td><a href="javascript:void(0);" name="sort" lastOrderBy="$!orderColumn" class="tb_head">排序</a></td>
					<td><a href="javascript:void(0);" name="type" lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">类型</a></td>
					<td><a href="javascript:void(0);" name="objectname" lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">名称</a></td>
					<td><a href="javascript:void(0);" name="identify" lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">图片标识</a></td>
					<td><a href="javascript:void(0);" name="imgurl" lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">图片地址</a></td>
					<td><a href="javascript:void(0);" name="createtime" class="tb_head">创建时间</a></td>
					<td><a href="javascript:void(0);" name="updatetime" class="tb_head">更新时间</a></td>
					<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">状态</a></td>
					<td>操作</td>
				</tr>
				#if ($null.isNull($pagedModelList.pagedModelList) || $pagedModelList.pagedModelList.size()==0)
				<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td colspan="9">
						<h1>没有检索到记录</h1></td>
				</tr>
				#end #foreach($pr in $pagedModelList.pagedModelList)
				<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td>$!{pr.title}</td>
					<td>$!{pr.sort}</td>
					<td>#if($!{pr.type} == '0') 影片详情页 #elseif ($!{pr.type} == '1') 视频 #elseif ($!{pr.type} == '2') 活动推荐 #elseif ($!{pr.type} == '3') 单专题 #elseif ($!{pr.type} == '4') 多专题 #end</td>
					<td>$!{pr.objectname}</td>
					<td>$!{pr.identify}</td>
					<td>$!{pr.imgurl}</td>
					<td>$!{pr.createtime}</td>
					<td>$!{pr.updatetime}</td>
					<td>#if($!{pr.status} == '1') 上线 #else 下线 #end</td>
					<td><img onClick="editPagerecommend('$!pr.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor: pointer' border='0' width='16' height='16' />
						<img onClick="delPagerecommend('$!pr.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor: pointer' border='0' width='16' height='16' /></td>
				</tr>
				#end
				<tr bgcolor="#ffffff">
					<td height="36" colspan="12">&nbsp;
						<input type="button" class="flatbutton" id="addPagerecommend" value='添加广告推荐' />
					</td>
				</tr>
				<tr align="right" bgcolor="#F9FCEF">
					<td height="36" colspan="12" align="center">#rendPageInfo(${pagedModelList})</td>
				</tr>
			</table>
		</form>
	</body>

</html>