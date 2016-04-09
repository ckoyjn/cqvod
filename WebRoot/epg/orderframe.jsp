<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%
	int typeId = Integer.parseInt(request.getParameter("typeId"));
	int vodId = Integer.parseInt(request.getParameter("vodId"));
	int playType = Integer.parseInt(request.getParameter("playType"));
	int baseFlag = Integer.parseInt(request.getParameter("baseFlag"));
	String idType =request.getParameter("idType");
	String appBackUrl = request.getParameter("appBackUrl");
%>

<%
	int userid= Integer.parseInt(request.getParameter("userid"));
	int price=Integer.parseInt( request.getParameter("price"));
	int type=Integer.parseInt( request.getParameter("type"));
	int status=Integer.parseInt( request.getParameter("status"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../static/js/epgCommon.js"></script>
<script type="text/javascript">
/* 
{
    typeId:-1,
    vodId:PACKAGE201506000013-gehua,
    playType:1,
    idType:FSN,
   baseFlag:2,
   appBackUrl="epg/orderframe.jsp"
} */
	
	window.onload=function(){
		sendOrder();
	}
	
	var typeId=<%=typeId%>;
	var vodId = <%=vodId%>;
	var playType = <%=playType%>;
	var baseFlag = <%=baseFlag%>;
	var idType = <%=idType%>;
	var appBackUrl = <%=appBackUrl%>;
	// 	获取价钱
	function sendOrder(){
		$ajax({
			url:"http://59.174.167.106:4040/cqvod/REST/AppointOrder/sendOrder",
			data:"typeId="+typeId+"&vodId="+vodId+"&playType="+playType+"&idType="+idType+"&baseFlag="+baseFlag+"&appBackUrl= ",
			method:"post",
			handler: function(xmlHttp){
				var result = eval("("+xmlHttp.responseText+")");
				$("price").val(result.price);
			}
		});
	}
	
	// 	订购影片
	function Order(){
		$ajax({
			url:"http://59.174.167.106:4040/cqvod/REST/AppointOrder/sendOrder",
			data:"typeId="+typeId+"&vodId="+vodId+"&playType="+playType+"&idType="+idType+"&baseFlag="+baseFlag+"&appBackUrl= ",
			method:"post",
			handler: function(xmlHttp){
				var result = eval("("+xmlHttp.responseText+")");
				type="order";
				//调用播放影片函数
				playMovie();
			}
		});
	}
	
	var userid=<%=userid%>;
	var price = $("price");
	var type = <%=type%>;
	var status = <%=status%>;
// 	播放影片
	function playMovie(){
		$ajax({
			url:"http://59.174.167.106:4040/cqvod/REST/AppointOrder/sendOrder",
			data:"userid="+userid+"&vodId="+vodId+"&price="+price+"&type="+type+"&status="+status,
			method:"post",
			handler: function(xmlHttp){
				var result = eval("("+xmlHttp.responseText+")");
				if(type=='play'&result==null){
					alert("2s直接播放...");
					return ;
				}else if(type='order'&result==null){
					alert("不直接播放");
					return ;
				}else if(type='order'&result.code==0){
					alert("播放影片");					
				}else{
					showTipWindow(result.code);
				}
			}
		});
	}
	
// 	错误函数
	function showTipWindow (mes){
		if(mes==1){
			alert("参数不合法");
		}else if(mes==2){
			alert("用户不存在或用户状态不可用");
		}else if(mes==3){
			alert("网络异常");
		}else if(mes==4){
			alert("数据库异常");
		}else if(mes==5){
			alert("应用程序异常");
		}
	}
	
</script>
</head>
<body>
价格：<input value="" id="price">
</body>
</html>