<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.model.Oders" %>
<%@ page import="vn.edu.hcmuaf.dao.OdersDao" %>
<%@ page import="vn.edu.hcmuaf.dao.UserDao" %>
<%@ page import="vn.edu.hcmuaf.dao.StatusDao" %>
<%@ page import="vn.edu.hcmuaf.model.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Danh sách đơn hàng</title>
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

<%
    List<Oders> oders1 = OdersDao.getOdersAdmin();
    if (oders1 == null) oders1 = new ArrayList<>();
    List<Oders> oders2 = OdersDao.getOdersStatusNews();
    if (oders2 == null) oders2 = new ArrayList<>();
    List<Oders> oders3 = OdersDao.getOdersStatusCanel();
    if (oders3 == null) oders3 = new ArrayList<>();
%>

<jsp:include page="menu.jsp"/>
<!-- Start Welcome area -->
<div class="all-content-wrapper">
    <jsp:include page="header.jsp"/>
    <div class="product-status mg-b-30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-status-wrap">
                        <h4>Danh sách đơn hàng</h4>
                        <div class="add-product">
                            <a href="product-edit.jsp">Thêm đơn hàng</a>
                        </div>
                        <ul id="myTab3" class="tab-review-design">
                            <li class="active"><a href="#description"><i class="" aria-hidden="true"></i> Đơn hàng chưa
                                hoàn thành</a></li>
                            <li><a href="#all"><i class="" aria-hidden="true"></i> Tất cả đơn hàng</a></li>
                            <li><a href="#cancel"><i class="" aria-hidden="true"></i> Đã hủy</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content custom-product-edit">
                            <div class="product-tab-list tab-pane fade active in" id="description">
                                <div class="row">
                                    <table>
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Giá trị đơn hàng</th>
                                            <th>Thông tin</th>
                                            <th>Thanh toán</th>
                                            <th>Cài đặt</th>
                                        </tr>
                                        <%
                                            for (Oders o : oders2) {%>
                                        <tr>
                                            <td><%=o.getId()%>
                                            </td>
                                            <td><%=UserDao.getName(o.getMaKH())%>
                                            </td>
                                            <td><%=StatusDao.getName(o.getStatus())%>
                                            </td>
                                            <td><%=o.getDate()%>
                                            </td>
                                            <td><%=Products.priceFormat(o.getTotal())%>
                                            </td>
                                            <td>
                                                <form action="./OderDetail" method="post">
                                                    <input name="id" value="<%=o.getId()%>" style="display: none">
                                                    <button data-toggle="tooltip" title="submit" class="pd-setting-ed">
                                                        <a
                                                                href="updateOder.jsp"><i class="fa fa-pencil-square-o"
                                                                                         aria-hidden="true"></i></a>
                                                    </button>
                                                </form>

                                            </td>
                                            <td><%=StatusDao.getName(o.getThanhtoan())%>
                                            </td>
                                            <td>
                                                <form action="./UpdateStatusOder" method="post">
                                                    <input name="madh" value="<%=o.getId()%>" style="display: none">
                                                    <button data-toggle="tooltip" title="submit" class="pd-setting-ed">
                                                        <a
                                                                href="updateOder.jsp"><i class="fa fa-pencil-square-o"
                                                                                         aria-hidden="true"></i></a>
                                                    </button>
                                                </form>

                                            </td>
                                        </tr>
                                        <% }%>
                                    </table>

                                </div>

                            </div>
                            <div class="product-tab-list tab-pane fade" id="all">
                                <div class="row">
                                    <table>
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Giá trị đơn hàng</th>
                                            <th>Thông tin</th>
                                            <th>Thanh toán</th>

                                        </tr>
                                        <%
                                            for (Oders oders : oders1) {%>


                                        <tr>
                                            <td><%=oders.getId()%>
                                            </td>
                                            <td><%=UserDao.getName(oders.getId())%>
                                            </td>
                                            <td><%=StatusDao.getName(oders.getStatus())%>
                                            </td>
                                            <td><%=oders.getDate()%>></td>
                                            <td><%=Products.priceFormat(oders.getTotal())%>
                                            </td>
                                            <td><a href="product-cart.jsp">xem chi tiết</a></td>
                                            <td><%=StatusDao.getName(oders.getThanhtoan())%>
                                            </td>

                                        </tr>
                                        <% }%>
                                    </table>
                                </div>
                            </div>
                            <div class="product-tab-list tab-pane fade" id="cancel">
                                <div class="row">
                                    <table>
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Giá trị đơn hàng</th>
                                            <th>Thông tin</th>
                                            <th>Thanh toán</th>
                                        </tr>
                                        <%
                                            for (Oders oders : oders3) {%>


                                        <tr>
                                            <td><%=oders.getId()%>
                                            </td>
                                            <td><%=UserDao.getName(oders.getId())%>
                                            </td>
                                            <td><%=StatusDao.getName(oders.getStatus())%>
                                            </td>
                                            <td><%=oders.getDate()%>></td>
                                            <td><%=Products.priceFormat(oders.getTotal())%>
                                            </td>
                                            <td><a href="product-cart.jsp">xem chi tiết</a></td>
                                            <td><%=StatusDao.getName(oders.getThanhtoan())%>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </table>
                                </div>
                            </div>
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