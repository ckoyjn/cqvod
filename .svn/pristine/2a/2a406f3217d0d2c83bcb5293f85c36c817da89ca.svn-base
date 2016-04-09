/*获取卡号*/
function getCANO(){
	return "9950000001970848";//CA.card.serialNumber;
}

var ipaddress="http://localhost:8080/cqvod";
var chargeaddress="http://192.168.9.106/commonPay/index.htm";

var focusButton=["yxry","gdjc","jjcx","wdsf"];
var focusIndex=0;
var focusLeft=["210px","424px","634px","844px"];
function setFocus(Index){
	focusIndex = Index;
	$("btnFocus").style.display="block";
	$("btnFocus").style.left=focusLeft[focusIndex];
}
function buttonBlur(){
	$("btnFocus").style.display="none";
}

function buttonClick(){
	if(focusIndex==0){
		insRecord({action:2});
		setTimeout(function(){
			location.href=URL.ipaddr;
		},500);
	} else if(focusIndex==1){
		insRecord({action:3});
		setTimeout(function(){
			location.href=URL.ipaddr+"/epg/category.jsp";
		},500);
	}else if(focusIndex==2){
		insRecord({action:4});
		setTimeout(function(){
			location.href=URL.ipaddr+"/epg/preview.jsp";
		},500);
	}else if(focusIndex==3){
		insRecord({action:5});
		setTimeout(function(){
			location.href=URL.ipaddr+"/epg/usermanage.jsp";
		},500);
    }
}
/*輸入模式*/
var inputmode = false;
var inputdom = null;
var inputmaxlen = 8;
function numberclick(num){
	if(inputmode&&inputdom.innerHTML.length<inputmaxlen){
		inputdom.innerHTML = inputdom.innerHTML+num;
	}
}
function backspace1(){
	if(inputmode && inputdom.innerHTML.length>0){
		var word = inputdom.innerHTML.substring(0,inputdom.innerHTML.length-1);
		inputdom.innerHTML = word;
	}
}
function insRecord(param){
	var data=null;
	if(param.mediaId!='undefined' && param.mediaId!=undefined){
		data="{\"smartcardid\":"+getCANO()+",\"action\":"+param.action+",\"mediaId\":\""+param.mediaId+"\"}";
	}else if(param.specialid!='undefined' && param.specialid!=undefined){
		data="{\"smartcardid\":"+getCANO()+",\"action\":"+param.action+",\"specialid\":"+param.specialid+"}";
	}else if(param.cateid!='undefined' && param.cateid!=undefined){
		data="{\"smartcardid\":"+getCANO()+",\"action\":"+param.action+",\"cateid\":"+param.cateid+"}";
	}else if(param.previewid!='undefined' && param.previewid!=undefined){
		data="{\"smartcardid\":"+getCANO()+",\"action\":"+param.action+",\"previewid\":"+param.previewid+"}";
	}else {
		data="{\"smartcardid\":"+getCANO()+",\"action\":"+param.action+"}";
	}
	
	var url = ipaddress+"/REST/AccessRecord/add";
	ajax({url:url,data:data,method:"post",handler:function(xmlHttp){}});
}