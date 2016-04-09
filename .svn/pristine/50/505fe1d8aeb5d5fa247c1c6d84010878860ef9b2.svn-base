<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>影片片花关联管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addAssociate').click(function(){
   				 	window.showModalDialog("${ctx}/cms/associate/tomodifyassociate.action?movieid=-1&previewid=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/associate/findassociatelist.action").submit();
   				});
   				$('#reset').click(function(){
   	                $(":input").not(":button,:submit,:reset,:hidden").val('');
   	            });
		});	
		function editAssociate(movieid,previewid){
			window.showModalDialog("${ctx}/cms/associate/tomodifyassociate.action?movieid="+movieid+"&previewid="+previewid+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showAssociate(movieid,previewid){
			window.showModalDialog("${ctx}/cms/associate/tomodifyassociate.action?movieid="+movieid+"&previewid="+previewid+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delAssociate(movieid,previewid){
			var url = window.ctx+'/cms/associate/delassociate.action';
			if(confirm("是否删除")){
				$.post(url, {movieid:movieid,previewid:previewid}, function(feedback) {
 					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
				}); 
			}
		}
		
		function reloadPage() {
			$('#queryForm').attr("action",window.ctx+"/cms/associate/findassociatelist.action").submit();
		}
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post" >
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>影片名称：<input type='text' name='MovieName' value='$!{associate.MovieName}'/></td>
							<td>片花名称：<input type='text' name='PreviewName' value='$!{associate.PreviewName}'/></td>
							<td>MediaID：<input type='text' name='MediaID' value='$!{associate.MediaID}'/></td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="14" style="padding-left:10px;">影片片花关联管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td width="45px;"><a href="javascript:void(0);" onclick="orderBy(this);" name="MID"  lastOrderBy="$!orderColumn"class="tb_head">影片ID</a></td>
				<td width="45px;"><a href="javascript:void(0);" onclick="orderBy(this);" name="PID"  lastOrderBy="$!orderColumn"class="tb_head">片花ID</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" name="PMediaID" lastOrderBy="$!orderColumn"class="tb_head">MediaID</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" name="MName" lastOrderBy="$!orderColumn"class="tb_head">影片名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" name="PName" lastOrderBy="$!orderColumn"class="tb_head">片花名称</a></td>
				<td>操作</td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($m in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{m.Movieid}</td>
				<td>$!{m.Previewid}</td>
				<td>$!{m.MediaID}</td>
				<td>$!{m.MovieName}</td>
				<td>$!{m.PreviewName}</td>
				<td >
					<img onClick="editAssociate('$!m.Movieid','$!m.Previewid')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showAssociate('$!m.Movieid','$!m.Previewid')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delAssociate('$!m.Movieid','$!m.Previewid')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="14">&nbsp; 
					<input type="button" class="flatbutton" id="addAssociate" value='添加关联信息'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="14" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
