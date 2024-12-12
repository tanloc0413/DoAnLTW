<%@ page import="vn.edu.hcmuaf.model.Oders" %>
<%@ page import="vn.edu.hcmuaf.model.OderItems" %>
<%@ page import="vn.edu.hcmuaf.dao.OderDetailDao" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.model.Products" %>
<%@ page import="vn.edu.hcmuaf.dao.ProductsDao" %>
<%@ page import="vn.edu.hcmuaf.dao.UserDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Chi tiết đơn hàng</title>
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
<form action="./OderDetail" method="post">
    <%
        Oders oders = (Oders) request.getAttribute("oder");
        if (oders==null) oders = new Oders();
        List<OderItems> oder =  OderDetailDao.getOder(oders.getId());
        if (oder == null) oder = new ArrayList<>();
    %>
    <jsp:include page="menu.jsp"/>
    <!-- Start Welcome area -->
    <div class="all-content-wrapper">
        <jsp:include page="header.jsp"/>
        <div class="product-cart-area mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-cart-inner">
                            <div id="example-basic" >
                                <h3>Danh sách sản phẩm</h3>
                                <section>
                                    <h3 class="product-cart-dn">Shopping</h3>
                                    <div class="product-list-cart">
                                        <div class="product-status-wrap border-pdt-ct">
                                            <table>
                                                <tr>
                                                    <th>Ảnh</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá bán</th>
                                                    <th>Thành tiền</th>
                                                </tr>
                                                <%
                                                    for (OderItems o : oder){
                                                        Products products = ProductsDao.getProduct(o.getMasp());
                                                %>
                                                <tr>
                                                    <td><img src="<%=products.getUrl()%>" alt="" /></td>
                                                    <td>
                                                        <h3><%=products.getName()%></h3>
                                                        <p> </p>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" value="2">
                                                    </td>
                                                    <td><%=Products.priceFormat(products.getPrice())%></td>
                                                    <td><%=Products.priceFormat(o.getTotal())%></td>
                                                </tr>
                                                <%   }%>
                                            </table>
                                        </div>
                                    </div>
                                </section>
                                <h3>Thông tin Khách hàng</h3>
                                <section>
                                    <h3 class="product-cart-dn">Shopping</h3>
                                    <div class="product-delivary">
                                        <div class="form-group">
                                            <label  class="form-label">Tên *</label>
                                            <input id="name-2" name="name" type="text" class="form-control" value="<%=UserDao.getName(oders.getMaKH())%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="address" class="form-label">Địa chỉ *</label>
                                            <input id="address" name="address" type="text" class="form-control" value="<%=oders.getAddress()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="phone-2" class="form-label">Điện thoại #</label>
                                            <input id="phone-2" name="phone" type="number" class="form-control phone" value="<%=oders.getPhone()%>">
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</form>


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
    <!-- tab JS
		============================================ -->
    <script src="js/tab.js"></script>
    <!-- wizard JS
		============================================ -->
    <script src="js/wizard/jquery.steps.js"></script>
    <script src="js/wizard/steps-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>

</html>