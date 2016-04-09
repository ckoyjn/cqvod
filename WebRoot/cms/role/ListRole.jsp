<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>角色管理</title>
	#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addRole').click(function(){
   				 	window.showModalDialog("${ctx}/cms/role/tomodifyrole.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/role/findrolelist.action").submit();
   				});
   				$('#reset').click(function(){
   					$(":input").not(":button,:submit,:reset,:hidden").val('');
   				});
		});	
		function editRole(id){
			window.showModalDialog("${ctx}/cms/role/tomodifyrole.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showRole(id){
			window.showModalDialog("${ctx}/cms/role/tomodifyrole.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delRole(id){
			var url = window.ctx+'/cms/role/delrole.action';
			if(confirm("是否删除")){
			$.post(url, {id:id}, function(feedback) {
					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
			});
			}
		}
		function impResour(id){
			window.showModalDialog("${ctx}/cms/role/toupdateroleresource.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:400px;dialogHeight:900px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function impOperation(id){
			window.showModalDialog("${ctx}/cms/role/toupdateroleright.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/role/findrolelist.action").submit();
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
        					<td>角色名称<input type='text' name='roleName' value='$!{role.roleName}'/></td>
							<td>状态
									<select name="status" id="status">
                                     		<option value="">==请选择==</option>
    										<option value="0" #if(${role.status} == '0') selected="selected" #end >禁用</option>
    										<option value="1" #if(${role.status} == '1') selected="selected" #end >启用</option>
	       							</select>
        					</td>
       						<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
       						<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
      					</tr>
     				</table>
   				</td>
  			</tr>
		</table>
		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA" >
				<td height="28" colspan="9"  style="padding-left:10px;">角色管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" name="roleName" lastOrderBy="$!orderColumn" class="tb_head">角色名称</a></td>
				<td><a href="javascript:void(0);" name="roleName" lastOrderBy="$!orderColumn" class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" name="createTime" lastOrderBy="$!orderColumn" class="tb_head" >创建时间</a></td>
				<td>操作</td>
			</tr>
       		#if ($null.isNull($pagedModelList.pagedModelList) || $pagedModelList.pagedModelList.size()==0)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	<td colspan="9"><h1>没有检索到记录</h1></td>
            </tr>
            #end
			#foreach($u in $pagedModelList.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!u.roleName</td>
				<td>#if($!{u.status} == '0') 禁用 #elseif ($!{u.status} == '1') 启用  #end </td>
				<td>$!{u.createTime}</td>
				<td>
					<img onClick="editRole('$!u.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showRole('$!u.id')" src='${ctx}/static/img/part-list.gif' title='查看' alt='查看' style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delRole('$!u.id')" src='${ctx}/static/img/gtk-del.png' title='删除' alt='删除' style='cursor:pointer' border='0' width='16' height='16' />
					<img src='${ctx}/static/img/trun.gif' title="分配资源" alt="分配资源"  onClick="impResour('$!{u.id}');" style='cursor:pointer'  border='0' width='16' height='16' />
					<img src='${ctx}/static/img/trun.gif' title="分配操作" alt="分配操作"  onClick="impOperation('$!{u.id}');" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addRole" value='添加角色'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="12" align="center">#rendPageInfo(${pagedModelList})</td>
			</tr>
	</table>
</form>


</body>
</html>