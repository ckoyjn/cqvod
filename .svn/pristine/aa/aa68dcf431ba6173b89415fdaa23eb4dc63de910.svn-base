<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>访问统计</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
    <script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#searchb').click(function(){
   					$('#queryForm').attr("action",window.ctx+"/cms/analysis/showaccessdata.action").submit();
   				});
		});	
		function editGroup(id){
			window.showModalDialog("${ctx}/cms/group/tomodifygroup.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showAccessData(id){
			var start=$('#starttime').val();
			var endt=$('#endt').val();
			if(start!=''&&endt!=''){
				window.showModalDialog("${ctx}/cms/analysis/showaccessdata.action?action="+id+"&starttime="+start+"&endtime="+endt+"&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
			}else{
				alert("开始/截止时间不能为空！");
			}
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
						<input type="hidden" id="action" name="action" value="$!{access.action}" />
							<td>起始：
									<input type="text" id="starttime" name="starttime" value="$!{access.starttime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate" />
							</td>
							<td>截止：
									<input type="text" id="endtime" name="endtime" value="$!{access.endtime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate"/>
							</td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="8" style="padding-left:10px;">用户访问统计</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="actionname"  lastOrderBy="$!orderColumn"class="tb_head">User ID</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="createTime"  lastOrderBy="$!orderColumn"class="tb_head">访问名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="status"  lastOrderBy="$!orderColumn"class="tb_head">访问时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="status"  lastOrderBy="$!orderColumn"class="tb_head">访问类型</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="8"><h1>没有检索到记录</h1></td>
                </tr>
            #end
			#foreach ($c in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{c.userId}</td>
				<td>$!{c.medianame}</td>
				<td>$!{c.recordTime}</td>
				<td>#if($!{c.type} == '1') 标清  #elseif($!{c.type} == '0') 高清  #else 未知 #end</td>
			</tr>
			#end
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="11" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
		</table>
	</form>
</body>
</html>
