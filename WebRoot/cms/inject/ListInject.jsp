<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>注入管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addInject').click(function(){
   				 	window.showModalDialog("${ctx}/cms/inject/tomodifyinject.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/inject/findinjectlist.action").submit();
   				});
   				$('#reset').click(function(){
   	                $(":input").not(":button,:submit,:reset,:hidden").val('');
   	            });
		});	
		function updateInject(id){
			var url = window.ctx+'/cms/inject/updateinject.action';
			$("#loading").show();
			$.post(url, {id:id}, function(feedback) {
				$("#loading").hide();
					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
			}); 
		}
		function editInject(id){
			window.showModalDialog("${ctx}/cms/inject/tomodifyinject.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showInject(id){
			window.showModalDialog("${ctx}/cms/inject/tomodifyinject.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delInject(id){
			var url = window.ctx+'/cms/inject/delinject.action';
			$("#loading").show();
			$.post(url, {id:id}, function(feedback) {
				$("#loading").hide();
					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
			}); 
		}
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="get">
		<input type="hidden" id="orderColumn" name="orderColumn" value="$!{groups.orderColumn}" />
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>名称：<input type='text' name='videoname' value='$!{Inject.videoname}'/></td>
							<td>源地址<input type='text' name='url' value='$!{Inject.url}'/></td>
							<td>状态：
									<select name="status" id="status">
										 <option value="" >==请选择==</option>
											<option value="0" #if(${Inject.status} == '0') selected="selected" #end >未注入</option>
    										<option value="1" #if(${Inject.status} == '1') selected="selected" #end >已注入</option>
									</select>
								</td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
							
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"d
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="12" style="padding-left:10px;">注入管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="MediaID"  lastOrderBy="$!orderColumn"class="tb_head">源地址</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">视频类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Director"  lastOrderBy="$!orderColumn"class="tb_head">播放类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Stuts"  lastOrderBy="$!orderColumn"class="tb_head">状态</a></td>
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
				<td>$!{m.videoname}</td>
				<td>$!{m.url}</td>
				<td>#if($!{m.videotype} == '1') 影片  #else 片花 #end</td>
				<td>#if($!{m.live} == '1') 直播 #else点播 #end</td>
				<td>#if($!{m.status} == '0') 未注入 #else已注入 #end</td>
				<td colspan="2">
					<img onClick="editInject('$!m.id')" src='${ctx}/static/img/gtk-edit.png' title='更新' alt='更新' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showInject('$!m.id')" src='${ctx}/static/img/part-list.gif' title='查看' alt='查看' style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delInject('$!m.id')" src='${ctx}/static/img/gtk-del.png' title='删除' alt='删除' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="updateInject('$!m.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addInject" value='添加注入'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="11" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
	</form>
	<div id="loading">
		<div id="loadingContent">
			<img src="${ctx}/static/img/loadinglit.gif"/>
			<div style="float:left;margin-top:17px;font-size:12px;font-weight: bold">保存中，请稍后...</div> 
		</div>
	</div>
</body>
</html>
