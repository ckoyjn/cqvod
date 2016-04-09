<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>资源管理</title>
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addResource').click(function(){
   				 	window.showModalDialog("${ctx}/cms/resource/tomodifyresource.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/resource/findresourcelist.action").submit();
   				});
   				$('#reset').click(function(){
   					$(":input").not(":button,:submit,:reset,:hidden").val('');
   				});
		});	
		function editResource(id){
			window.showModalDialog("${ctx}/cms/resource/tomodifyresource.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showResource(id){
			window.showModalDialog("${ctx}/cms/resource/tomodifyresource.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delResource(id){
			var url = window.ctx+'/cms/resource/delresource.action';
			if(confirm("是否删除")){
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
            $('#queryForm').attr("action",window.ctx+"/cms/resource/findresourcelist.action").submit();
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
        					<td>资源名：<input type='text' name='resourcename' value='$!{resources.resourcename}'/></td>
        					<td>描述：<input type='text' name='resourcedesc' value='$!{resources.resourcedesc}'/></td>
							<td>地址：<input type='text' name='action' value='$!{resources.action}'/></td>
       						<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
       						<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
      					</tr>
     				</table>
   				</td>
  			</tr>
		</table>
		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA" >
				<td height="28" colspan="9"  style="padding-left:10px;">资源管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" name="loginname" lastOrderBy="$!orderColumn" class="tb_head">资源名称</a></td>
				<td><a href="javascript:void(0);" name="userName" lastOrderBy="$!orderColumn" class="tb_head" >资源描述</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="areaid"  lastOrderBy="$!orderColumn"class="tb_head">资源地址</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="status"  lastOrderBy="$!orderColumn"class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" name="createtime"  lastOrderBy="$!orderColumn"class="tb_head">创建时间</a></td>
				<td>操作</td>
			</tr>
       		#if ($null.isNull($pagedModelList.pagedModelList) || $pagedModelList.pagedModelList.size()==0)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	<td colspan="9"><h1>没有检索到记录</h1></td>
            </tr>
            #end
			#foreach($u in $pagedModelList.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!u.resourcename</td>
				<td>$!u.resourcedesc</td>
				<td>$!u.action</td>
				<td>#if($!{u.status} == '0') 禁用  #elseif ($!{u.status} == '1') 启用  #end </td>
				<td>$!{u.createtime}</td>
				<td>
					<img onClick="editResource('$!u.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showResource('$!u.id')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delResource('$!u.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addResource" value='添加资源'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="12" align="center">#rendPageInfo(${pagedModelList})</td>
			</tr>
	</table>
</form>


</body>
</html>