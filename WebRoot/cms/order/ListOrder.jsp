<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>订购信息</title>
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
   				$('#addOrder').click(function(){
   				 	window.showModalDialog("${ctx}/cms/order/tomodifyorder.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					var id=$("#id").val();
   					$('#_p').val('1');
                    if(id.length>8){
                        alert("订单号过长");
                        $("#id").val('');
                        return;
                    }
   					$('#queryForm').attr("action",window.ctx+"/cms/order/findorderlist.action").submit();
   				});
   				
   			$('#reset').click(function(){
   				$(":input").not(":button,:submit,:reset,:hidden").val('');
   			});
   			
   			$('#export').click(function(){
                window.open(window.ctx+"/cms/order/exportorder.action");
   			});
		});	
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/order/findorderlist.action").submit();
        }
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">
		<input type="hidden" id="orderColumn" name="orderColumn" value="$!{groups.orderColumn}" />
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='0' cellspacing='0' height="32">
						<tr class="search">
							<td>订单编号<input type='text' name='id' id='id' onkeyup="value=value.replace(/[^(\d)]/g,'')"
							value='$!{order.id}'/></td>
							<td>用户id<input type='text' name='userId' value='$!{order.userId}'/></td>
							<td>订购影片<input type='text' name='filmName' value='$!{order.filmName}'/></td>
							<td>起始：
									<input type="text" id="starttime" name="starttime" value="$!{order.starttime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate" />
							</td>
							<td>截止：
									<input type="text" id="endtime" name="endtime" value="$!{order.endtime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate"/>
							</td>
							<td><input type="button" id="searchb" class="flatbutton" value="查询"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="14" style="padding-left:10px;">订购信息
				<div style="margin-left: 800px; position: absolute;margin-top: -22px;"><input type="button" id="export" class="flatbutton" value="导出"/></div>
				</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">订单编号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="VodID"  lastOrderBy="$!orderColumn"class="tb_head">用户id</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="MediaID"  lastOrderBy="$!orderColumn"class="tb_head">订购影片</a></td>
<!-- 				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">产品名称</a></td> -->
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Mins"  lastOrderBy="$!orderColumn"class="tb_head">订单价格</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Price"  lastOrderBy="$!orderColumn"class="tb_head">订单时间</a></td>
				<!-- 
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Director"  lastOrderBy="$!orderColumn"class="tb_head">操作</a></td>
			       -->
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
				<td>$!{m.id}</td>
				<td>$!{m.userId}</td>
				<td>$!{m.filmName}</td>
<!-- 				<td>$!{m.productname}</td> -->
				<td>$!{m.price}</td>
				<td>$!{m.recordtime}</td>
				<!-- 
				<td colspan="2">
					<img onClick="editMovie('$!m.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='ç¼è¾' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showMovie('$!m.id')" src='${ctx}/static/img/part-list.gif' title="详情" alt="æ¥ç" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delMovie('$!m.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="å é¤" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
				 -->
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="14">&nbsp; 
					<input type="button" class="flatbutton" id="addOrder" value='新增订单'/>  
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
