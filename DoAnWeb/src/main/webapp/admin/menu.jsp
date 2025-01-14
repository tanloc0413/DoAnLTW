<%--
  Created by IntelliJ IDEA.
  User: THINH
  Date: 12/11/2024
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- nalika Icon CSS
        ============================================ -->
    <link rel="stylesheet" href="css/nalika-icon.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<div class="left-sidebar-pro">
    <nav id="sidebar" class="">
        <div class="sidebar-header" style="height: 90px">
            <a href="index.jsp">
                <img class="main-logo" src="img/logo/logo.png" alt="logo"/>
            </a>
            <strong><img src="img/logo/logo.png" alt="logo"/></strong>
        </div>
        <div class="nalika-profile">
            <div class="profile-dtl">
                <a href="#"><img src="img/notification/picture.png" alt=""/></a>
                <h2>${sessionScope.currentUser.name}</h2>
            </div>
            <div class="profile-social-dtl">
                <ul class="dtl-social">
                    <li><a href="#"><i class="icon nalika-facebook"></i></a></li>
                    <li><a href="#"><i class="icon nalika-twitter"></i></a></li>
                    <li><a href="#"><i class="icon nalika-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="left-custom-menu-adp-wrap comment-scrollbar">
            <nav class="sidebar-nav left-sidebar-menu-pro">
                <ul class="metismenu" id="menu1">
                    <li class="active">
                        <a class="has-arrow" href="index.jsp">
                            <i class="icon nalika-home icon-wrap"></i>
                            <span class="mini-click-non">Tổng quan</span>
                        </a>
                        <ul class="submenu-angle" aria-expanded="true">
                            <li><a href="index.jsp"><span class="mini-sub-pro">Bảng điều khiển</span></a></li>
                            <li><a href="./ListManagerProduct"><span class="mini-sub-pro">Danh sách sản phẩm</span></a></li>

                            <li><a href="./OderAdmin"><span class="mini-sub-pro">Danh sách đơn hàng</span></a></li>

                            <li><a href="./ListCategory"><span class="mini-sub-pro">Danh mục sản phẩm</span></a></li>
                            <li><a href="analytics.html"><span class="mini-sub-pro">Phân tích</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><i
                                class="fa big-icon fa-users icon-wrap"></i> <span
                                class="mini-click-non">Tài Khoản</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a href="./ListAdminAccount"><span class="mini-sub-pro">Quản trị</span></a></li>
                            <li><a href="./ListUserAccount"><span class="mini-sub-pro">Người dùng</span></a></li>
                        </ul>
                    </li>

                </ul>
            </nav>
        </div>
    </nav>
</div>


<script src="js/vendor/jquery-1.12.4.min.js"></script>
<!-- bootstrap JS
    ============================================ -->
<script src="js/bootstrap.min.js"></script>
<!-- wow JS
    ============================================ -->
<script src="js/wow.min.js"></script>
<!-- price-slider JS
    ============================================ -->
<script src="js/jquery-price-slider.js"></script>
<!-- meanmenu JS
    ============================================ -->
<script src="js/jquery.meanmenu.js"></script>
<!-- owl.carousel JS
    ============================================ -->
<script src="js/owl.carousel.min.js"></script>
<!-- sticky JS
    ============================================ -->
<script src="js/jquery.sticky.js"></script>
<!-- scrollUp JS
    ============================================ -->
<script src="js/jquery.scrollUp.min.js"></script>
<!-- mCustomScrollbar JS
    ============================================ -->
<script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/scrollbar/mCustomScrollbar-active.js"></script>
<!-- metisMenu JS
    ============================================ -->
<script src="js/metisMenu/metisMenu.min.js"></script>
<script src="js/metisMenu/metisMenu-active.js"></script>
<!-- morrisjs JS
    ============================================ -->
<script src="js/sparkline/jquery.sparkline.min.js"></script>
<script src="js/sparkline/jquery.charts-sparkline.js"></script>
<!-- calendar JS
    ============================================ -->
<script src="js/calendar/moment.min.js"></script>
<script src="js/calendar/fullcalendar.min.js"></script>
<script src="js/calendar/fullcalendar-active.js"></script>
<!-- plugins JS
    ============================================ -->
<script src="js/plugins.js"></script>
<!-- main JS
    ============================================ -->
<script src="js/main.js"></script>
</body>
</html>
