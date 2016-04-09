<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发布管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#searchb').click(function(){
//    					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/publish/findpublishlist.action").submit();
   				});
   				$('#reset').click(function(){
   	                $(":input").not(":button,:submit,:reset,:hidden").val('');
   	            });
		});	
		function editPublish(id){
			window.showModalDialog("${ctx}/cms/publish/tomodifypublish.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showPublish(id){
			window.showModalDialog("${ctx}/cms/publish/tomodifypublish.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
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
							<td>名称：<input type='text' name='videoname' value='$!{Publish.videoname}'/></td>
							<td>源地址<input type='text' name='url' value='$!{Publish.url}'/></td>
							<td>状态：
									<select name="status" id="status">
										 <option value="" >==请选择==</option>
											<option value="0" #if(${Publish.status} == '0') selected="selected" #end >下线</option>
    										<option value="1" #if(${Publish.status} == '1') selected="selected" #end >上线</option>
    										<!-- <option value="2" #if(${Publish.status} == '2') selected="selected" #end >预上线</option> -->
									</select>
								</td>
							<td>视频类型：
									<select name="videotype" id="videotype">
										 <option value="" >==请选择==</option>
											<option value="0" #if(${Publish.videotype} == '0') selected="selected" #end >片花</option>
    										<option value="1" #if(${Publish.videotype} == '1') selected="selected" #end >影片</option>
    										
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
				<td height="28" colspan="12" style="padding-left:10px;">发布管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">内部ID</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">导演</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">主演</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="MediaID"  lastOrderBy="$!orderColumn"class="tb_head">源地址</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">视频类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Director"  lastOrderBy="$!orderColumn"class="tb_head">播放类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">排序</a></td>
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
				<td>$!{m.mediaID}</td>
				<td>$!{m.director}</td>
				<td>$!{m.actor}</td>
				<td>$!{m.url}</td>
				<td>#if($!{m.videotype} == '1') 影片  #else 片花 #end</td>
				<td>#if($!{m.live} == '1') 直播 #else点播 #end</td>
				<td>$!{m.rank}</td>
				<td>#if($!{m.status} == '1') 上线  #else 下线 #end</td>
				<td colspan="2">
					<img onClick="editPublish('$!m.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showPublish('$!m.id')" src='${ctx}/static/img/part-list.gif' title='查看' alt='查看' style='cursor:pointer' border='0' width='16' height='16'/>
				</td>
			</tr>
			#end
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="11" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
