<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>用户登录</TITLE>
	<LINK href="./static/css/login.css" type=text/css rel=stylesheet>
	<META http-equiv=Content-Type content="text/html; charset=UTF-8">
	<META content="MSHTML 6.00.6000.16674" name=GENERATOR>
	#tagLibs()
</HEAD>
<BODY id=userlogin_body>
<DIV></DIV>
<script language="JavaScript"  type="text/JavaScript">
	function login(){
		var operatorName=document.getElementById("TxtUserName").value;
		var pwd=document.getElementById("TxtPassword").value;
	if(pwd==''||operatorName==''){
		alert("用户名或密码不能为空");
	}else{
	document.getElementById('myform').submit();
	}
	
	}
</script> 
	<script type="text/javascript">
		if(window.parent != window){
			window.parent.location.href = "${ctx}/index.html"; 
		}
		if(window.opener!=null){
			window.opener.location.href = "${ctx}/index.html";
			window.close();
		}
	</script>
<DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <form id="myform" action="./index.html" method="post">
    <UL>
      <LI class=user_main_text>用户名：</LI>
      <LI class=user_main_input><INPUT class=TxtUserNameCssClass id=TxtUserName 
      maxLength=20 name=LoginName> </LI></UL>
    <UL>
      <LI class=user_main_text>密 码： </LI>
      <LI class=user_main_input><INPUT class=TxtPasswordCssClass id=TxtPassword 
      type=password name=Password> </LI></UL>
    <UL>
    <UL>
      <LI class=user_main_text> </LI>
      <LI class=user_main_input style="color: red;">$!{loginResult} </LI></UL>
    <UL>
    
      <LI class=user_main_text> </LI>
      <LI class=user_main_input></LI></UL></DIV></LI>
    <LI class=user_main_r><INPUT class=IbtnEnterCssClass id=IbtnEnter style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" onclick='login();' 
    type=image src="./static/img/user_botton.gif" name=IbtnEnter> </LI></UL>
    </form>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px"></SPAN> </LI>
    <LI class=user_bottom_r></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>
<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

<DIV></DIV>

</FORM></BODY></HTML>