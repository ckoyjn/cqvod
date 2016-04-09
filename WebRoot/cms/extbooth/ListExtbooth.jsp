<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>专题扩展推荐位列表</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
	jQuery(document)
	.ready(
			function() {
				$('#addExtbooth')
						.click(
								function() {
									window
											.showModalDialog(
													"${ctx}/cms/extbooth/tomodifyextbooth.action?id=-1&Edit=true&"
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
															+ "/cms/extbooth/findextboothlist.action")
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
function editExtbooth(id) {
window
		.showModalDialog(
				"${ctx}/cms/extbooth/tomodifyextbooth.action?id="
						+ id + "&Edit=true&" + new Date(),
				window,
				"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
}
function showExtbooth(id) {
window
		.showModalDialog(
				"${ctx}/cms/extbooth/tomodifyextbooth.action?id="
						+ id + "&Edit=false&" + new Date(),
				window,
				"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
}
function delExtbooth(id) {
var url = window.ctx + '/cms/extbooth/delextbooth.action'; 
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
						+ "/cms/extbooth/findextboothlist.action")
		.submit();
}
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">
	<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
            <tr bgcolor='#EEF4EA'>
                <td>
                    <table border='0' cellpadding='0' cellspacing='0' height="32">
                        <tr class="search">
                            <td>专题名称：<input type='text' name='objectName' value='$!{ExtboothInfo.objectName}'/></td>
                            <td>类型：
                                <select name="status" id="status">
                                     <option value="" >==请选择==</option>
                                     <option value="0" #if(${ExtboothInfo.type} == '1') selected="selected" #end >单专题</option>
                                     <option value="1" #if(${ExtboothInfo.type} == '2') selected="selected" #end >多专题</option>
                                </select>
                        	</td>
                            <td><input type="button" id="searchb" class="flatbutton" value="查询"/></td>
                            <td><input type="button" id="searchbreset" class="flatbutton" value="重置"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="8" style="padding-left:10px;">专题扩展推荐位列表</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">标题</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">排序</a></td>
				<td width="20%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">类型</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">专题名称</a></td>
				<td width="12%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">图片标识</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">图片地址</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" name="status" class="tb_head">状态</a></td>
				<td>操作</td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            		<td colspan="8"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($s in $pml.pagedModelList)
				<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
					onMouseMove="javascript:this.bgColor='#FCFDEE';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';">
					<td width="20%">$!{s.title}</td>
					<td width="10%">$!{s.sort}</td>
					<td width="10%">#if($!{s.type} == '1') 单专题  #else 多专题  #end</td>
					<td width="10%">$!{s.objectName}</td>
					<td width="10%">$!{s.identify}</td>
					<td width="10%">$!{s.imgurl}</td>
					<td width="10%">#if($!{s.status} == '1') 上线 #else 下线  #end </td>
					<td width="10%">
						<img onClick="editExtbooth('$!s.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
						<img onClick="delExtbooth('$!s.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
					</td>
				</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="8">&nbsp; 
					<input type="button" class="flatbutton" id="addExtbooth" value='添加专题'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="8" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
