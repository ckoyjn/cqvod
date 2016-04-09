<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>图表数据</title>
#tagLibs()
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/base.css"/>
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/public.css"/>
	    <script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
    <link class="include" rel="stylesheet" type="text/css" href="${ctx}/static/js/jqplot/jquery.jqplot.min.css" />
	<script type="text/javascript" src="${ctx}/static/js/jqplot/jquery.jqplot.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jqplot/plugins/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jqplot/plugins/jqplot.highlighter.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jqplot/plugins/jqplot.cursor.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jqplot/plugins/jqplot.pointLabels.min.js"></script>
	<link rel="stylesheet" type="text/css" hrf="${ctx}/static/js/jqplot/plugins/jquery.jqplot.min.css" />
	<script type="text/javascript" src="${ctx}/static/js/jqplot/plugins/jqplot.dateAxisRenderer.min.js"></script>	
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="${ctx}/static/js/jqplot/excanvas.js"></script><![endif]-->
</head>
	<script type="text/javascript" src="${ctx}/static/js/regStatistics.js"></script>
	<script>
	maxdata = $!{maxpredata};
	var plot1;
	 $(document).ready(function () {
	 	$.jqplot.config.enablePlugins = true;
		var s1 = ${predata};
		if(s1.length!=0){
			drowDayLine('chart1',s1);
		}else{
			$('#chart1').html('数据为空');
		}
		$('#searchb').click(function(){
    		var starttime=$('#starttime').val();
			var endtime=$('#endtime').val();
			var type=$('#showtype').val();
    		$.get(window.ctx+ '/cms/analysis/getaccesschart.action?showtype='+type+'&starttime='+starttime+'&endtime='+endtime+'&action='+$!{access.action},function(result){
    			if (plot1) {
  					plot1.destroy();
  					
 				}
 				$('#chart1').html('');
 				if(result.length!=0){
 					//if(times=='year'){
    				//	plot1 = drowMonthLine('chart1',result);
    				//}else{
    					//Math.max.apply(Math,result)
    					maxdata=result.maxdata;
    					plot1=drowDayLine('chart1',result.data);
    				//}
    			}else{
    				$('#chart1').html('数据为空');
    			}
    		});
    	});
    	$('#showtype').change(function(e){
		var type=$(this).children('option:selected').val();
		var starttime=$('#starttime').val();
		var endtime=$('#endtime').val();
		location.href=window.ctx+ '/cms/analysis/showaccesschart.action?showtype='+type+'&starttime='+starttime+'&endtime='+endtime+'&action='+$!{access.action};
	});
    });
   
	</script>
<body leftmargin="8" topmargin="8" background='./../images/allbg.gif'>
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#cfcfcf' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='./../images/wbg.gif'>
      <table border='0' cellpadding='0' cellspacing='0' height="32">
		<tr class="search">
			 <td>查看：
    			<select name="showtype" id="showtype">
    	         	<option value="1" #if(${access.showtype}=='1') selected #end>访问量</option>
					<option value="2" #if(${access.showtype}=='2') selected #end>访问人数</option>
    	        </select>
            </td>
    	   <td>起始：
				<input type="text" id="starttime" name="starttime" value="$!{access.starttime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate" />
			</td>
			<td>截止：
				<input type="text" id="endtime" name="endtime" value="$!{access.endtime}" style="width:100px" readonly="readonly"	onclick="WdatePicker()" class="Wdate"/>
			</td>
			<td><input type="button" id="searchb" class="flatbutton" value="搜索"/></td>
		</tr>
     </table>
   </td>
  </tr>
</table>
<!--  内容列表   -->
	<table width="98%" height="400px" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7" >
			<td height="28" colspan="10" background="./../images/tbg.gif" style="padding-left:10px;">
			图表数据
			</td>
		</tr>
		<tr bgcolor="#ffffffff">
			<td align="center">
				<div id="chart1" style="width:90%; height:90%"></div>
			</td>
		</tr>
	</table>
</body>
</html>