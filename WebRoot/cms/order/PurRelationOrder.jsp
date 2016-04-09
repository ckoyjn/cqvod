<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>订购关系</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<script type="text/javascript"
				src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/order/findpurrelationlist.action").submit();
   				});
   				
   			$('#reset').click(function(){
   				$(":input").not(":button,:submit,:reset,:hidden").val('');
   			});
   			
   			$('#export').click(function(){
   				var starttime = $("#starttime").val();
   				var endtime = $("#endtime").val();
   				var filmName = $("#filmName").val();
                window.open(window.ctx+"/cms/order/exportpurrelation.action?starttime="+starttime+"&endtime="+endtime+"&filmName="+filmName+"");
   			});
		});	
		function showPurRelationDetail(paytime){
			var filmName = $("#filmName").val();
			window.open("${ctx}/cms/order/showPurRelationDetail.action?paytime="+paytime+"&filmName="+filmName+"&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function reloadPage(){   
            $('#queryForm').attr("action",window.ctx+"/cms/order/findpurrelationlist.action").submit();
        }
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">
		<input type="hidden" id="purRelationColumn" name="purRelationColumn" value="$!{groups.purRelationColumn}" />
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>起始：
									<input type="text" id="starttime" name="starttime" value="$!{purRelation.starttime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate" />
							</td>
							<td>截止：
									<input type="text" id="endtime" name="endtime" value="$!{purRelation.endtime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate"/>
							</td>
							<td>订购影片<input type='text' id="filmName" name='filmName' value='$!{purRelation.filmName}'/></td>
							<td><input type="button" id="searchb" class="flatbutton" value="查询"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="14" style="padding-left:10px;">订购关系
				<div style="margin-left: 100px; position: absolute;margin-top: -18px;">订购总数：${sum1}
				&nbsp;&nbsp;&nbsp;&nbsp;免费点播：${sum3}
				&nbsp;&nbsp;&nbsp;&nbsp;付费点播：${sum4}
				&nbsp;&nbsp;&nbsp;&nbsp;订购总金额：${sum2}
				</div>
				<div style="margin-left: 800px; position: absolute;margin-top: -22px;"><input type="button" id="export" class="flatbutton" value="导出"/></div>
				</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="paytime"  lastOrderBy="$!purRelationColumn"class="tb_head">订购时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="paytotal"  lastOrderBy="$!purRelationColumn"class="tb_head">订购总数</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="paysum"  lastOrderBy="$!purRelationColumn"class="tb_head">订购总额</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="operate"  lastOrderBy="$!purRelationColumn"class="tb_head">操作</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据</h1></td>
                </tr>
            #end
			#foreach ($m in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{m.paytime}</td>
				<td>$!{m.paytotal}</td>
				<td>$!{m.paysum}</td>
				<td>
				<img onClick="showPurRelationDetail('$!m.paytime')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
				</td>
			</tr>
			#end
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
