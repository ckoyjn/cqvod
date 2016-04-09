<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>观影记录</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
#tagLibs()
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	<script type="text/javascript">
	jQuery(document).ready(function(){
        
        $('#searchb').click(function(){
            $('#_p').val('1');
            $('#queryForm').attr("action",window.ctx+"/cms/watchrecode/watchrecodelist.action").submit();
        });
        $('#reset').click(function(){
            $("#pname").val('');
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
                            <td>影片名称：<input type='text' name='pname' id="pname"  value='$!{watchrecode.pname}'/></td>
                            <td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
                            <td><input type="button" id="reset" class="flatbutton" value="重置"/></td>
                        </tr>
                    </table></td>
            </tr>
        </table>
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#CFCFCF" align="center" style="margin-top:8px">
			<tr bgcolor="#EEF4EA">
				<td height="28" colspan="8" style="padding-left:10px;">观影记录</td>
			</tr>
			<tr align="center" bgcolor="#FBFCE2" height="25">
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">用户卡号</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">观看影片</a></td>
				<td><a href="javascript:void(0);" onclick="orderBy(this);" class="tb_head">观看时间</a></td>
			</tr>
			#if ($null.isNull($pml.pagedModelList) || $pml.pagedModelList.size()==0)
            	<tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
            	 <td colspan="11"><h1>没有检索到数据！</h1></td>
                </tr>
            #end
			#foreach ($f in $pml.pagedModelList)
			<tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				onMouseMove="javascript:this.bgColor='#FCFDEE';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td>$!{f.userId}</td>
				<td>$!{f.pname}</td>
				<td>$!{f.playTime}</td>
			</tr>
			#end
			
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
