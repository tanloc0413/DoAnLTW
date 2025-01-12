<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Danh sách sản phẩm</title>
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
<c:set var="categories" value="${requestScope.categories}"/>
<c:set var="cate" value="${requestScope.catego}"/>
<c:if test="${empty cate }">
    <c:set var="cate" value="all"/>
</c:if>

<jsp:include page="menu.jsp"/>
<div class="all-content-wrapper">
    <div class="header-advance-area">
        <jsp:include page="header.jsp"/>

        <div class="breadcome-area">

            <div class="breadcome-area" style="margin-top: 50px">

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-wp">
                                            <div class="breadcomb-icon" style="margin-right: 30px">
                                                <i class="icon nalika-home"></i>
                                            </div>
                                            <div class="breadcomb-ctn" style="margin-top: 13px">
                                                <h2>Danh sách sản phẩm</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-report">
                                            <button data-toggle="tooltip" data-placement="left" title="Tải xuống"
                                                    class="btn"><i class="icon nalika-download"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4 style="float: left">Danh sách sản phẩm</h4>
                            <form action="./ProductFiltering" method="post">
                                <button type="submit" style="float: right; margin-right: 150px;  margin-top: 1px; width: 50px; height: 30px;border-radius: 5px">lọc</button>
                                <select name="selectm" style="float: right;border-radius: 5px; margin-right: 10px; margin-top: 1px; width: 200px; height: 30px ">
                                    <c:choose>
                                        <c:when test="${cate != 'all'}">
                                            <option value="" >${cate}</option>
                                            <option value="all" >all</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="all" >${cate}</option>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:forEach var="catetory" items="${requestScope.categories}">
                                        <c:if test="${catetory.name != cate}">
                                            <option value="${catetory.id}">${catetory.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </form>

                            <div class="add-product">
                                <a href="addproduct.jsp">Thêm sản phẩm</a>
                            </div>
                            <table>
                                <tr>
                                    <th>Ảnh</th>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Trạng thái</th>
                                    <th>Số lượng</th>
                                    <th>Giá bán(VND)</th>
                                    <th>Cài đặt</th>
                                </tr>
                                <c:forEach var="product" items="${requestScope.productsDaoList}">
                                    <tr>
                                        <td><img src="${product.image.substring(6)}" alt=""/></td>
                                        <td >${product.id}</td>
                                        <td>${product.name}</td>
                                        
                                        <c:choose>
                                            <c:when test="${product.status == 'Đang kinh doanh'}">
                                                <td>
                                                    <button class="ps-setting">${product.status}</button>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>
                                                    <button class="ds-setting">${product.status}</button>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>

                                        <td>0</td>
                                        <td class="large-column no-scientific-notation no-wrap" style="white-space: nowrap; width: 400px">
                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" groupingUsed="true" /></td>
                                        <td>
                                            <input type="hidden" name="productId" value="">
                                            <button data-toggle="tooltip" title="submit" class="pd-setting-ed"><a
                                                    href="product-edit.jsp"><i class="fa fa-pencil-square-o"
                                                                               aria-hidden="true"></i></a></button>

                                        </td>
                                        <td>
                                            <form action="./RemoveProduct" method="post" style="float: right">
                                                <input name="idPr" value="${product.id}" style="display: none">
                                                <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i
                                                        class="fa fa-trash-o" aria-hidden="true"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- jquery
    ============================================ -->
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
