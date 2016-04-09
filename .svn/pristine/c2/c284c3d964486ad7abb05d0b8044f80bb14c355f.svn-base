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
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/analysis/toaccessanalysis.action").submit();
   				});
   				
   				$('#export').click(function(){
   					$('#queryForm').attr("action",window.ctx+"/cms/analysis/exportAnalysis.action").submit();
   				});
   				
   				
		});	
		function showAccessChar(id,name){
			var start=$('#starttime').val();
			var endt=$('#endtime').val();
			if(start!=''&&endt!=''){
				var reg =/^\d*$/;
				if(id.match(reg)){
					window.open("${ctx}/cms/analysis/showaccesschart.action?action="+id+"&name="+name+"&starttime="+start+"&endtime="+endt+"&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
				}else{
					window.open("${ctx}/cms/analysis/showaccessuser.action?action="+id+"&name="+name+"&starttime="+start+"&endtime="+endt+"&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
				}	
			}else{
				alert("开始/截止时间不能为空！");
			}
		}
		function showAccessData(id){
			var start=$('#starttime').val();
			var endt=$('#endtime').val();
			if(start!=''&&endt!=''){
				window.open("${ctx}/cms/analysis/showaccessdata.action?action="+id+"&starttime="+start+"&endtime="+endt+"&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
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
				<div style="margin-left: 800px; position: absolute;margin-top: 13px;"><input type="button" id="export" class="flatbutton" value="导出"/></div>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="actionname"  lastOrderBy="$!orderColumn"class="tb_head">统计点</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="createTime"  lastOrderBy="$!orderColumn"class="tb_head">访问量</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="status"  lastOrderBy="$!orderColumn"class="tb_head">最后访问时间</a></td>
				<td>操作</td>
			</tr>
			#if ($null.isNull($categories) || $categories.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="8"><h1>没有检索到记录</h1></td>
                </tr>
            #end
			#foreach ($c in $categories)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{c.name}</td>
				<td>$!{c.counter}</td>
				<td>$!{c.maxtime}</td>
				<td colspan="2">
					#if ($c.action!='AllUser'&&$c.action!='NewUser'&&$c.action!='UseUser'&&$c.action!='DemandUser')
					<img onClick="showAccessData('$!c.action')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					#end
					<img onClick="showAccessChar('$!c.action','$!c.name')" src='${ctx}/static/img/htm.gif' title='图表' alt='图表' style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
		</table>
	</form>
</body>
</html>
