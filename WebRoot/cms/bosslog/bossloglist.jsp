<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>统计数据</title>
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
				$('#queryForm').attr("action",window.ctx+"/cms/bosslog/bossloglist.action").submit();
			});
	});	
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>智能卡号：
									<input type="text" id="smartcardid" name="smartcardid" value="$!{bl.smartcardid}" style="width:100px"/>
							</td>
							<td>电子券号：
									<input type="text" id="evcnid" name="evcnid" value="$!{bl.evcnid}" style="width:100px"/>
							</td>
							<td>起始：
									<input type="text" id="startTime" name="startTime" value="$!{bl.startTime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate" />
							</td>
							<td>截止：
									<input type="text" id="stopTime" name="stopTime" value="$!{bl.stopTime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate"/>
							</td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
						</tr>
					</table></td>
			</tr>
		</table>

		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="8" style="padding-left:10px;">对账数据信息</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">对账id</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">智能卡号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">电子券号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">金额</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">时间</a></td>
				</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($s in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{s.id}</td>
				<td>$!{s.smartcardid}</td>
				<td>$!{s.evcnid}</td>
				<td>$!{s.amount}</td>
				<td>#if($!{s.errcode} == '0') 成功   #else 失败  #end</td>
				<td>#if($!{s.type} == '0') 充值  #else 撤回  #end</td>
				<td>$!{s.recordTime}</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="26" colspan="12">&nbsp; 
					
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="20" colspan="12">&nbsp; 
					充值总金额：$!{SucceedCount}
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="20" colspan="12">&nbsp; 
					撤回总金额：$!{DefeatedCount}
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="20" colspan="12">&nbsp; 
					订单总金额：$!{orderCount}
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
</body>
</html>
