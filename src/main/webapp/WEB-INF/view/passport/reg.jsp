<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册</title>
<link rel="stylesheet" type="text/css"
	href="/resource/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resource/index.css" />
<link rel="stylesheet" type="text/css" href="/resource/jquery/screen.css" />
<script type="text/javascript" src="/resource/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
		<form id="form1">

			<div class="form-group">
				<label for="username">用户名</label> 
				<input id="username" type="text" class="form-control" name="username">
			</div>
			<div class="form-group">
				<label for="password">密码</label> 
				<input id="password" type="password" class="form-control" name="password">
			</div>
			<div class="form-group">
				<label for="repassword">确认密码</label> 
				<input id="repassword" type="password" class="form-control" name="repassword">
			</div>
			<div class="form-group form-inline">
				<label for="gender">性别</label> 
				<input id="gender" type="radio" class="form-check-input" name="gender" value="1" checked>男 
				<input id="gender" type="radio" class="form-check-input" name="gender" value="0">女
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-info">注册</button>
				<button type="reset" class="btn btn-warning">重置</button>
			</div>

		</form>

	</div>
	

</body>

 <script type="text/javascript">
	$(function() {
		$("#form1").validate({
			//1.定义规则
			rules:{
				username:{
					required:true,
					rangelength:[2,10],
				},
				password:{
					required:true,
					rangelength:[6,10],
				},
				repassword:{
					equalTo:"#password"
				},
			},
			
			messages:{
				username:{
					required:"用户名不能为空",
					rangelength:"用户名长度在2-10之间",
				},
				password:{
					 required:"密码不能为空",
					 rangelength:"密码长度在6-10之间"
				},
				repassword:{
					equalTo:"两次密码不一致",
				},
			},
			submitHandler:function(flag){
				$.post("/passport/reg",$("#form1").serialize(),
				function(flag){
					 if(flag){
						 alert("恭喜注册成功")
					 }
				 })
			}
		})
	})
</script> 
</html>