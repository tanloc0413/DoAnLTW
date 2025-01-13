<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Cấu hình bundle -->
<fmt:setBundle basename="messages" var="bundle" scope="session"/>

<!-- Lấy Locale từ session -->
<%--<fmt:setLocale value="${sessionScope.langName != null ? sessionScope.langName : 'vi'}"/>--%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<%--<fmt:setLocale value="${sessionScope.lang}"/>--%>
<form action="./Language" method="post">
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <%--                        <li><a href="<%=url%>"><i class="fa fa-user"></i> Tài khoản của tôi</a></li>--%>
                                </a></li>
                            <li><a href="#"><i class="fa fa-heart"></i> Danh sách mong muốn
                            </a></li>
                            <li><a href="Order.jsp"><i class="fa fa-user"></i> Giỏ hàng </a>
                            </li>
                            <c:choose>
                                <c:when test="${ not empty  sessionScope.currentUser}">
                                    <li><a href="#"><i class="fa fa-user"></i> ${sessionScope.currentUser.name}</a></li>
                                    <li><a href="./logOut"><i class="fa fa-sign-out"></i> Đăng xuất</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="Login.jsp"><i class="fa fa-user"></i> Đăng nhập</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <%--                        <li><a href="<%=log%>"><i class="fa fa-user"></i> Đăng xuất</a></li>--%>
                        </ul>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span
                                        class="key">Tiền tệ :</span><span class="value">VNĐ </span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">VNĐ</a></li>
                                    <li><a href="#">USD</a></li>
                                </ul>
                            </li>

                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">
                                    <span class="key">Ngôn ngữ :</span>
                                    <!-- Hiển thị ngôn ngữ hiện tại -->
                                    <span class="value">
                                     <c:choose>
                                        <c:when test="${sessionScope.langName == 'vi'}">Tiếng Việt</c:when>
                                        <c:when test="${sessionScope.langName == 'en'}">English</c:when>
                                        <c:otherwise>Tiếng Việt</c:otherwise>
                                    </c:choose>
                                    </span>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="./Language?lang=vi">Tiếng Việt</a></li>
                                    <li><a href="./Language?lang=en">Tiếng Anh</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="js_home/owl.carousel.min.js"></script>
<script src="js_home/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js_home/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js_home/main_home.js"></script>

<!-- Slider -->
<script type="text/javascript" src="js_home/bxslider.min.js"></script>
<script type="text/javascript" src="js_home/script.slider.js"></script>
</body>
</html>
