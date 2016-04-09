<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
    int cateid=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id")); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="1280*720;text/html; charset=utf-8">
<title>电影分类页面</title>
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
.background{
    width:1280px;
    height:720px;
    position:absolute;
    background-image:url(../static/epgimg/category_bj.jpg)
}
.zcyy{
    position:absolute;
}

#categories {
    position: relative;
    width: 266px;
    height: 560px;
    text-align: center;
}

#categories li{
    width: 266px;
    height: 56px;
    background: url(../static/epgimg/cate.jpg);
    line-height: 50px;
    color:white;
}
#categoriesCon{
    position: absolute;
    width: 266px;
    height: 224px;
    top: 120px;
    overflow: hidden;
}
#cateFocus{
  position: absolute;
  top:122px;
  left: 10px;
  display:none;
}
.button{
    position: absolute;
    top: 635px;
}

#movielist{
    position: absolute;
    width: 860px;
    height: 512px;
    left: 343px;
    top: 100px;
}
.movie{
    position:absolute;
    top:0px;
    width:140px;
}
.name{
    position: absolute;
    width: 140px;
    text-align: center;
    left: 0px;
    top: 213px;
    height: 35px;
    color: wheat;
    font-size: 16px;
}
.pageimg{
    position: absolute;
    top:70px;
}

.priceCorner{
	position: absolute;
	left:0px;
	top:0px;
}

#previous{
	position: absolute;
	left: 1060px;
	top: 60px;
}

#next{
	position: absolute;
	left: 1140px;
	top: 60px;
}

#wxts{
	position:absolute;
	background: url(../static/epgimg/wxts.png);
	width:594px;
	height:413px;
	left:343px;
	top:150px;
}

.movieimg{
	width:140px;
	height: 200px;
}
</style>
</head>
<body>
<div class="background" id="background">
<div id="categoriesCon">
<ul id="categories">

</ul>
</div>
<img id="cateFocus" src="../static/epgimg/jdk.png">
<img src="../static/epgimg/zcyy.png" class="zcyy">
<img id="previous" src="../static/epgimg/previous.png">
<img id="next" src="../static/epgimg/next.png">
<div id="movielist" style="display:none;">
<div id="movielist_0" class="movie" style="left:0px;"><img id="priceCorner_0" class="priceCorner"><img id="movie_0" class="movieimg" src=""><div id="name_0" class="name">123</div></div>
<div id="movielist_1" class="movie" style="left:180px;"><img id="priceCorner_1" class="priceCorner"><img id="movie_1" class="movieimg" src=""><div id="name_1" class="name">123</div></div>
<div id="movielist_2" class="movie" style="left:360px;"><img id="priceCorner_2" class="priceCorner"><img id="movie_2" class="movieimg" src=""><div id="name_2" class="name">123</div></div>
<div id="movielist_3" class="movie" style="left:540px;"><img id="priceCorner_3" class="priceCorner"><img id="movie_3" class="movieimg" src=""><div id="name_3" class="name">123</div></div>
<div id="movielist_4" class="movie" style="left:720px;"><img id="priceCorner_4" class="priceCorner"><img id="movie_4" class="movieimg" src=""><div id="name_4" class="name">123</div></div>
<div id="movielist_5" class="movie" style="left:0px;top:256px"><img id="priceCorner_5" class="priceCorner"><img id="movie_5" class="movieimg" src=""><div id="name_5" class="name">123</div></div>
<div id="movielist_6" class="movie" style="left:180px;top:256px"><img id="priceCorner_6" class="priceCorner"><img id="movie_6" class="movieimg" src=""><div id="name_6" class="name">123</div></div>
<div id="movielist_7" class="movie" style="left:360px;top:256px"><img id="priceCorner_7" class="priceCorner"><img id="movie_7" class="movieimg" src=""><div id="name_7" class="name">123</div></div>
<div id="movielist_8" class="movie" style="left:540px;top:256px"><img id="priceCorner_8" class="priceCorner"><img id="movie_8" class="movieimg" src=""><div id="name_8" class="name">123</div></div>
<div id="movielist_9" class="movie" style="left:720px;top:256px"><img id="priceCorner_9" class="priceCorner"><img id="movie_9" class="movieimg" src=""><div id="name_9" class="name">123</div></div>
</div>
<div id="picFocus" style="position: absolute;  left: 323px; top: 84px; display: block; height: 233px;  width: 180px;">
<img  src="../static/epgimg/picFocus.png" style="position: absolute;top:0px;  height: 233px;  width: 180px;">
<img id="picFocusImg" style="position: absolute;  left: 7px;  top: 6px;  width: 165px;  height: 220px;">
<img id="priceCorner" style="position:absolute;left: 8px;  top: 6px;">
</div>

