<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生成绩管理系统</title>
<script type="text/javascript" src="<%=basePath%>resource/js/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/login.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/layer/layer.js"></script>
<link href="<%=basePath%>resource/css/my/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
/*
 * button enter是件
 **
 */
	document.onkeydown = function (e) {
	    var theEvent = window.event || e;
	    var code = theEvent.keyCode || theEvent.which;
	    if (code == 13) {
	    	loginForm();
	    }
	}
	/***
	ajax表单校验
	*/
	function loginForm(){
		
		   		  if($("#username").val()==""){
		   			  $('#Error').text("用户名不能为空");
		   			  return false;
		   		  }
		   		  if($('#password').val()==""){
		   			  $('#Error').text("密码不能为空");
		   			  return false;
		   		  }
		   		  if($('.code').val()==""){
		   			  $('#Error').text("验证码不能为空");
		   			 return false;
		   		  }
		   		  $.ajax({
		   			 url:"/Student/login/login",
		   			 type:"post",
		   			 dataType:"json",
		   			 data:{
		   				 "username":$("#username").val(),
		   				 "password":$('#password').val(),
		   				 "code":$('.code').val(),
		   			 },
		   			 success:function(data){
			   				 if(data.code!=-1){
			   					layer.alert(data.message, {
			   					  icon: 1,
			   					  skin: 'layer-ext-moon' 
			   					},function(){
			   						location.href="/Student/login/success";
			   					});
			   					
			   			     }else{
			   				     $('#Error').text(data.message);
			   				 }
		   				 }
		   		  });
	}
</script>
</head>
<body>
   <!-- top -->
     <div id="top">
      <div id="title">
        <span>学 生 成 绩 管 理 系 统</span>
      </div>
     </div>
   <!-- 登录框 -->
   <div id="center">
       <div id="login">
          <span>管理员登录</span>
          <label style="color: red;min-height: 20px;max-width: 100px" ></label>
	          <div id="user">
	         <form action="<%=basePath%>login/login" method="post" id="login_form">
	             <label>用户名:</label><input type="text" name="user" id="username" class="inputType">
	          </div>
	          <div id="pass">
	             <label>密　码:</label><input type="password" name="password" id="password" class="inputType">
	          </div>
	          <div id="code">
	             <label>验证码:<input type="text" name="code" class="code" >
	             <img id="image" alt="换一张"  src="<%=basePath %>image" onclick="NextImage()"></label>
	    
	          </div> 
	          <div id="error">  
	                <div style="float: left;position: relative;left:20px;top: 0px;color:red" id="Error"></div>
	            
	                <div id="forget_password" style="float: left;position: absolute;left: 700px;"><a href="#">忘记密码</a></div>
              </div>	          
               <div id="code" >
	             <input type="button" value="登录" id="btn_sub" onclick="loginForm()" onkeydown="key()">
	             <input type="reset" value="重置" id="btn_ret">
	          </div>   
	       </form>        
       </div>
   </div>
   <div id="foot">
        <div class="title"></div>
   </div>
</body>
</html>