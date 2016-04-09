<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%-- <%
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
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Utf-8">
<title>Insert title here</title>
<style type="text/css">
* {margin:0px;padding:0px; font-family:Microsoft Yahei; font-weight: normal;}
ul,p,h1,h2,h3,h4,h5,h6,dl,dd,dt,button,input,marquee,table{margin: 0px; padding: 0px;}
li{list-style: none; }
#order{padding-left: 100px;width: 500px;height: 80px;}
#order li{color: Silver;}
#okPlay{position:absolute;left: 425px;top:300px;}
#menu li { position: absolute;left:100px;z-index:7; }
#detail {position: absolute;left: 349px; top:116px; background-image:url("../static/epgimg/lsbjk.jpg");
 width:290px;height:260px;}
/* #ipbj{background-image: url('../static/epgimg/ipbj.jpg');padding-bottom: 10px; width: 200px;height: 32px;} */
</style>
<script type="text/javascript" src="../static/js/epgCommon.js"></script>
<script type="text/javascript">
	
	window.onload=function(){
// 		var url = iPanel.eventFrame.pre_epg_url+"/defaultHD/en/ hidden_byTime_gehua.jsp?typeId=-1&vodId=PACKAGE201506000013-gehua&playType=1&idType=FSN&baseFlag=2&appBackUrl= ";
// 		getPrice(url);
		this.focus();
	}
	
	var selectIndex=0;/*0=获取价格  1=订购  2=播放 */
	
	function setSrc(url){
		$("interface").src=url;
	}
	
	function showTipWindow (mes){
		if(selectIndex=0){
			$("playPrice").innerHTML=mes;
			
		}else if(selectIndex=1){
			
		}else if(selectIndex=2){
			
		}
	}
	
	var playWay={
		list:["gyq","wx","zfb","ds","okPlay","close"],
		wayIndex:0,
		setFocus:function(){
			if (this.wayIndex<=3){
				$("tcjdk").style.display="block";
				$("tcjdk").style.top=parseInt($(this.list[this.wayIndex]).style.top)-4+"px";
				$("okPlay"). src="../static/epgimg/an01.png";
				$("close"). src="../static/epgimg/gb01.png";
//	 			$(this.list[this.wayIndex]+"_"+this.wayIndex).src="../static/epgimg/an0"+(this.wayIndex+1)+"b.jpg";
			}else if(this.wayIndex==4){
				this.buttonBlur();
				$("okPlay").src="../static/epgimg/an02.png";
				$("close"). src="../static/epgimg/gb01.png";
			}else if (this.wayIndex==5){
				this.buttonBlur();
				$("close"). src="../static/epgimg/gb02.png";
				$("okPlay"). src="../static/epgimg/an01.png";
			}
		},buttonBlur:function(){
			$("tcjdk").style.display="none";
		},moveUp:function(){
			if(this.wayIndex<4&&this.wayIndex!=0){
				this.wayIndex--;
			}else if(this.wayIndex==4){
				this.wayIndex++;
			}
			this.setFocus();
		},moveDown:function(){
			if(this.wayIndex<3){
				this.wayIndex++;
			}else if(this.wayIndex==5){
				this.wayIndex--;
			}
			this.setFocus();
		},moveLeft:function(){
			if(this.wayIndex>3){
				this.wayIndex--;
				this.setFocus();
			}
		},moveRight:function(){
			if(this.wayIndex>=3&&this.wayIndex<5){
				this.wayIndex++;
				this.setFocus();
			}
		},doConfirm:function(){
			if(this.wayIndex<4){
				for (i = 0; i < this.list.length-2; i++) {
					if(i==this.wayIndex){
						$(this.list[this.wayIndex]+"_"+this.wayIndex).src="../static/epgimg/an0"+(this.wayIndex+1)+"b.jpg";
					}else{
						$(this.list[i]+"_"+i).src="../static/epgimg/an0"+(i+1)+"a.jpg";
					}	
				}
			}else if(this.wayIndex==5){
				/* 关闭按钮 */
				window.parent.closeIframe();
// 				window.parent.window.onload();
			}
		}
		}
	
	
	function moveLeft(){
		playWay.moveLeft();	
	}
	
	function moveRight(){
		playWay.moveRight();	
	}
	
	function moveUp(){
		playWay.moveUp();	
	}
	
	function moveDown(){
		playWay.moveDown();	
	}
	
	function doConfirm(){
		playWay.doConfirm();	
	}
	
	
	
</script>

</head>
<body style=" background-image: url('../static/epgimg/tcbj.png'); ">

<iframe id="interface" src="" style="display: none;"></iframe>
<div style="position: absolute;z-index: 10; left:78px;top: 40px;" >
	<ul>
		<li style="font-size:27px;color:white; padding-bottom: 18px; ">请选择您的支付方式</li>
		<li><img id="close" style="position: absolute;left:710px;top: -3px;" src="../static/epgimg/gb01.png"></li>
		<li id="playPrice" style="font-size:27px;margin-bottom:-6px;padding-left:5px; color: Turquoise;">您需要支付26.0元</li>
		<li style="padding-left:5px"><img height="2px;" width="725px;" src="../static/epgimg/line.jpg"/></li>
		<li id="order">
			<ul id="menu">
				<li id="gyq" style="top:116px ;"><img id="gyq_0" src="../static/epgimg/an01b.jpg"></li>
				<li id="wx" style="top:176px ;"><img id="wx_1" src="../static/epgimg/an02a.jpg"></li>
				<li id="zfb" style="top:236px ;"><img id="zfb_2" src="../static/epgimg/an03a.jpg"></li>
				<li id="ds" style="top:296px ;"><img id="ds_3" src="../static/epgimg/an04a.jpg"></li>
				<li id="tcjdk" style="top:114px ;left:95px"><img src="../static/epgimg/tcjdk.png"></li>
			</ul>
			<ul id="detail" >
				<li><input type="text" value="" size="28px;" style="margin-top:40px; margin-left:19px; margin-bottom:20px; height: 35px;background-image: url('../static/epgimg/ipbj.jpg');" /></li>
				<li><img src="../static/epgimg/gym.jpg" style="padding-left: 20px;padding-bottom: 50px;"/></li>
				</ul>
			
			<ul><li  id="mess" style="margin-top: 260px;font-size: 20px;color: white;">提示信息提示信息</li><li style=""><img id="okPlay"  src="../static/epgimg/an01.png"/></li>
			</ul>
			
		</li>
		
	</ul>

</div>

</body>
</html>