<img id="yxry" src="../static/epgimg/yxtb.png" class="button" style="left:215px;"/>
<img id="gdjc" src="../static/epgimg/gdjc_f.png" class="button" style="left:430px;"/>
<img id="jjcx" src="../static/epgimg/jjcx.png" class="button" style="left:640px;"/>
<img id="wdsf" src="../static/epgimg/wdsf.png" class="button" style="left:850px;"/>
<img id="btnFocus" src="../static/epgimg/btnFocus.png" style="position: absolute;  top: 630px;  left: 210px; display:none;">

<div id="screen"
    style="position: absolute; background: url('../static/epgimg/screen.png'); top:0px;left:0px;width: 1280px; height: 720px; display: none;">
</div>
        
<div id="wxts" style="display: none;">
        <div id="wxtsmsg"
            style="position: absolute; color: white; left: 38px; width: 496px; text-align: center; top: 130px;">hahahaha</div>
        <img src="../static/epgimg/fh_f.png"
            style="position: absolute; top: 261px; left: 220px;">
</div>
</div>
<script type="text/javascript" src="../static/js/epgCommon.js"></script>
<script type="text/javascript" src="../static/js/epgCQ.js"></script>
<script>

var cateid=<%=cateid%>;
var URL = {
        ipaddr:ipaddress,
        categorylist:"/REST/category/list",
        categorymovie:"/REST/category/movie"
    }
    
var category={
        size:0,
        data:[],
        index:0,
        focusIndex:0,
        listSize:4,
        initTop:122,
        step:56,
        lis:[],
        init:function(){
            this.size=this.data.length;
            this.listSize=this.data.length;
            for(var i=0;i<this.size;i++){
                var li = document.createElement("li");
                li.innerHTML=this.data[i].name;
                if(cateid!=-1&&this.data[i].id==cateid){
                    this.index=i;       
                }
                $("categories").appendChild(li);
            }
            this.lis=$("categories").getElementsByTagName("li");
            this.lis[this.index].style.background="url(../static/epgimg/cate_f.jpg)";
        },
        setFocus:function(){
            $("cateFocus").style.top=this.initTop+this.focusIndex*this.step+"px";
            $("cateFocus").style.display="block";
        },
        blur:function(){
            $("cateFocus").style.display="none";
        },
        moveDown:function(){
            if(this.focusIndex==this.listSize-1){
                this.focusIndex=0;
            }else{
                this.focusIndex++;
            }
            this.setFocus();
        },
        moveUp:function(){
            if(this.focusIndex==0){
                this.focusIndex=this.listSize-1;
            }else {
                this.focusIndex--;
            }
            this.setFocus();
        },
        moveRight:function(){
            this.blur();
        },
        ok:function(){
            this.index=this.focusIndex;
            for(var i=0;i<this.size;i++){
                this.lis[i].style.background="url(../static/epgimg/cate.jpg)";
            }
            this.lis[this.index].style.background="url(../static/epgimg/cate_f.jpg)";
            insRecord({action:15,cateid:category.data[category.index].id});
            getCategoryMovie({pageNo:1,sucFunc:function(result){
                movielist.init(result.pageBean);
                movielist.refresh();
                movielist.blur();
                },failFunc:function(){}});
        }
    }
    
