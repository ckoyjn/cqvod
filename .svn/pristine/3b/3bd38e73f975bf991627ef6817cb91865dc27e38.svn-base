<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>影片分类管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
<meta http-equiv="description" content="this is my page"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addActivity').click(function(){
   				 	window.showModalDialog("${ctx}/cms/activity/tomodifyactivity.action?id=-1&Edit=true&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$("#checkall").click(function(){
   			        var flag = $("#checkall").attr("checked");
   			        if(flag=="checked"){
   			            $("input[type='checkbox']").each(function(){
   			                $(this).attr("checked",flag);
   			            })
   			        }else{
   			            $("input[type='checkbox']").each(function(){
   			                $(this).removeAttr("checked");
   			            })
   			        }
   			    });
		});	
		function editActivity(id){
			window.showModalDialog("${ctx}/cms/activity/tomodifyactivity.action?id="+id+"&Edit=true&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showActivity(id){
			window.showModalDialog("${ctx}/cms/activity/tomodifyactivity.action?id="+id+"&Edit=false&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delActivity(id){
			var url = window.ctx+'/cms/activity/delactivity.action';
			var data;
			if(id==null||id=='') {
				var length = $("input[type='checkbox']:checked").not("#checkall").length;
		        if(length<=0) 
		            return alert("请选择电影");
				data = $('#queryForm').serializeArray();
			}else{
				data={id:id};
			}
	        if(confirm("是否删除"))
	        $.post(url, data,
	                function(feedback) {
	                    alert(feedback.message);
	                    if (feedback.successful) {
	                        reloadPage();
	                    }
	                });
		}
		
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/activity/activitylist.action").submit();
        }
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">

		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="8" style="padding-left:10px;">活动管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
			    <td><input type="checkbox" id="checkall"/></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">活动名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">图片标识符</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">排序</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">分类操作</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onmouseover="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($s in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onmouseover="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td><input type="checkbox" name="id" value="$!{s.id}" /></td>
				<td>$!{s.name}</td>
				<td>$!{s.identify}</td>
				<td>#if($!{s.status} == '1') 上线  #else 下线  #end</td>
				<td>$!{s.rank}</td>
				<td>
					<img onClick="editActivity('$!s.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showActivity('$!s.id')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delActivity('$!s.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addActivity" value='添加活动'/>  
					<input type="button" class="flatbutton" value='删除活动' onClick="delActivity('')"/>  
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
