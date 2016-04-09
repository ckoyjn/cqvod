<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>  
<HEAD>  
<TITLE>角色分配</TITLE>
#tagLibs()
<script language="javascript" src="${ctx}/static/js/selectRole.js"></script>
<script>
		  function saveAuthority(obj){
		    var roleIds = [];
		    var $selected = $('select#right option');
  			$.each($selected, function(i, $right){
  				roleIds.push($($right).val());
  			})
		    var selVal = roleIds.join(',');
			var url = window.ctx+'/cms/group/addroletogroup.action?groupId='+$!{GroupID}+'&roleId=' + selVal;
			var data = $('#myform').serializeArray();
			$.post(url, data, function() {
				alert("组权限操作成功！");
				//	window.returnValue = true;  
					location.reload();
					window.close();
			});
	  }
</script>
</HEAD>  
<style>  
    center  
    {  
        font-size:12px;  
        color:red;  
        font-weight:bold;  
    }  
    select  
    {  
        font-size:12px;  
        color:green;  
    }  
</style>  
  
<BODY>  
    <span id='feedback'></span>  
     <div align="center">
    <form method="post" name="myform" id="myform">  
  <table border="0" width="400">  
 <tr>  
  <td><CENTER>可选角色</CENTER></td>  
  <td> </td>  
  <td><CENTER>已选角色</CENTER></td>  
 </tr>  
    <tr>  
      <td width="40%">
  <select  multiple name="left" id="left" size="8" style='width:200;'  
  ondblclick="moveOption(document.getElementById('left'), document.getElementById('right'))">  
       #foreach ($lis in $unselect) 
    		<option value="${lis.id}">$!{lis.roleName}</option>
       #end
  </select>  
   </td>  
      <td width="20%" align="center">  
  <input type="button" value=" >> " onclick="moveOption(document.getElementById('left'),document.getElementById('right'))"><br><br>  
  <input type="button" value=" << " onclick="moveOption(document.getElementById('right'), document.getElementById('left'))">  
		<input type="hidden" name="id" value="$!{id}"/>
   </td>  
      <td width="40%">  
  <select  multiple name="right" id="right" size="8" style='width:200;'  
  ondblclick="moveOption(document.getElementById('right'), document.getElementById('left'))">  
	   #foreach ($lis in $select) 
    		<option value="${lis.id}">$!{lis.roleName}</option>
       #end
  </select>  
   </td>  
    </tr>  
 <tr>  
  <td colspan="3">  
  <CENTER>  
  <INPUT TYPE="button" value="保存" onclick="saveAuthority(document.getElementById('right'));">
  </CENTER></td>  
 </tr>  
  </table>  
  </form>
  </div>
</BODY>  
</HTML>  
