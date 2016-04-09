<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>专题节目</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
			#tagLibs()
			<link type="text/css" rel="stylesheet"
				href="${ctx}/static/css/base.css" />
			<link type="text/css" rel="stylesheet"
				href="${ctx}/static/css/public.css" />
			<script type="text/javascript"
				src="${ctx}/static/js/validate/jquery.validate.min.js"></script>
			<script type="text/javascript"
				src="${ctx}/static/js/validate/validate-tip.js"></script>
			<style>
table .alink {
	color: blue;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}
</style>
<script>
$(function(){
	window.onunload=function(){
		window.dialogArguments
        .reloadPage();
	}
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
})
function addCategoryMovie(id){
    window.showModalDialog("${ctx}/cms/category/categorymoviemodify.action?id="+id+"&Edit=false&"+new Date(),window,"dialogWidth:900px;dialogHeight:440px;status:yes;scroll:yes;help:no;resizable:no;");
}
function delCategoryMovie() {
        var url = window.ctx
                + '/cms/category/delcategorymovie.action';
        var length = $("input[type='checkbox']:checked").not("#checkall").length;
        if(length<=0) 
        	return alert("请选择电影");
        var data = $('#fom').serializeArray();
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
    $('#fom').attr("action",window.ctx+"/cms/category/categorymovielist.action").submit();
}
</script>
</head>

<body class="ContentBody">
	<form method="post" name="fom" id="fom">
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="2"
			style="border: 1px solid #cfcfcf; background: #ffffff;">
			<tr>
				<td colspan="2">
					<fieldset style="height: 100%;">
						<legend>分类节目列表</legend>
						<table width="98%" border="0" cellpadding="2" cellspacing="1"
				            bgcolor="#CFCFCF" align="center" style="margin-top:8px">
				            <tr align="center" bgcolor="#FBFCE2" height="25">
				                <input type="hidden" name='id' value="$!{categoryid} " />
				                <td><input type="checkbox" id="checkall"></input></td>
				                <td>影片名称</td>
				                <td>导演</td>
				                <td>主演</td>
				            </tr>
				            #if ($null.isNull($list) || $list.size()==0)
				                <tr align='center' bgcolor="#FFFFFF" height="26" align="center" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
				                 <td colspan="11"><h1>没有检索到数据！</h1></td>
				                </tr>
				            #end
				            #foreach ($movie in $list)
				            <tr align='center' bgcolor="#FFFFFF" height="26" align="center"
				                onMouseMove="javascript:this.bgColor='#FCFDEE';"
				                onMouseOut="javascript:this.bgColor='#FFFFFF';">
				                <td><input type="checkbox" name="movieid" value="$!{movie.id}" /></td>
				                <td>$!{movie.name}</td>
				                <td>$!{movie.director}</td>
				                <td>$!{movie.actor}</td>
				            </tr>
				            #end
				            <tr bgcolor="#ffffff">
				                <td height="36" colspan="12" align="center">&nbsp; 
				                    <input type="button" class="flatbutton" onclick="addCategoryMovie($!{categoryid})" value='添加节目'/>
				                    <input type="button" class="flatbutton" onclick="delCategoryMovie()" value='删除节目'/>  
				                </td>
				            </tr>
				        </table>
					</fieldset>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>
