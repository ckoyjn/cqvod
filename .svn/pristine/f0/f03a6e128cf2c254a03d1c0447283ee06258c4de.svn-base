<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="/www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>菜单权限信息<</title>
#tagLibs()
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/tinytree/themes/tinytree.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
<script>
$(function() {
	
    //	左边树型内容显示
	$('#resource_tree').tinytree({
		url : window.ctx+'/cms/role/buildresourcetree.action?id='+$('#roleId').val(),
		autoload : true,
		checkboxSupport : true,
		onError : function(xhr,status,e) {alert(e.message);},
		showChildren : true,
		openAllNodes : true,
		clickNodeToCheckRadioOrCheckbox : true,
		alsoCheckParent : true,
		alsoCheckChildren : true //是否同时勾选子节点
	});

	$('#roleResource_save').click(function(e){
		var $nodes = $('#resource_tree')[0].tinytree.getSelecetedNodes();
		var roleId = $('#roleId').val();
		var resIds = new Array();
		$.each($nodes, function(i, node) {
			resIds.push(node.nodeId);
		});
		var url = window.ctx + '/cms/role/updateroleresource.do?roleId='+roleId+'&resIds='+resIds.join(",");
		$.post(url, function(feedback) {
			alert(feedback.message);
			if (feedback.successful) {
				window.close();
			} 
		});
	});
	
});
</script>
</head>
<body>
    <div class="m-content">
			<input type="hidden" id="roleId" value="$!{roleId}"/>
       		<div id="m-content-top" class="m-content-top">
    			<ul id="m-boxtitle" class="m-boxtitle">
    	          	<li>菜单选择</li>
    	        </ul>
    	    </div>
    		<div class="m-content-center">
    			<div id="resource_tree"></div>
    		</div>
    </div>
	<div class="btns-section">
		<input type="button" id="roleResource_save" class="flatbutton" value='确定'/>
        <input type="button"  onClick="window.close();" class="flatbutton" value='取消'/>
	</div>
	<script type="text/javascript" src="${ctx}/static/js/tinytree/jquery.tinytree.js"></script>
</body>
</html>	