var movielist={
    pageId:1,
    pageCount:0,
    totalCount:0,
    pageSize:10,
    recordList:[],
    index:0,
    initLeft:323,
    step:180,
    size:0,
    init:function(pageBean){
        this.pageId=pageBean.pageId;
        this.pageCount=pageBean.pageCount;
        this.totalCount=pageBean.totalCount;
        this.pageSize=pageBean.totalCount;
        this.recordList=pageBean.recordList;
        this.index=0;
        this.size=pageBean.recordList.length;
        $("picFocusImg").src="../static/epgimg/"+this.recordList[this.index].identify+"_cate_preview.jpg";
        $("priceCorner").src="../static/epgimg/priceCorner_"+this.recordList[this.index].price+".png";
        $("movielist").style.display="block";
        $("picFocus").style.display="block";
    },
    refresh:function(){
        for(var i=0;i<this.size;i++){
            $("movie_"+i).src="../static/epgimg/"+this.recordList[i].identify+"_cate_preview.jpg";
            $("priceCorner_"+i).src="../static/epgimg/priceCorner_"+this.recordList[i].price+".png";
            $("name_"+i).innerHTML=this.recordList[i].name;
            $("movielist_"+i).style.display="block";
        }
        for(;i<10;i++){
            $("movielist_"+i).style.display="none";
        }
    },
    setFocus:function(){
        if(this.index<5){
            $("picFocus").style.top="84px"; 
        }else{
            $("picFocus").style.top="340px";
        }
        $("picFocus").style.display="block";
        $("picFocus").style.left=this.initLeft+(this.index%5)*this.step+"px";
        $("picFocusImg").src="../static/epgimg/"+this.recordList[this.index].identify+"_cate_preview.jpg";
        $("priceCorner").src="../static/epgimg/priceCorner_"+this.recordList[this.index].price+".png";
    },
    blur:function(){
        $("picFocus").style.display="none";
    },
    moveDown:function(){
        this.index=this.index+5<=this.size-1?this.index+5:5;
        this.setFocus();
    },
    moveUp:function(){
        this.index=this.index-5;
        this.setFocus();
    },
    moveRight:function(){
        if(this.index==this.size-1){
            if(this.pageCount>this.pageId){
                getCategoryMovie({pageNo:this.pageId+1,sucFunc:function(result){
                        movielist.init(result.pageBean);
                        movielist.refresh();
                        movielist.setFocus();
                },failFunc:function(){}});
            }
        }else{
            this.index++;
            this.setFocus();
        }
    },
    moveLeft:function(){
        if(this.index==0){
            if(this.pageId>1){
                getCategoryMovie({pageNo:this.pageId-1,sucFunc:function(result){
                        movielist.init(result.pageBean);
                        movielist.refresh();
                        movielist.setFocus();
                },failFunc:function(){}});
            }
        }else{
            this.index--;
            this.setFocus();
        }
    },
    ok:function(){
        insRecord({action:11,mediaId:this.recordList[this.index].id});
		setTimeout(function(){
			location.href="moviedetail.jsp?pid="+movielist.recordList[movielist.index].id+"&id="+cateid;
		},500);
    }
}

var changePage = {
	index:1,
	setFocus:function(){
		$("next").src="../static/epgimg/next_f.png";
	},
	blur:function(){
		$("previous").src="../static/epgimg/previous.png";
		$("next").src="../static/epgimg/next.png";
	},
	moveLeft:function(){
		this.index=0;
		$("previous").src="../static/epgimg/previous_f.png";
		$("next").src="../static/epgimg/next.png";
	},
	moveRight:function(){
		this.index=1;
		$("previous").src="../static/epgimg/previous.png";
		$("next").src="../static/epgimg/next_f.png";
	},
	ok:function(){
		if(this.index==0){
			/*首页*/
			if(movielist.pageId==1){
				windows.hidden();
				$("wxtsmsg").innerHTML="已经是第一页";
				windows.show("wxts");
			}else{
				getCategoryMovie({pageNo:movielist.pageId-1,sucFunc:function(result){
                    movielist.init(result.pageBean);
                    movielist.blur();
                    movielist.refresh();
            	},failFunc:function(){}});
			}
		}else if(this.index==1){
			/*尾页*/
			if(movielist.pageId==movielist.pageCount){
				windows.hidden();
				$("wxtsmsg").innerHTML="已经是最后一页";
				windows.show("wxts");
			}else{
				getCategoryMovie({pageNo:movielist.pageId+1,sucFunc:function(result){
                    movielist.init(result.pageBean);
                    movielist.blur();
                    movielist.refresh();
            	},failFunc:function(){}});
			}
		}
	}
}

