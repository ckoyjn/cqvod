<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    int flag = request.getParameter("flag")==null?-1:Integer.parseInt(request.getParameter("flag"));
    int cateid=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id")); 
                    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
    content="1280*720;text/html; charset=gbk">
<title>电影详情页</title>
<link rel="stylesheet" href="../static/css/moviedetail.css"
    type="text/css" />
<style type="text/css">
#zffs {
    position: absolute;
    width: 912px;
    height: 523px;
    top: 140px;
    left: 220px;
    background: url(../static/epgimg/tcbj.png);
}

#chargezdy {
    position: absolute;
    background: url(../static/epgimg/chargezdy.png);
    width: 912px;
    height: 523px;
    left: 184px;
    top: 100px;
}
</style>
</head>
<body>
    <div id="bg" class="background">
        <div id="categoriesCon">
            <ul id="categories">
            </ul>
        </div>
        <img id="cateFocus" src="../static/epgimg/jdk.png"> <img
            src="../static/epgimg/zcyy.png" class="zcyy">
        <div id="detail">
            <img id="moviepic" src="">
            <div id="name"></div>
            <div id="ename"></div>
            <div id="score"></div>
            <img style="position: absolute; left: 935px; top: 90px;" src="../static/epgimg/zan.png">
            <div style="position: absolute;  left: 679px;  top: 94px;  color: white;  font-size: 18px;  width: 150px;  text-align: right;">
				共&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人观看           
				<div id="watchnum" style="position: absolute;  top: 2px;  left: 27px;  color: yellow;  width: 64px;  text-align: center;">123456</div> 
            </div>
            <div
                style="position: absolute; left: 310px; top: 160px; font-size: 18px; color: #0072ff;">导演：</div>
            <div id="director"></div>
            <div
                style="position: absolute; left: 310px; top: 190px; font-size: 18px; color: #0072ff;">主演：</div>
            <div id="actor"></div>
            <div
                style="position: absolute; left: 310px; top: 220px; font-size: 18px; color: #0072ff;">时长：</div>
            <div id="mins"></div>

            <div id="price"
                style="position: absolute; left: 130px; top: 420px; font-size: 18px; color: #FFFFB9;"></div>

            <div id="intro"></div>
            <img id="buy" class="detailbutton" src="../static/epgimg/buy.png" style="left: 310px"/>
            <img id="ph" class="detailbutton" src="../static/epgimg/ph.png" style="left: 410px"/> 
            <img id="favorite" class="detailbutton" src="../static/epgimg/favor.png" style="left: 510px"/> 
            <img id="rate" class="detailbutton" src="../static/epgimg/dz.png" style="left: 610px"/>
        </div>

        <img id="list_0" class="list" style="left: 280px" /> <img id="list_1"
            class="list" style="left: 442px" /> <img id="list_2" class="list"
            style="left: 604px" /> <img id="list_3" class="list"
            style="left: 766px" /> <img id="list_4" class="list"
            style="left: 928px" /> <img id="list_5" class="list"
            style="left: 1090px" />
        <div id="relatefocus"></div>


		<img id="yxry" src="../static/epgimg/yxtb.png" class="button" style="left:215px;"/>
		<img id="gdjc" src="../static/epgimg/gdjc_f.png" class="button" style="left:430px;"/>
		<img id="jjcx" src="../static/epgimg/jjcx.png" class="button" style="left:640px;"/>
		<img id="wdsf" src="../static/epgimg/wdsf.png" class="button" style="left:850px;"/>
		<img id="btnFocus" src="../static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">

        <div id="screen"
            style="position: absolute; background: url('../static/epgimg/screen.png'); top:0px;left:0px;width: 1280px; height: 720px; display: none;">
        </div>

        <div id="ratetc">
            <div id="ratetx"
                style="position: absolute; left: 20px; top: 10px; color: white;">按遥控器方向键进行评分</div>
            <img id="ratestar_0" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 106px;"> <img
                id="ratestar_1" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 163px;"> <img
                id="ratestar_2" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 220px;"> <img
                id="ratestar_3" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 277px;"> <img
                id="ratestar_4" class="ratestar"
                src="../static/epgimg/blackstar.png" style="left: 334px;">
            <div id="ratefanhui"></div>
            <div id="rateqr"></div>
        </div>

        <div id="zffs" style="display: none">
            <span
                style="position: absolute; left: 70px; top: 35px; color: wheat;">请选择您的支付方式</span>
            <span id="zfje"
                style="position: absolute; left: 70px; top: 95px; color: grey;">支付金额：10.0元</span>
            <img id="gb" alt="" src="../static/epgimg/gb01.png"
                style="position: absolute; left: 770px; top: 35px;"> <img
                src="../static/epgimg/line.jpg"
                style="position: absolute; left: 70px; top: 140px;"> <img
                id="gyqzf" alt="" src="../static/epgimg/an01a.jpg"
                style="position: absolute; left: 160px; top: 170px;"> <img
                id="dszf" alt="" src="../static/epgimg/an04a.jpg"
                style="position: absolute; left: 160px; top: 228px;"> <img
                id="tcjdk" src="../static/epgimg/tcjdk.png"
                style="position: absolute; left: 152px; top: 165px;">
            <div id="tsxx"
                style="position: absolute; color: white; top: 344px; left: 160px; width: 250px; text-align: center; font-size: 20px;"></div>
            <div id="gyqdetail"
                style="position: absolute; left: 410px; top: 170px; height: 200px; width: 330px; background-color: blue;">
                <img id="filmcode_focus" src="../static/epgimg/ip_jdk.png"
                    style="display: none; position: absolute; left: 33px; top: 8px;">
                <div id="filmcode"
                    style="position: absolute; left: 40px; top: 15px; line-height: 36px; width: 244px; height: 41px; font-size: 30px; background: url(../static/epgimg/ip_bj.jpg); text-align: center;"></div>
                <img alt="" src="../static/epgimg/gym.jpg"
                    style="position: absolute; left: 40px; top: 100px;">
            </div>
            <img id="wczf" alt="" src="../static/epgimg/an01.png"
                style="position: absolute; left: 510px; top: 385px;">
        </div>

        <div id="dgtx" style="display: none">
        	<div
                style="position: absolute;  font-size: 22px;  width: 807px;  text-align: center;  left: 51px;  top: 120px;  color: white;">亲爱的用户，你即将购买沙发院线的影片</div>
        	<div id="mctx" style="position: absolute;  font-size: 26px;  width: 807px;  text-align: center;  left: 51px;  top: 159px;  color: white;"></div>
            <div id="jgtx"
                style="  position: absolute;  font-size: 22px;  width: 807px;  text-align: center;  left: 51px;  top: 204px;  color: white;"></div>
            <img id="dgqr" src="../static/epgimg/dgqd.png"
                style="position: absolute; left: 260px; top: 370px;"> <img
                id="dgfh" src="../static/epgimg/dgfh.png"
                style="position: absolute; left: 493px; top: 370px;">
                
             <img id="dg_f" src="../static/epgimg/dg_f.png"
                style="position: absolute; left: 260px;  top: 370px;">
                
        </div>

        <div id="charge" style="display: none">
            <div id="balance"
                style="position: absolute; color: #06D3E8; font-size: 24px; top: 90px; left: 80px;"></div>
            <img src="../static/epgimg/line.jpg"
                style="position: absolute; top: 140px; left: 80px;"> <img
                id="20rmb" src="../static/epgimg/20rmb.png"
                style="position: absolute; left: 200px; top: 180px"> <img
                id="30rmb" src="../static/epgimg/30rmb.png"
                style="position: absolute; left: 464px; top: 180px"> <img
                id="50rmb" src="../static/epgimg/50rmb.png"
                style="position: absolute; left: 200px; top: 253px"> <img
                id="zdyrmb" src="../static/epgimg/zdy.jpg"
                style="position: absolute; left: 464px; top: 253px"> <img
                id="chargefocus" src="../static/epgimg/tcjdk.png"
                style="position: absolute;"> <img id="chargefh"
                src="../static/epgimg/fh.png"
                style="position: absolute; left: 390px; top: 360px;">
        </div>
        <div id="chargezdy" style="display: none">
            <div id="amount"
                style="position: absolute; background: url(../static/epgimg/amountbk.jpg); width: 157px; height: 57px; top: 200px; left: 350px; text-align: center; line-height: 52px; font-size: 35px;"></div>
            <img id="chargezdyqr" src="../static/epgimg/qr_f.png"
                style="position: absolute; left: 265px; top: 360px;"> <img
                id="chargezdyfh" src="../static/epgimg/fh.png"
                style="position: absolute; left: 480px; top: 360px;">
        </div>
        <div id="wxts" style="display: none;">
            <div id="wxtsmsg"
                style="position: absolute; color: white; left: 38px; width: 496px; text-align: center; top: 130px;">hahahaha</div>
            <img src="../static/epgimg/fh_f.png"
                style="position: absolute; top: 261px; left: 220px;">
        </div>
        <iframe id="data_ifm" style="display: none;"></iframe>
    </div>
    <script type="text/javascript" src="../static/js/epgCQ.js"></script>
    <script type="text/javascript" src="../static/js/epgCommon.js"></script>
    
    <script type="text/javascript">
        var URL = {
            ipaddr : ipaddress,
            categorylist : "/REST/category/listGBK",
            moviedeatil : "/REST/movie/detail",
            same : "/REST/movie/sameCategory",
            favor : "/REST/favorite/add",
            deletefavor:"/REST/favorite/delete",
            rate : "/REST/user/rating",
            verify:"/REST/order/verifycode",
            verifyR:"/REST/order/verifycodeR",
            addorder:"/REST/order/add",
            balance:"/REST/user/balance",
            praise:"/REST/user/praise",
        }

        function getCategoryList(param) {
            var url = URL.ipaddr + URL.categorylist;
            var data = "{\"encode\":\"1\"}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }
        var flag=<%=flag%>
        var pid =<%=pid%>;
        var cateid =<%=cateid%>;
        function getMovieDetail(param) {
            var url = URL.ipaddr + URL.moviedeatil;
            var data = "{\"pid\":" + pid + ",\"smartcardid\":\"" + getCANO()
                    + "\",\"encode\":\"1\"}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }
        
        function userBalance(param){
            var url = URL.ipaddr + URL.balance;
            var data = "{\"smartcardid\":\"" + getCANO()+ "\"}";
            var sucFunc=param.sucFunc;
            var failFunc=param.failFunc;
            ajax({url:url,
                data:data,
                method:"post",
                handler:function(xmlHttp){
                var result = eval("("+xmlHttp.responseText+")");
                if(result.errCode==0){
                    sucFunc(result);
                }else{
                    failFunc(result);
                }
            }});
        }

        function getSame(param) {
            var url = URL.ipaddr + URL.same;
            var data = "{\"pid\":" + pid + ",\"num\":6}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }

        function favor(param) {
            var url = URL.ipaddr + URL.favor;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":" + pid
                    + "}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }
        
        function deletefavor(param) {
            var url = URL.ipaddr + URL.deletefavor;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":" + pid
                    + "}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }

        function rate(param) {
            var url = URL.ipaddr + URL.rate;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":" + pid
                    + ",\"score\":" + ratetc.score + "}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });

        }
        
        function verify(param){
            var url = URL.ipaddr + URL.verify;
            var data = "{\"pid\":<%=pid%>,\"smartcardid\":"+getCANO()+",\"evcnid\":\""+param.filmcode+"\",\"price\":\""+detail.data.price+"\"}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0 && result.result==0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }
        
        function addorder(param){
            var url = URL.ipaddr + URL.addorder;
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            var data = "{\"pid\":<%=pid%>,\"smartcardid\":" + getCANO()
                    + ",\"evcnid\":\"" + param.filmcode + "\",\"price\":\""
                    + detail.data.price + "\"}";
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                    var result = eval("(" + xmlHttp.responseText + ")");
                    if (result.errCode == 0 && result.result == 0) {
                        sucFunc(result);
                    } else {
                        failFunc(result);
                    }
                }
            });
        }

        function verifyR(param) {
            var url = URL.ipaddr + URL.verify;
            var data = "{\"smartcardid\":" + getCANO() + ",\"evcnid\":\""
                    + param.filmcode + "\",\"price\":\"" + detail.data.price
                    + "\"}";
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                }
            });
        }
        
        function praise(param){
        	var url = URL.ipaddr + URL.praise;
            var data = "{\"smartcardid\":" + getCANO() + ",\"pid\":\"" + pid + "\"}";
            var sucFunc = param.sucFunc;
            var failFunc = param.failFunc;
            ajax({
                url : url,
                data : data,
                method : "post",
                handler : function(xmlHttp) {
                	 var result = eval("(" + xmlHttp.responseText + ")");
                     if (result.errCode == 0 && result.result == 0) {
                         sucFunc(result);
                     } else {
                         failFunc(result);
                     }
                }
            });
        }

        var zffs = {
            status : "gyqzf",
            zffs : "gyqzf",
            filmcode : "",
            init : function() {
                this.status = "gyqzf";
                this.zffs = "gyqzf";
                $("gyqzf").src = "../static/epgimg/an01b.jpg";
                $("dszf").src = "../static/epgimg/an04a.jpg";
                $("gb").src = "../static/epgimg/gb01.png";
                $("wczf").src = "../static/epgimg/an01.png";
                $("filmcode_focus").style.display = "none";
                $("tcjdk").style.display = "block";
                $("tcjdk").style.top = "165px";
            },
            moveDown : function() {
                if (this.status == "gyqzf") {
                    $("tcjdk").style.top = "223px";
                    this.status = "dszf";
                } else if (this.status == "dszf") {
                    $("tcjdk").style.display = "none";
                    $("wczf").src = "../static/epgimg/an02.png";
                    this.status = "wczf";
                } else if (this.status == "gb") {
                    $("gb").src = "../static/epgimg/gb01.png";
                    $("tcjdk").style.display = "block";
                    this.status = "gyqzf";
                } else if (this.status == "filmcode") {
                    $("filmcode_focus").style.display = "none";
                    $("wczf").src = "../static/epgimg/an02.png";
                    this.status = "wczf";
                    inputmode = false;
                }
            },
            moveUp : function() {
                if (this.status == "wczf") {
                    if (this.zffs == "gyqzf") {
                        $("filmcode_focus").style.display = "block";
                        $("wczf").src = "../static/epgimg/an01.png";
                        this.status = "filmcode";
                        inputmode = true;
                        inputdom = $("filmcode");
                    } else {
                        $("wczf").src = "../static/epgimg/an01.png";
                        $("tcjdk").style.display = "block";
                        $("tcjdk").style.top = "223px";
                        this.status = "dszf";
                    }

                } else if (this.status == "dszf") {
                    $("tcjdk").style.top = "165px";
                    this.status = "gyqzf";
                } else if (this.status == "filmcode") {
                    $("filmcode_focus").style.display = "none";
                    $("gb").src = "../static/epgimg/gb02.png";
                    this.status = "gb";
                    inputmode = false;
                } else if (this.status == "gyqzf") {
                    $("gb").src = "../static/epgimg/gb02.png";
                    $("tcjdk").style.display = "none";
                    this.status = "gb";
                }
            },
            moveLeft : function() {
                if (this.status == "filmcode") {
                    $("filmcode_focus").style.display = "none";
                    $("tcjdk").style.top = "165px";
                    $("tcjdk").style.display = "block";
                    this.status = "gyqzf";
                    inputmode = false;
                }
            },
            moveRight : function() {
                if (this.zffs == "gyqzf") {
                    if (this.status == "gyqzf" || this.status == "dszf") {
                        $("filmcode_focus").style.display = "block";
                        $("tcjdk").style.display = "none";
                        this.status = "filmcode";
                        inputmode = true;
                        inputdom = $("filmcode");
                    }
                }
            },
            ok : function() {
                if (this.status == "gyqzf") {
                    $("gyqdetail").style.display = "block";
                    this.init();
                } else if (this.status == "dszf") {
                    this.zffs = "dszf";
                    $("gyqzf").src = "../static/epgimg/an01a.jpg";
                    $("dszf").src = "../static/epgimg/an04b.jpg";
                    $("gyqdetail").style.display = "none";
                } else if (this.status == "wczf") {
                    $("tsxx").innerHTML = "正在支付，请稍候";
                    this.status == "waiting";
                    if (this.zffs == "gyqzf") {
                        this.filmcode = $("filmcode").innerHTML;
                        /*充入电子券*/
                        verify({
                            filmcode : this.filmcode,
                            sucFunc : function(result) {
                                /*成功*/
                                /*调用订购*/
                                //var url = iPanel.eventFrame.pre_epg_url+"/defaultHD/en/hidden_byTime_gehua.jsp?typeId=-1&vodId="+detail.data.mediaid+"&playType=1&idType=FSN&baseFlag=2&appBackUrl= ";
                                var url = ""
                                $("data_ifm").src = url;
                                trxnstep = 1;
                                zffs.zffs == "gyqzf"
                            },
                            failFunc : function(result) {
                                if (result.errCode == 0) {
                                    $("tsxx").innerHTML = "验证电子券出错(错误码"
                                            + result.result + ")";
                                } else {
                                    $("tsxx").innerHTML = "系统错误";
                                }

                                zffs.zffs == "gyqzf"
                            }
                        });
                    } else if (this.zffs == "dszf") {

                    }
                }
            }
        }

        var charge = {
            status : "20",
            init : function() {
                this.status = "20";
                
                if(balanceflag==0){
                    userBalance({
                        sucFunc : function(result) {
                            if(result.type==0){//欠费
                                $("balance").innerHTML = "您已欠费" + result.oweTotalFee
                                + "元，请您选择要充值的金额进行充值";
                            }else {
                                $("balance").innerHTML = "您的余额为" + result.balance
                                + "元，请您选择要充值的金额进行充值";
                            }
                        },
                        failFunc : function(result) {
                            $("balance").innerHTML = "余额不足，请您选择要充值的金额进行充值";
                        }
                    });
                }

                $("chargefocus").style.display = "block";
                $("chargefocus").style.top = "172px";
                $("chargefocus").style.left = "192px";
                $("chargefh").src = "../static/epgimg/fh.png";
            },
            moveRight : function() {
                if (this.status == "20") {
                    this.status = "30";
                    $("chargefocus").style.left = "455px";
                } else if (this.status == "50") {
                    this.status = "100";
                    $("chargefocus").style.left = "455px";
                }
            },
            moveLeft : function() {
                if (this.status == "30") {
                    this.status = "20";
                    $("chargefocus").style.left = "192px";
                } else if (this.status == "100") {
                    this.status = "50";
                    $("chargefocus").style.left = "192px";
                }
            },
            moveDown : function() {
                if (this.status == "20") {
                    this.status = "50";
                    $("chargefocus").style.top = "246px";
                } else if (this.status == "30") {
                    this.status = "100";
                    $("chargefocus").style.top = "246px";
                } else if (this.status == "50" || this.status == "100") {
                    this.status = "cancel";
                    $("chargefh").src = "../static/epgimg/fh_f.png";
                    $("chargefocus").style.display = "none";
                }
            },
            moveUp : function() {
                if (this.status == "50") {
                    this.status = "20";
                    $("chargefocus").style.top = "172px";
                } else if (this.status == "100") {
                    this.status = "30";
                    $("chargefocus").style.top = "172px";
                } else if (this.status == "cancel") {
                    this.status = "100";
                    $("chargefocus").style.top = "246px";
                    $("chargefocus").style.left = "455px";
                    $("chargefh").src = "../static/epgimg/fh.png";
                    $("chargefocus").style.display = "block";
                }
            },
            ok : function() {
                if (this.status == "cancel") {
                    windows.hidden();
                } else if (this.status == "100") {
                    windows.hidden();
                    chargezdy.init();
                    windows.show("chargezdy");
                } else {
                    location.href = chargeaddress + "?payMoney=" + this.status
                            + "&returnUrl=" + location.href+"&flag=1";
                }
            }
        }

        var chargezdy = {
            status : "ok",
            init : function() {
                this.status = "ok";
                $("amount").innerHTML = "";
                $("chargezdyqr").src = "../static/epgimg/qr_f.png";
                $("chargezdyfh").src = "../static/epgimg/fh.png";
                inputmode = false;
                inputdom = $("amount");
                inputmaxlen = 3;
            },
            moveRight : function() {
                if (this.status == "ok") {
                    $("chargezdyqr").src = "../static/epgimg/qr.png";
                    $("chargezdyfh").src = "../static/epgimg/fh_f.png";
                    inputmode = false;
                    this.status = "cancel";
                }
            },
            moveLeft : function() {
                if (this.status == "cancel") {
                    $("chargezdyqr").src = "../static/epgimg/qr_f.png";
                    $("chargezdyfh").src = "../static/epgimg/fh.png";
                    inputmode = false;
                    this.status = "ok";
                }
            },
            moveUp : function() {
                $("chargezdyqr").src = "../static/epgimg/qr.png";
                $("chargezdyfh").src = "../static/epgimg/fh.png";
                $("amount").style.border = "2px solid #00FFFF";
                inputmode = true;
                this.status = "amount";
            },
            moveDown : function() {
                if (this.status == "amount") {
                    $("amount").style.border = "1px solid white";
                    $("chargezdyqr").src = "../static/epgimg/qr_f.png";
                    $("chargezdyfh").src = "../static/epgimg/fh.png";
                    inputmode = false;
                    this.status = "ok";
                }
            },
            ok : function() {
                if (this.status == "cancel") {
                    windows.hidden();
                    charge.init();
                    inputmode = false;
                    windows.show("charge");
                } else if (this.status == "ok") {
                    location.href = chargeaddress + "?payMoney="
                            + $("amount").innerHTML + "&returnUrl="
                            + location.href+"&flag=1";
                }
            }
        }
        var dgtx = {
            status : "cancel",
            moveRight : function() {
                if (this.status == "enter") {
                    $("dg_f").style.left = $("dgfh").style.left;
                    this.status = "cancel";
                }
            },
            moveLeft : function() {
                if (this.status == "cancel") {
                	$("dg_f").style.left = $("dgqr").style.left;
                    this.status = "enter";
                }
            },
            ok : function() {
                if (this.status == "enter") {
                    /* trxnstep = 1;
                    var url = iPanel.eventFrame.comfirmUrl;
                    $("data_ifm").src = url; */
                    
                	EPlayer.play(detail.data.name,detail.data.playurl);
                } else {
                	$("dg_f").style.left = $("dgqr").style.left;
                    this.status = "enter";
                    windows.hidden();
                }
            }
        }
        var balanceflag = 0;//0:查询余额失败1：查询余额成功
        var balance = 0;//用户余额
        var trxnstep = 0;/*0-询价 1-订购确认 2-播放*/
        function showTipWindow(mes, type) {
            if (trxnstep == 0) {
                if (type == 2) {
                	if(detail.index==0 && detail.data.price!="0"){
                		dgtx.status="cancel";
                    	$("dg_f").style.left=$("dgfh").style.left;
                        windows.show("dgtx");
                        insRecord({action:6,pid:detail.data.pid});//支付确认弹窗	
                	}else{
                		var url = iPanel.eventFrame.comfirmUrl;
                        $("data_ifm").src = url;
                	}
                } else {
                    windows.hidden();
                    $("wxtsmsg").innerHTML = "询价出错：[" + mes + "]";
                    windows.show("wxts");
                }
            } else if (trxnstep == 1) {
                if (mes == "2" || mes == "106") {
                    setTimeout(function() {
                        windows.hidden();
                        charge.init();
                        windows.show("charge");
                        insRecord({action:7});//充值弹窗
                    }, 1000)
                } else {
                    windows.hidden();
                    $("wxtsmsg").innerHTML = "订购出错：[" + mes + "]";
                    windows.show("wxts");
                }
            } else if (trxnstep == 2) {
                /*播放出错*/
                windows.hidden();
                $("wxtsmsg").innerHTML = "播放出错：[" + mes + "]";
                windows.show("wxts");
            }

        }

        var category = {
            size : 0,
            data : [],
            index : 0,
            focusIndex : 0,
            listSize : 4,
            initTop : 122,
            step : 56,
            flag : 0,
            lis : [],
            init : function() {
                this.size = this.data.length;
                this.listSize = this.data.length;
                for (var i = 0; i < this.size; i++) {
                    var li = document.createElement("li");
                    li.innerHTML = this.data[i].name;
                    if (cateid != -1 && this.data[i].id == cateid) {
                        this.flag = i;
                    }
                    $("categories").appendChild(li);
                }
                this.lis = $("categories").getElementsByTagName("li");
                this.lis[this.flag].style.background = "url(../static/epgimg/cate_f.jpg)";
            },
            setFocus : function() {
                if (this.focusIndex == this.listSize - 1
                        || this.focusIndex == 0) {
                    $("categories").style.top = (this.step * (this.focusIndex - this.index))
                            + "px";
                }
                $("cateFocus").style.top = this.initTop + this.focusIndex
                        * this.step + "px";
                $("cateFocus").style.display = "block";
            },
            blur : function() {
                $("cateFocus").style.display = "none";
            },
            moveDown : function() {
                if (this.index == this.size - 1) {
                    this.setFocus();
                    return;
                }

                if (this.focusIndex < this.listSize - 1) {
                    this.focusIndex++;
                }

                this.index++;
                this.setFocus();
            },
            moveUp : function() {
                if (this.index == 0) {
                    this.setFocus();
                    return;
                }

                if (this.index > 0) {
                    this.index--;
                }

                this.focusIndex--;
                this.setFocus();
			},
			ok : function() {
				insRecord({action:15,cateid:this.data[this.index].id});
				setTimeout(function(){
					location.href = URL.ipaddr + "/epg/category.jsp?id="+ category.data[category.index].id;
				},500);
			}
		}

        var detail = {
            userbalance : 0,
            data : {},
            index : 0,
            init : function() {
                $("moviepic").src = "../static/epgimg/" + this.data.identify
                        + "_detail.jpg";
                $("name").innerHTML = this.data.name;
                $("ename").innerHTML = this.data.ename;
                $("score").innerHTML = this.data.praiseNum;
                $("director").innerHTML = this.data.director;
                $("actor").innerHTML = this.data.actor;
                $("intro").innerHTML = this.data.intro;
                $("watchnum").innerHTML = this.data.watchNum;
                $("mins").innerHTML = this.data.mins + "分钟";
                $("mctx").innerHTML = "《"+this.data.name+"》";
                $("jgtx").innerHTML = "需要支付"+this.data.price+"元，请点击确认进行购买。";
                
                if(this.data.price=="0"){
                	$("price").innerHTML = "免费";
                }else{
                	$("price").innerHTML = this.data.price + "元/部";	
                }
                if (this.data.isFavorite == 1) {
                    $("favorite").src = "../static/epgimg/favorited.png";
                } else {
                    $("favorite").src = "../static/epgimg/favor.png";
                }
                $("rate").src = "../static/epgimg/dz.png";
                if (this.data.isAuthed == 1||this.data.price=="0") {
                    $("buy").src = "../static/epgimg/watch_f.png";
                } else {
                    $("buy").src = "../static/epgimg/buy_f.png";
                }
            },
            moveLeft : function() {
                this.index--;
                this.setFocus();
            },
            moveRight : function() {
                this.index++;
                this.setFocus();
            },
            setFocus : function() {
                if (this.index == 0) {
                	$("ph").src="../static/epgimg/ph.png";
                    if (this.data.isAuthed == 1 || this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch_f.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy_f.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor.png";
                    }
                    $("rate").src = "../static/epgimg/dz.png";
                } else if (this.index == 1) {
                	$("ph").src="../static/epgimg/ph_f.png";
                    if (this.data.isAuthed == 1 || this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor.png";
                    }
                    $("rate").src = "../static/epgimg/dz.png";
                } else if (this.index == 2) {
                	$("ph").src="../static/epgimg/ph.png";
                    if (this.data.isAuthed == 1 || this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited_f.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor_f.png";
                    }
                    
                    $("rate").src = "../static/epgimg/dz.png";
                }else if (this.index == 3) {
                	$("ph").src="../static/epgimg/ph.png";
                    if (this.data.isAuthed == 1	|| this.data.price=="0") {
                        $("buy").src = "../static/epgimg/watch.png";
                    } else {
                        $("buy").src = "../static/epgimg/buy.png";
                    }
                    if (this.data.isFavorite == 1) {
                        $("favorite").src = "../static/epgimg/favorited.png";
                    } else {
                        $("favorite").src = "../static/epgimg/favor.png";
                    }
					$("rate").src = "../static/epgimg/dz_f.png";
                }
            },
            blur : function() {
            	$("ph").src="../static/epgimg/ph.png";
                if (this.data.isAuthed == 1 || this.data.price=="0") {
                    $("buy").src = "../static/epgimg/watch.png";
                } else {
                    $("buy").src = "../static/epgimg/buy.png";
                }
                if (this.data.isFavorite == 1) {
                    $("favorite").src = "../static/epgimg/favorited.png";
                } else {
                    $("favorite").src = "../static/epgimg/favor.png";
                }
               
                $("rate").src = "../static/epgimg/dz.png";
            }
        }

        var related = {
            size : 0,
            data : [],
            lis : [],
            index : 0,
            step : 162,
            initTop : 274,
            init : function() {
                this.size = this.data.length;
                for (var i = 0; i < this.size; i++) {
                    $("list_" + i).src = "../static/epgimg/"
                            + this.data[i].identify + "_list.jpg";
                    $("list_" + i).style.display = "block";
                }
            },
            setFocus : function() {
                $("relatefocus").style.left = this.initTop + this.index * 162
                        + "px";
                $("relatefocus").style.display = "block";
            },
            blur : function() {
                $("relatefocus").style.display = "none";
            },
            moveRight : function() {
                if (this.index < this.size - 1) {
                    this.index++;
                }
                this.setFocus();
            },
            moveLeft : function() {
                if (this.index > 0) {
                    this.index--;
                }
                this.setFocus();
            }
        }

        var ratetc = {
            status : "rating",
            score : 0,
            moveLeft : function() {
                if (this.status == "rating") {
                    if (this.score > 0) {
                        this.score--;
                    }
                    this.refresh();
                } else if (this.status == "cancel" && detail.data.isRated == 0) {
                    this.status = "ok";
                    $("rateqr").style.background = "url(../static/epgimg/qr_f.png)";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh.png)";
                }
            },
            moveRight : function() {
                if (this.status == "rating") {
                    if (this.score < 10) {
                        this.score++;
                    }
                    this.refresh();
                } else if (this.status == "ok") {
                    this.status = "cancel";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh_f.png)";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                }
            },
            moveDown : function() {
                if (this.status == "rating") {
                    this.status = "ok";
                    $("rateqr").style.background = "url(../static/epgimg/qr_f.png)";
                    this.refresh();
                }
            },
            moveUp : function() {
                if (this.status == "ok") {
                    this.status = "rating";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                    this.refresh();
                } else if (this.status == "cancel" && detail.data.isRated == 0) {
                    this.status = "rating";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh.png)";
                    this.refresh();
                }
            },
            refresh : function() {
                var i;
                for (i = 0; i < Math.floor(this.score / 2); i++) {
                    $("ratestar_" + i).src = "../static/epgimg/fullstar.png"
                }

                for (var j = Math.ceil(this.score / 2); j < 5; j++) {
                    if (this.status == "rating") {
                        $("ratestar_" + j).src = "../static/epgimg/blankstar.png"
                    } else {
                        $("ratestar_" + j).src = "../static/epgimg/blackstar.png"
                    }

                }
                if (this.score % 2 == 1) {
                    $("ratestar_" + i).src = "../static/epgimg/halfstar.png"
                }
            },
            init : function() {
                if (detail.data.isRated == 1) {
                    this.status = "cancel";
                    this.score = detail.data.rating;
                    $("ratefanhui").style.background = "url(../static/epgimg/fh_f.png)";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                    this.refresh();
                } else {
                    this.status = "rating";
                    $("ratefanhui").style.background = "url(../static/epgimg/fh.png)";
                    $("rateqr").style.background = "url(../static/epgimg/qr.png)";
                    this.refresh();
                }
            },
            ok : function() {
                if (this.status == "ok") {
                    windows.hidden();
                    rate({
                        sucFunc : function() {
                            detail.data.isRated = 1;
                            detail.data.rating = this.score;
                            detail.setFocus();
                        }
                    });
                } else if (this.status == "cancel") {
                    windows.hidden();
                }
            }
        }

        var wxts = {
            ok : function() {
                windows.hidden();
            }
        }

        var area = 0;/*0-电影详情 1-左侧分类列表 2-下方电影列表 3-下方button*/
        function moveLeft() {
            if (!windows.flag) {
                if (area == 0) {
                    if (detail.index == 0) {
                        detail.blur();
                        area = 1;
                        category.setFocus();
                    } else {
                        detail.moveLeft();
                    }
                } else if (area == 2) {
                    related.moveLeft();
                } else if (area == 3) {
                    if (focusIndex == 0)
                        setFocus(3);
                    else
                        setFocus(focusIndex - 1);
                }
            } else {
                window[windows.key].moveLeft();
            }

        }

        function moveRight() {
            if (!windows.flag) {
                if (area == 0) {
                    if (detail.index < 3) {
                        detail.moveRight();
                    }
                } else if (area == 1) {
                    detail.setFocus();
                    area = 0;
                    category.blur();
                } else if (area == 2) {
                    related.moveRight();
                } else if (area == 3) {
                    if (focusIndex == 3)
                        setFocus(0);
                    else
                        setFocus(focusIndex + 1);
                }
            } else {
                window[windows.key].moveRight();
            }
        }

        function moveDown() {
            if (!windows.flag) {
                if (area == 1) {
                    category.moveDown();
                } else if (area == 0) {
                    related.setFocus();
                    area = 2;
                    detail.blur();
                } else if (area == 2) {
                    related.blur();
                    setFocus(focusIndex);
                    area = 3;
                }
            } else {
                window[windows.key].moveDown();
            }
        }

        function moveUp() {
            if (!windows.flag) {
                if (area == 1) {
                    category.moveUp();
                } else if (area == 2) {
                    related.blur();
                    area = 0;
                    detail.setFocus();
                } else if (area == 3) {
                    buttonBlur();
                    area = 2;
                    related.setFocus();
                }
            } else {
                window[windows.key].moveUp();
            }
        }

        function backspace() {
            location.href = URL.ipaddr;
        }

        function doConfirm() {
            if (!windows.flag) {
                if (area == 0) {
                    if (detail.index == 2) {
                    	if(detail.data.isFavorite == 1){
                    		deletefavor({
                                sucFunc : function() {
                                    detail.data.isFavorite = 0;
                                    detail.setFocus();
                                },
                                failFunc : function() {
                                }
                            });
                    	}else{
                    		favor({
                                sucFunc : function() {
                                    detail.data.isFavorite = 1;
                                    detail.setFocus();
                                },
                                failFunc : function() {
                                }
                            });
                    	}
                        
                    } else if (detail.index == 1) {
                    	if(detail.data.preview!=""){
                    		trxnstep = 2;
                    		var url = iPanel.eventFrame.pre_epg_url
                            + "/defaultHD/en/hidden_byTime_gehua.jsp?typeId=-1&vodId="
                            + detail.data.preview
                            + "-sfyx"
                            + "&playType=1&idType=FSN&baseFlag=2&appBackUrl="
                            + location.href;
                    		$("data_ifm").src = url;	
                    	}else{
                    		windows.hidden();
                    		$("wxtsmsg").innerHTML="影片暂无预告片";
                    		windows.show("wxts");
                    	}
                    } else if (detail.index == 3) {
                    	if(detail.data.isPraised==0){
                    		praise({
                        		sucFunc : function() {
                                    detail.data.isPraised = 1;
                                    $("score").innerHTML=parseInt($("score").innerHTML)+1;
                                    detail.setFocus();
                                },
                                failFunc : function() {
                                }
                        	});	
                    	}
                    	
                    }else if ((detail.index == 0 && detail.data.isAuthed == 1) || detail.data.price =="0") {
                        trxnstep = 2;
//                         alert("电影名称>>>>>>"+detail.data.name);
//                        var url = "http://bj.sofamovie.cn:8015/sfstore/sfyx/youzhongniaiwo20150709/youzhongniaiwo20150709S.mp4";
						var url = detail.data.playurl;
//                         $("data_ifm").src = url;
                        
                        EPlayer.play(detail.data.name,url);
                        
                    }else if (detail.index == 0 && detail.data.isAuthed == 0) {
                        trxnstep = 0;
                        /*  var url = iPanel.eventFrame.pre_epg_url
                                 + "/defaultHD/en/hidden_byTime_gehua.jsp?typeId=-1&vodId="
                                 + detail.data.mediaid
                                 + "-sfyx"
                                 + "&playType=1&idType=FSN&baseFlag=2&appBackUrl="
                                 + location.href;
                         $("data_ifm").src = url; */
//                          alert("电影名称>>>>>>"+detail.data.name);
//                         var url = "http://bj.sofamovie.cn:8015/sfstore/sfyx/youzhongniaiwo20150709/youzhongniaiwo20150709S.mp4";
 						  var url = detail.data.playurl;
//                          $("data_ifm").src = url;
                         //EPlayer.play(detail.data.name,url);
                         
                         //购买
 						windows.hidden();
                   		dgtx.status="cancel";
                     	$("dg_f").style.left=$("dgfh").style.left;
                         windows.show("dgtx");
                         insRecord({action:6,pid:detail.data.pid});
                         
                     } 
                } else if (area == 2) {
					insRecord({action:16,mediaId:related.data[related.index].id});//详情页相似电影点击
					setTimeout(function(){
						location.href = "moviedetail.jsp?pid="+ related.data[related.index].id;
					},500);
                } else if (area == 3) {
                                    buttonClick();
                } else if (area == 1) {
                	
                    category.ok();
                }
            } else {
                window[windows.key].ok();
            }

        }

        window.onload = function() {
            getCategoryList({
                sucFunc : function(result) {
                    category.data = result.list;
                    category.init();
                    getMovieDetail({
                        sucFunc : function(result) {
                            detail.data = result;
                            detail.init();
                            if(flag==1){
                            	var url = iPanel.eventFrame.pre_epg_url
                                + "/defaultHD/en/hidden_byTime_gehua.jsp?typeId=-1&vodId="
                                + detail.data.mediaid
                                + "-sfyx"
                                + "&playType=1&idType=FSN&baseFlag=2&appBackUrl="
                                + location.href;
                            	$("data_ifm").src = url;
                            }
                        },
                        failFunc : function() {
                        }
                    });
                },
                failFunc : function() {
                }
            });
            
            userBalance({
                sucFunc : function(result) {
                    if(result.type==0){//欠费
                        $("balance").innerHTML = "您已欠费" + result.oweTotalFee
                        + "元，请您选择要充值的金额进行充值";
                    }else {
                        $("balance").innerHTML = "您的余额为" + result.balance
                        + "元，请您选择要充值的金额进行充值";
                    }
                    balanceflag=1;
                },
                failFunc : function(result) {
                    $("balance").innerHTML = "余额不足，请您选择要充值的金额进行充值";
                }
            });

            getSame({
                sucFunc : function(result) {
                    related.data = result.list;
                    related.init();
                }
            });
            
        }
    </script>
</body>
</html>

