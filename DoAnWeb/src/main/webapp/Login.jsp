<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<title>Đăng nhập</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>

<c:set var="err" value="${requestScope.err}" />
<c:if test="${err == null}">
	<c:set var="err" value="" />
</c:if>

	<form action="./Login" method="post">
		<div class="limiter">
			<div class="container-login100" style="background-image: url('img/bg-01.jpg');">
				<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
					<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49" style="font-family:  Arial; font-size: 36px; font-weight: bold">
						Đăng Nhập
					</span>
						<p style="color: red; margin-left: 70px">
							${err}
						</p>
						<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
							<span class="label-input100" style="font-family:  Arial; font-size: 16px">Số điện thoại</span>
							<input class="input100" type="text" name="username" placeholder="Số điện thoại">
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>

						<div class="wrap-input100 validate-input" data-validate="Password is required">
							<span class="label-input100" style="font-family:  Arial; font-size: 16px">Mật khẩu</span>
							<input class="input100" type="password" name="pass" placeholder="Mật khẩu">
							<span class="focus-input100" data-symbol="&#xf190;"></span>
						</div>

						<div class="text-right p-t-8 p-b-31">
							<a href="forgot_password.jsp">
								Quên mật khẩu?
							</a>
						</div>

						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button type="submit" class="login100-form-btn" style="font-family:  Arial" >Đăng Nhập</button>
							</div>
						</div>

						<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Hoặc
						</span>
						</div>

						<div class="flex-c-m">
							<a href="#" class="login100-social-item bg1">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="login100-social-item bg2">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="login100-social-item bg3">
								<i class="fa fa-google"></i>
							</a>
						</div>

						<div class="flex-col-c p-t-20">
							<a href="sign_up.jsp" class="txt2">
								<u >Đăng ký</u>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</form>

	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js_home/main.js"></script>

</body>
</html>