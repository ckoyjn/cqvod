<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>影片管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	 <script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addMovie').click(function(){
   				 	window.showModalDialog("${ctx}/cms/movie/tomodifymovie.action?id=-1&Edit=true&"+new Date(),window,"dialogWidth:900px;dialogHeight:580px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
   					$('#queryForm').attr("action",window.ctx+"/cms/movie/findmovielist.action").submit();
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
		function delMovie(id){
			var url = window.ctx+'/cms/movie/delmovie.action';
			if(confirm("是否删除"))
				{
			$.post(url, {id:id}, function(feedback) {
 					alert(feedback.message);
					if(feedback.successful) {
						reloadPage();
					}
			}); 
				}
		}
		
		function reloadPage()
        {   
            $('#queryForm').attr("action",window.ctx+"/cms/movie/findmovielist.action").submit();
        }
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post" >
		<input type="hidden" id="orderColumn" name="orderColumn" value="$!{groups.orderColumn}" />
		<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
			<tr bgcolor='#EEF4EA'>
				<td>
					<table border='0' cellpadding='2' cellspacing='0' height="32">
						<tr class="search">
							<td>影片名称：<input type='text' name='name' value='$!{movies.name}'/></td>
							<td>导演：<input type='text' name='director' value='$!{movies.director}'/></td>
							
						</tr>
						<tr class="search">
						<td>主演：<input type='text' name='actor' value='$!{movies.actor}'/></td>
							
							<td>状态：
									<select name="status" id="status">
										 <option value="" >==请选择==</option>
											<option value="0" #if(${movies.status} == '0') selected="selected" #end >下线</option>
    										<option value="1" #if(${movies.status} == '1') selected="selected" #end >上线</option>
    										<!-- <option value="2" #if(${movies.status} == '2') selected="selected" #end >预上线</option> -->
									</select>
								</td>
								<td>上线时间
									<input type="text" id="starttime" name="starttime" value="$!{movies.starttime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate" />
							-
									<input type="text" id="endtime" name="endtime" value="$!{movies.endtime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate"/>
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
				<td height="28" colspan="16" style="padding-left:10px;">影片管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td width="30px;"><a href="javascript:void(0);" onclick="orderBy(this);"  name="Identify"  lastOrderBy="$!orderColumn"class="tb_head">图片标识</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="VodID"  lastOrderBy="$!orderColumn"class="tb_head">产品</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="MediaID"  lastOrderBy="$!orderColumn"class="tb_head">内部ID</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">中文名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Name"  lastOrderBy="$!orderColumn"class="tb_head">英文名称</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Mins"  lastOrderBy="$!orderColumn"class="tb_head">时长</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Price"  lastOrderBy="$!orderColumn"class="tb_head">价格</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Director"  lastOrderBy="$!orderColumn"class="tb_head">导演</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Actor"  lastOrderBy="$!orderColumn"class="tb_head">主演</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Score"  lastOrderBy="$!orderColumn"class="tb_head">评价</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Score"  lastOrderBy="$!orderColumn"class="tb_head">影片类型</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="Stuts"  lastOrderBy="$!orderColumn"class="tb_head">状态</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="rank"  lastOrderBy="$!orderColumn"class="tb_head">排序</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="onlineTime"  lastOrderBy="$!orderColumn"class="tb_head">上线时间</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);"  name="downlineTime"  lastOrderBy="$!orderColumn"class="tb_head">下线时间</a></td>
				<td>操作</td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="16"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($m in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{m.identify}</td>
				<td>$!{m.productname}</td>
				<td>$!{m.mediaID}</td>
				<td>$!{m.name}</td>
				<td>$!{m.eName}</td>
				<td>$!{m.mins}</td>
				<td>$!{m.price}</td>
				<td>$!{m.director}</td>
				<td>$!{m.actor}</td>
				<td>$!{m.score}</td>
			    <td>#if($!{m.type} == '1') 标清  #else 高清  #end</td>
				<td>#if($!{m.status} == '1') 上线  #else #if($!{m.status} == '2') 预上线  #else 下线 #end  #end</td>
				<td>$!{m.rank}</td>
				<td>$!{m.onlineTime}</td>
				<td>$!{m.downlineTime}</td>
				<td >
					<img onClick="editMovie('$!m.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showMovie('$!m.id')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delMovie('$!m.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="16">&nbsp; 
					<input type="button" class="flatbutton" id="addMovie" value='添加影片信息'/>  
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="16" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
