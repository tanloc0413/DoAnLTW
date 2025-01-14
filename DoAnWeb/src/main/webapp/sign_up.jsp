<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Đăng ký</title>
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
<form action="./register" method="post">
    <%
        String err = (String) request.getAttribute("err");
        if (err==null) err="";
    %>
    <div class="limiter">
        <div class="container-login100" style="background-image: url('img/bg-01.jpg');">
            <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <form class="login100-form validate-form">
					<span class="login100-form-title p-b-49" style="font-family:  Arial; font-size: 36px; font-weight: bold">
						Đăng Ký
					</span>
                    <p style="color: red; margin-left: 20px; margin-top: 10px; margin-bottom: 10px"><%=err%></p>

                    <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                        <span class="label-input100" style="font-family:  Arial; font-size: 16px">Họ và Tên</span>
                        <input class="input100" type="text" name="username" placeholder="Họ và Tên">
                        <span class="focus-input100" data-symbol="&#xf206;"></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-23" data-validate = "email is reauired">
                        <span class="label-input100" style="font-family:  Arial; font-size: 16px">Email</span>
                        <input class="input100" type="text" name="email" placeholder="email">
                        <span class="focus" data-symbol="&#xf206;"></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-23" data-validate = "email is reauired">
                        <span class="label-input100" style="font-family:  Arial; font-size: 16px">Số điện thoại</span>
                        <input class="input100" type="text" name="phone" placeholder="số điện thoại">
                        <span class="focus" data-symbol="&#xf206;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required" >
                        <span class="label-input100" style="font-family:  Arial; font-size: 16px">Mật khẩu</span>
                        <input class="input100" type="password" name="pass" placeholder="Mật khẩu">
                        <span class="focus-input100" data-symbol="&#xf190;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required" style="margin-top: 30px">
                        <span class="label-input100" style="font-family:  Arial; font-size: 16px">Nhập lại mật khẩu</span>
                        <input class="input100" type="password" name="pass1" placeholder="Nhập lại mật khẩu">
                        <span class="focus-input100" data-symbol="&#xf190;"></span>
                    </div>

                    <div class="text-right p-t-8 p-b-31">

                    </div>

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button type="submit"  class="login100-form-btn" >
                                <a  style="font-family:  Arial; color: white; font-size: 18px">Đăng Ký</a>
                            </button>
                        </div>
                    </div>
                    <div class="flex-col-c p-t-100">
                        <a href="Login.jsp" class="txt2">
                            Đăng nhập
                        </a>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <div id="dropDownSelect1"></div>
</form>


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