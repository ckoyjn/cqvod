<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>活动推荐列表</title>
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
	jQuery(document)
	.ready(
			function() {
				$('#addActsrecommend')
						.click(
								function() {
									window
											.showModalDialog(
													"${ctx}/cms/actsrecommend/tomodifyactsrecommend.action?id=-1&Edit=true&"
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
															+ "/cms/actsrecommend/findactsrecommendlist.action")
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
function editActsrecommend(id) {
window
		.showModalDialog(
				"${ctx}/cms/actsrecommend/tomodifyactsrecommend.action?id="
						+ id + "&Edit=true&" + new Date(),
				window,
				"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
}
function showActsrecommend(id) {
window
		.showModalDialog(
				"${ctx}/cms/actsrecommend/tomodifyactsrecommend.action?id="
						+ id + "&Edit=false&" + new Date(),
				window,
				"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
}
function delActsrecommend(id) {
var url = window.ctx + '/cms/actsrecommend/delactsrecommend.action';
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
						+ "/cms/actsrecommend/findactsrecommendlist.action")
		.submit();
}
	</script>
</head>
<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form id="queryForm" name='form0' action='' method='post'>
		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#cfcfcf' align="center" style="margin-top:8px">
  			<tr bgcolor='#EEF4EA'>
    			<td>
      				<table border='0' cellpadding='0' cellspacing='0' height="32">
        				<tr class="search">
        					<td>标题：<input type='text' name='title' value='$!{map.title}'/></td>
       						<td><input type="button" id="searchb" class="flatbutton" value="查询"/></td>
       						<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
      					</tr>
     				</table>
   				</td>
  			</tr>
		</table>
		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA" >
				<td height="28" colspan="12"  style="padding-left:10px;">活动推荐列表</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" name="title"        lastOrderBy="$!orderColumn" class="tb_head">标题</a></td>
				<td><a href="javascript:void(0);" name="moduleCount"  lastOrderBy="$!orderColumn" class="tb_head" >标题模块数</a></td>
				<td><a href="javascript:void(0);" name="contentCount" lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">模块内容数</a></td>
				<td><a href="javascript:void(0);" name="moduleTitles" lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">列表标题</a></td>
				<td><a href="javascript:void(0);" name="identify"     class="tb_head">图片标识</a></td>
				<td><a href="javascript:void(0);" name="imgUrl"       class="tb_head">图片地址</a></td>
				<td><a href="javascript:void(0);" name="status"       class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" name="createtime"   lastOrderBy="$!orderColumn" class="tb_head" onclick="orderBy(this);">创建时间</a></td>
				<td><a href="javascript:void(0);" name="updatetime"   lastOrderBy="$!orderColumn" class="tb_head">更新时间</a></td>
				<td>操作</td>
			</tr>
       		#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	<td colspan="12"><h1>没有检索到记录</h1></td>
            </tr>
            #end
			#foreach($ar in $pml.pagedModelList)
				<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td>$!ar.title</td>
					<td>$!ar.moduleCount</td>
					<td>$!ar.contentCount</td>
					<td>$!ar.moduleTitles</td>
					<td>$!ar.identify</td>
					<td>$!ar.imgUrl</td>
					<td>#if($!{ar.status} == '0') 禁用  #elseif ($!{ar.status} == '1') 启用  #end </td>
					<td>$!ar.createtime</td>
					<td>$!ar.updatetime</td>
					<td>
						<img onClick="editActsrecommend('$!ar.id')" src='${ctx}/static/img/gtk-edit.png'  title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
						<img onClick="delActsrecommend('$!ar.id')"  src='${ctx}/static/img/gtk-del.png'   title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
					</td>
				</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addActsrecommend" value='添加活动推荐'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="12" align="center">#rendPageInfo(${pml})</td>
			</tr>
	</table>
</form>
</body>
</html>