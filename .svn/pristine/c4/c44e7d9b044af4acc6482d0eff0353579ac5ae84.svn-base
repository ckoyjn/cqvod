<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>计次卡使用信息</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addcardepk').click(function(){
   				 	window.showModalDialog("${ctx}/cms/card/tomodifycardepk.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					var epkId=$.trim($("#epkId").val());
   					var evcnId=$.trim($("#evcnId").val());
   					$('#_p').val('1');
                    if(epkId.length>8){
                        alert("批次卡长度不能超过８位数");
                        $("#epkId").val('');
                        return;
                    }
                    if(evcnId.length>10){
                        alert("计次卡长度不能超过10位数");
                        $("#evcnId").val('');
                        return;
                    }
   					
   					$('#queryForm').attr("action",window.ctx+"/cms/card/finduseinfolist.action").submit();
   				});
   				
   			$('#reset').click(function(){
   				$(":input").not(":button,:submit,:reset,:hidden").val('');
   			});
		});	
		function editMovie(id){
			window.showModalDialog("${ctx}/cms/movie/tomodifymovie.action?id="+id+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showMovie(id){
			window.showModalDialog("${ctx}/cms/movie/tomodifymovie.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function updateCard(evcnId,status){
			var url = window.ctx+'/cms/card/updateCard.action';
			$.post(url, {evcnId:evcnId,status:status}, function(feedback) {
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
							<td>观影码号<input type='text' name='evcnId' onkeyup="value=value.replace(/[^(\d)]/g,'')"
							id='evcnId' value='$!{cardEpk.evcnId}'/></td>
							<td>所属批次<input type='text' name='epkId' id='epkId' onkeyup="value=value.replace(/[^(\d)]/g,'')"
							value='$!{cardEpk.epkId}'/></td>
							<td><input type="button" id="searchb" class="flatbutton" value="查询"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="12" style="padding-left:10px;">计次卡使用信息</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">观影码号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">所属批次</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Mins"  lastOrderBy="$!orderColumn"class="tb_head">使用情况</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Mins"  lastOrderBy="$!orderColumn"class="tb_head">观看的影片</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Price"  lastOrderBy="$!orderColumn"class="tb_head">使用时间</a></td>
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
				<td>$!{m.evcnId}</td>
				<td>$!{m.epkId}</td>
				<td>
				#if($!{m.operateStatus}==0)
				未使用
				#end
				#if($!{m.operateStatus}==1)
                                        已使用
                #end
                <td>
                $!{m.evcnProgrameNames}</td>
                <td>$!{m.evcnUsetime}</td>
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
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
