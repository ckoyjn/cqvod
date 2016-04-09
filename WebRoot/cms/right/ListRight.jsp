<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>权限管理</title>
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addRight').click(function(){
   				 	window.showModalDialog("${ctx}/cms/right/tomodifyright.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/right/findrightlist.action").submit();
   				});
   				$('#reset').click(function(){
   					$(":input").not(":button,:submit,:reset,:hidden").val('');
   				});
		});	
		function editRight(id){
			window.showModalDialog("${ctx}/cms/right/tomodifyright.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showRight(id){
			window.showModalDialog("${ctx}/cms/right/tomodifyright.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delRight(id){
			var url = window.ctx+'/cms/right/delright.action';
			if(confirm("是否删除"))
				{
			$.post(url, {id:id}, function(feedback) {
					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
			});
				}
		}
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/right/findrightlist.action").submit();
        }
	</script>
</head>
<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form id="queryForm" name='form0' action='' method='get'>
		<input type="hidden" id="orderColumn" name="orderColumn" value="$!{user.orderColumn}" />
		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#cfcfcf' align="center" style="margin-top:8px">
  			<tr bgcolor='#EEF4EA'>
    			<td>
      				<table border='0' cellpadding='0' cellspacing='0' height="32">
        				<tr class="search">
        					<td>权限名称：<input type='text' name='rightName' value='$!{rights.rightName}'/></td>
        					<td>权限地址：<input type='text' name='rightAction' value='$!{rights.rightAction}'/></td>
       						<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
       						<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
      					</tr>
     				</table>
   				</td>
  			</tr>
		</table>
		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA" >
				<td height="28" colspan="9"  style="padding-left:10px;">权限管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" name="rightName" lastOrderBy="$!orderColumn" class="tb_head">权限名称</a></td>
				<td><a href="javascript:void(0);" name="rightDesc" lastOrderBy="$!orderColumn" class="tb_head" >权限描述</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="phone"  lastOrderBy="$!orderColumn"class="tb_head">权限地址</a></td>
				<td>操作</td>
			</tr>
       		#if ($null.isNull($pagedModelList.pagedModelList) || $pagedModelList.pagedModelList.size()==0)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	<td colspan="9"><h1>没有检索到记录</h1></td>
            </tr>
            #end
			#foreach($u in $pagedModelList.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!u.rightName</td>
				<td>$!u.rightDesc</td>
				<td>$!u.rightAction</td>
				<td>
					<img onClick="editRight('$!u.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showRight('$!u.id')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delRight('$!u.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addRight" value='添加权限'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="12" align="center">#rendPageInfo(${pagedModelList})</td>
			</tr>
	</table>
</form>


</body>
</html>