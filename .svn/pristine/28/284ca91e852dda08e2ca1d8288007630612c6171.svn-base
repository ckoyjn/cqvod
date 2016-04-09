/**
 * 用于配置活动页面
 */

var recommendIndex=1;
var fxjc={
	index:0,
	data:[],
	pageCount:0,
	totalCount:0,
	size:0,
	init:function(pageBean){
		this.pageCount = pageBean.pageCount;
		this.totalCount = pageBean.totalCount;
	    this.pageId = pageBean.pageId;
	    this.data = pageBean.recordList;
		this.index = 0;
		this.size = this.data.length;
		for(var i=0;i<this.data.length;i++){
			$("fxjc_"+i).src="../static/epgimg/"+this.data[i].identify+".png";
		}
		
		for(var i=this.data.length;i<4;i++){
			$("fxjc_"+i).src="../static/epgimg/jqqd.png";
		}
	},
	setFocus:function(){
		$("fxjc_f_"+this.index).style.display="block";
	},
	moveRight:function(){
		this.blur();
		if(this.index<this.size-1){
			this.index++;	
		}
		this.setFocus();
	},
	moveLeft:function(){
		this.blur();
		if(this.index>0){
			this.index--;	
		}
		this.setFocus();
	},
	blur:function(){
		$("fxjc_f_"+this.index).style.display="none";
	},
	ok:function(){
		location.href="activity.jsp?activity="+this.data[this.index].identify;
	}
}