function getCategoryList(param){
    var url = URL.ipaddr+URL.categorylist;
    var data=""; 
    var sucFunc=param.sucFunc;
    var failFunc=param.failFunc;
    ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
        var result = eval("("+xmlHttp.responseText+")");
        if(result.errCode==0){
            sucFunc(result);
        }else{
            failFunc(result);
        }
    }});
}

function getCategoryMovie(param){
    var url = URL.ipaddr+URL.categorymovie;
    var pageNo=param.pageNo;
    var data="{\"categoryid\":"+category.data[category.index].id+",\"pageNo\":"+pageNo+",\"pageRow\":10}"; 
    var sucFunc=param.sucFunc;
    var failFunc=param.failFunc;
    ajax({url:url,data:data,method:"post",handler:function(xmlHttp){
        var result = eval("("+xmlHttp.responseText+")");
        if(result.errCode==0){
            sucFunc(result);
        }else{
            failFunc(result);
        }
    }});
}

var wxts = {
    ok : function() {
        windows.hidden();
    }
}

var area=0;/*0-movelist 1左边列表  2下方button*/
function moveRight(){
    if(area==0){
        movielist.moveRight();
    }else if(area==1){
        if(movielist.size==0){
            category.blur();
            area=2;
            setFocus(focusIndex);
        }else{
            category.blur();
            area=0;
            movielist.setFocus();
        }
        
    }else if(area==2){
        if(focusIndex==3)
            setFocus(0);
        else
            setFocus(focusIndex+1);
    }else if(area==3){
    	changePage.moveRight();
    }
}

function moveLeft(){
    if(area==0){
        if(movielist.index==0&&movielist.pageId==1){
            movielist.blur();
            area=1;
            category.setFocus();
        }else{
              movielist.moveLeft();
        }
    }else if(area==2){
        if(focusIndex==0)
            setFocus(3);
        else
            setFocus(focusIndex-1);
    }else if(area==3){
    	changePage.moveLeft();
    }
}

function moveDown(){
       if(area==1){
           category.moveDown();
       }else if(area==0){
           if(movielist.index<5&&movielist.size>5){
               movielist.moveDown();
           }else{
               movielist.blur();
               area=2;
               setFocus(focusIndex);
           }
       }else if(area==3){
    	   changePage.blur();
    	   area=0;
    	   movielist.setFocus();
       }
}

function moveUp(){
       if(area==1){
           category.moveUp();
       }else if(area==2){
           movielist.setFocus();
           buttonBlur();
           area=0;
       }else if(area==0){
           if(movielist.index>4){
               movielist.moveUp();
           }else{
        	   movielist.blur();
        	   area=3;
        	   changePage.setFocus();
        	   
           }
       }
}

function doConfirm(){
	if (!windows.flag) {
	    if(area==0){
	        movielist.ok();
	    }else if(area==1){
	        category.ok();
	    }else if(area==2){
	        buttonClick();
	    }else if(area==3){
	    	changePage.ok();
	    }
    }else{
    	window[windows.key].ok();
    }
}

window.onload=function(){
    getCategoryList({sucFunc:function(result){
        category.data = result.list;
        category.init();
        getCategoryMovie({pageNo:1,sucFunc:function(result){
                movielist.init(result.pageBean);
                movielist.refresh();
        },failFunc:function(){}});
    }});
    focusIndex=1;
}
</script>
</body>
</html>