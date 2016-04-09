<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>节目内容管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addRecommend').click(function(){
   				 	window.showModalDialog("${ctx}/cms/recommend/tomodifyrecommend.action?id=-1&Edit=true&objecttype=2&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/recommend/findrecommendlist.action").submit();
   				});
   				$('#reset').click(function(){
   	                $(":input").not(":button,:submit,:reset,:hidden").val('');
   	            });
		});	
		function editRecommend(id,objecttype){
			window.showModalDialog("${ctx}/cms/recommend/tomodifyrecommend.action?id="+id+"&objecttype="+objecttype+"&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showRecommend(id,objecttype){
			window.showModalDialog("${ctx}/cms/recommend/tomodifyrecommend.action?id="+id+"&objecttype="+objecttype+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delRecommend(id){
			var url = window.ctx+'/cms/recommend/delrecommend.action';
			if(confirm("是否删除"))
				{
			$.post(url, {id:id}, function(feedback) {
					alert(feedback.message);
					if(feedback.successful) {
						location.reload();
					}
			}); 
				}
		}
		
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/recommend/findrecommendlist.action").submit();
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
							<td>推荐名称：<input type='text' name='name' value='$!{rec.name}'/></td>
							<td>状态：
									<select name="status" id="status">
										 <option value="" >==请选择==</option>
											<option value="0" #if(${rec.status} == '0') selected="selected" #end >下线</option>
    										<option value="1" #if(${rec.status} == '1') selected="selected" #end >上线</option>
									</select>
								</td>
							<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
							<td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
						</tr>
					</table></td>
			</tr>
		</table>
	
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="12" style="padding-left:10px;">节目内容管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">推荐名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">推荐类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">图片标识</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">上线时间</a></td>
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
				<td>$!{m.name}</td>
				<td>#if($!{m.objecttype} == '0') 电影  #else 专题  #end</td>
				<td>$!{m.Identify}</td>
				<td>$!{m.onlinetime}</td>
				<td>#if($!{m.status} == '1') 上线  #else 下线  #end</td>
				<td colspan="2">
					<img onClick="editRecommend('$!m.id','$!m.objecttype')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showRecommend('$!m.id','$!m.objecttype')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delRecommend('$!m.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="12">&nbsp; 
					<input type="button" class="flatbutton" id="addRecommend" value='新增特别推荐节目'/>  
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
