<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    int sid = Integer.parseInt(request.getParameter("sid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
    content="1280*720;text/html; charset=utf-8">
<title>专题影片列表</title>
<style>
* {margin:0px;padding:0px; font-family:Microsoft Yahei;}
body {
    width:1280px;
    height:720px;
    font-size: 28px;
    background-color:white;
}
ul,p,h1,h2,h3,h4,h5,h6,dl,dd,dt,button,input,marquee,table{margin: 0px; padding: 0px;}
div,li{list-style: none; list-style-type:none;}
img,p{border: 0;}
input,marquee{outline:none; border: none; border: 0; border-color: transparent;}
a{text-decoration: none; color: #ffffff}

.background {
    width: 1280px;
    height: 720px;
    left: 0px;
    top:0px;
    position: absolute;
    background-image: url(../static/epgimg/subMo_bj.jpg);
    font-size: 18px;
    color: white;
}

.button{
    position: absolute;
    top: 635px;
}

#sub_list{
	position: absolute;
	top: 95px;
	left: 42px;
}

#sub_list li{
	float: left;
	margin-right: 10px;
	padding-left: 10px;
	padding-right: 10px;
}


</style>

<script type="text/javascript" src="../static/js/epgCommon.js"></script>
<script type="text/javascript" src="../static/js/epgCQ.js"></script>
</head>
<body>
    <div id="main" class="background">
    	
	    <img id='sub_img' style="position:absolute;top:83px;" src=''>
	    <ul id="sub_list">
    	</ul>
	    <img id="focusimg" src="../static/epgimg/picFocus.png"  style="position: absolute;left:98px;top:359px;display: none;z-index: 22;">
	    <div id="m_list" >
	    </div>
	    
		<img id="yxry" src="../static/epgimg/yxtb_f.png" class="button" style="left:215px;"/>
		<img id="gdjc" src="../static/epgimg/gdjc.png" class="button" style="left:430px;"/>
		<img id="jjcx" src="../static/epgimg/jjcx.png" class="button" style="left:640px;"/>
		<img id="wdsf" src="../static/epgimg/wdsf.png" class="button" style="left:850px;"/>
		<img id="btnFocus" src="../static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">
    </div>
    <input id="sid" type="hidden" value="7">
</body>
<script type="text/javascript">
    
    var URL={
            ipaddr:ipaddress,
            movielist:"/REST/subject/movie",
            getallsubject:"/REST/subject/getallsubject"
    }
    
    var id = <%=sid%>
    function getRandomMovieByCategoryId(param){
        var sunFunc=param.sunFunc;
        var failFunc=param.failFunc;
        ajax({
            url:URL.ipaddr+URL.movielist,
            data:"{\"id\":\""+id+"\"}",
            method:"post",
            handler: function(xmlHttp){
                var result = eval("("+xmlHttp.responseText+")");
                if(result.errCode==0){
                    sunFunc(result)
                }else{
                    failFunc(result);
                }
            }
        })
    };
    
    function getAllSubjects(param){
    	var sunFunc=param.sunFunc;
        var failFunc=param.failFunc;
        ajax({
            url:URL.ipaddr+URL.getallsubject,
            data:"",
            method:"post",
            handler: function(xmlHttp){
                var result = eval("("+xmlHttp.responseText+")");
                if(result.errCode==0){
                    sunFunc(result);
                }else{
                    failFunc(result);
                }
            }
        })
    }
    
    var list ={
            index:0,
            focusIndex:0,
            size:0,
            data:[],
            init:function(){
                this.size=this.data.list.length;
                this.index=0;
                this.focusIndex=0;
                this.refresh();
            },
            refresh:function(){
                $("sub_img").src="../static/epgimg/sub_"+this.data.identify+".jpg";
                $("m_list").innerHTML=$("m_list").innerHTML+
                "<ul id='img_list'></ul>"
                for (i = 0;i<this.size;i++) {
                    $("img_list").innerHTML+="<li id='m_"+i+"' width:140px; style='position:absolute;left:"+(105+i*185)+"px;top:365px;width:140px;'></li>";
                    if(i<6){
                        $("m_"+i).style.display="block";
                    }else{
                        $("m_"+i).style.display="none";
                    } 
                    $("m_"+i).innerHTML="<img src='../static/epgimg/"+this.data.list[i].identify+
                    "_cate_preview.jpg'><div style='text-align:center; width:140px;' >"+this.data.list[i].name+"</div>";
                    $("m_"+i).width='140px';
                }
            },
            setFocus:function(){
                $("focusimg").style.display="block";
                $("focusimg").style.left=(parseInt($("m_"+this.index).style.left)-7)+"px";
            },
            blur:function(){
                $("focusimg").style.display="none";
            } ,
            moveLeft:function(){
                if(this.index<=0){
                    return;
                }
                this.blur();
                if(this.focusIndex==0){
                    $("m_"+(this.index+5)).style.display="none";
                    for(var i=0;i<this.size-i;i++){
                        $("m_"+(this.index+i-1)).style.left=(105+i*185)+"px";   
                    }
                    $("m_"+(this.index-1)).style.display="block";
                }
                
                if(this.focusIndex>0){
                    this.focusIndex--;
                }
                this.index--;
                this.setFocus();
            },
            moveRight:function(){
                
                if(this.index>=this.size-1){
                    return;
                }
                this.blur();
                this.index++;
                if(this.focusIndex==5){
                    $("m_"+(this.index-6)).style.display="none";
                    for(var i=0;i<this.size-i;i++){
                        $("m_"+(this.index-(5-i))).style.left=(105+i*185)+"px";
                    }
                    $("m_"+this.index).style.display="block";
                }
                if(this.focusIndex<5){
                    this.focusIndex++;
                }
                this.setFocus();
            },
            enter:function(){
                location.href="moviedetail.jsp?pid="+this.data.list[this.index].pid;
            }
    }
    
    var sublist ={
		index:0,
		focusIndex:0,
		size:0,
		data:[],
		lis:[],
		init:function(){
			this.focusIndex=0;
			this.index=0;
		    this.size=this.data.length;
		    for(var i=0;i<this.size;i++){
		    	var li = document.createElement("li");
				li.innerHTML=this.data[i].name;
				$("sub_list").appendChild(li);
				li.style.border="solid 3px blue";
		    }
		    this.lis=$("sub_list").getElementsByTagName('li');
		    this.lis[this.index].style.backgroundColor="blue";
		},
		setFocus:function(){
			$("sub_list").innerHTML="";
			for(var i=0;i<this.size;i++){
		    	var li = document.createElement("li");
				li.innerHTML=this.data[i].name;
				$("sub_list").appendChild(li);
				li.style.border="solid 3px blue";
		    }
		    this.lis=$("sub_list").getElementsByTagName('li');
		    this.lis[this.index].style.backgroundColor="blue";
		    this.lis[this.focusIndex].style.border="solid 3px #00FFFF";
		},
		blur:function(){
			for(var i=0;i<this.size;i++){
				this.lis[i].style.border="solid 3px blue";
			}
			this.lis[this.focusIndex].style.border="solid 3px blue";	
		},
		ok:function(){
			id=this.data[this.focusIndex].id;
			this.lis[this.index].style.backgroundColor="#00052D";
			this.index=this.focusIndex;
			this.lis[this.index].style.backgroundColor="blue";
			$("m_list").innerHTML="";
			
			getRandomMovieByCategoryId({sunFunc:function(result){
	              list.data=result;
	              list.init();
	        }});
		},
		moveRight:function(){
			if(sublist.focusIndex<sublist.size-1){
				sublist.focusIndex++;
				sublist.setFocus();
			}
		},
		moveLeft:function(){
			if(this.focusIndex>0){
				this.focusIndex--;
				this.setFocus();
			}
		}
    }
    
    var area=0;/*0-list 1-下方按钮*/
    function moveLeft(){
        if(area==0){
            list.moveLeft();
        }else if(area==1){
            if(focusIndex==0)
                setFocus(3);
            else
                setFocus(focusIndex-1);
        }else if(area==2){
        	sublist.moveLeft();
        }
    }

    function moveRight(){
        if(area==0){
            list.moveRight();
        }else if(area==1){
            if(focusIndex==3)
                setFocus(0);
            else
                setFocus(focusIndex+1);
        }else if(area==2){
        	sublist.moveRight();
        }
    }
    
    function moveDown(){
        if(area==0){
            list.blur();
            setFocus(focusIndex);
            area=1;
        }else if(area==2){
        	area=0;
        	list.setFocus();
        	sublist.blur();
        }
    }

    function moveUp(){
    	if(area==0){
    		list.blur();
    		sublist.setFocus();
    		area=2;
    	}else if(area==1){
            list.setFocus();
            buttonBlur();
            area=0;
        }
    }

    function doConfirm(){
        if(area==0){
        	insRecord({action:18,mediaId:list.data.list[list.index].pid});//专题影片点击
        	setTimeout(function(){
				list.enter();
        	},500)
        }else if(area==1){
            buttonClick();
        }else if(area==2){
        	sublist.ok();
        }
    }
    window.onload=function(){
        getRandomMovieByCategoryId({sunFunc:function(result){
               list.data=result;
               list.init();
               list.setFocus();
           }});
        
        getAllSubjects({sunFunc:function(result){
        	sublist.data=result.list;
        	sublist.init();
        }});
    };
    
    
</script>
</html>