<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>专题管理</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
		jQuery(document).ready(function(){
   				$('#addSpecial').click(function(){
   				 	window.showModalDialog("${ctx}/cms/special/tomodifyspecial.action?id=-1&Edit=true&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
   				 });
   				$('#searchb').click(function(){
   					$('#_p').val('1');
                    $('#queryForm').attr("action",window.ctx+"/cms/special/speciallist.action").submit(); 
				});
   				$('#searchbreset').click(function(){
   				  $('input,select').not(':button').val('');
   				});
   				
		});	
		function editSpecial(id){
			window.showModalDialog("${ctx}/cms/special/tomodifyspecial.action?id="+id+"&Edit=true&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function showSpecial(id){
			window.showModalDialog("${ctx}/cms/special/tomodifyspecial.action?id="+id+"&Edit=false&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function editSpecialMovie(id) {
			window.showModalDialog("${ctx}/cms/special/specialmovielist.action?id="+id+"&"+new Date(),window,"dialogLeft:220px;dialogTop:100px;dialogWidth:900px;dialogHeight:400px;status:yes;scroll:yes;help:no;resizable:no;");
		}
		function delSpecial(id){
			var url = window.ctx+'/cms/special/delspecial.action';
		    var data={id:id};
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
            $('#queryForm').attr("action",window.ctx+"/cms/special/speciallist.action").submit();
        }
	</script>
</head>

<body leftmargin="8" topmargin="8" background='${ctx}/static/img/allbg.gif'>
	<form name="form2" action="" id="queryForm" method="post">
	<table width='98%' border='0' cellpadding='1' cellspacing='1' align='center' bgcolor='#cfcfcf'  style="margin-top:8px">
            <tr bgcolor='#EEF4EA'>
                <td>
                    <table border='0' cellpadding='0' cellspacing='0' height="32">
                        <tr class="search">
                            <td>专题名称：<input type='text' name='name' value='$!{map.name}'/></td>
                            <td>状态：
                                    <select name="status" id="status">
                                         <option value="" >==请选择==</option>
                                            <option value="0" #if(${map.status} == '0') selected="selected" #end >下线</option>
                                            <option value="1" #if(${map.status} == '1') selected="selected" #end >上线</option>
                                    </select>
                                </td>
                            <td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
                            <td><input type="button" id="searchbreset" class="flatbutton" value="重置"/></td>
                        </tr>
                    </table></td>
            </tr>
        </table>

		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="8" style="padding-left:10px;">专题管理</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">专题名称</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">图片标识</a></td>
				<td width="20%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">关联影片</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">状态</a></td>
				<td width="12%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">创建时间</a></td>
				<td width="10%"><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">操作</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="8"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($s in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td width="20%">$!{s.name}</td>
				<td width="10%">$!{s.identify}</td>
				<td style="word-break: break-all;word-wrap:break-word;" width="10%">$!{s.movieNames}</td>
				<td width="10%">#if($!{s.status} == '1') 上线  #else 下线  #end</td>
				<td width="12%">$!{s.createtime}</td>
				<td width="10%">
					<img onClick="editSpecial('$!s.id')" src='${ctx}/static/img/gtk-edit.png' title='编辑' alt='编辑' style='cursor:pointer' border='0' width='16' height='16' />
					<img onClick="showSpecial('$!s.id')" src='${ctx}/static/img/part-list.gif' title="查看" alt="查看" style='cursor:pointer' border='0' width='16' height='16'/>
					<img onClick="delSpecial('$!s.id')" src='${ctx}/static/img/gtk-del.png' title="删除" alt="删除" style='cursor:pointer' border='0' width='16' height='16' />
				</td>
			</tr>
			#end
			<tr bgcolor="#ffffff">
				<td height="36" colspan="8">&nbsp; 
					<input type="button" class="flatbutton" id="addSpecial" value='添加专题'/>  
					<!--  <input type="button" class="flatbutton" value='删除专题' onClick="delSpecial('')"/> --> 
				</td>
			</tr>
			<tr align="right" bgcolor="#F9FCEF">
				<td height="36" colspan="8" align="center">
					<div class="pagelistbox">
						#rendPageInfo(${pml})
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
