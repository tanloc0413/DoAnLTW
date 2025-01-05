<%@ page import="vn.edu.hcmuaf.model.Products" %>
<%@ page import="vn.edu.hcmuaf.dao.CategoriesDao" %>
<%@ page import="vn.edu.hcmuaf.dao.StatusDao" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.model.Status" %>
<%@ page import="vn.edu.hcmuaf.model.ProductImages" %>
<%@ page import="vn.edu.hcmuaf.model.Categories" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Chỉnh sửa sản phẩm</title>
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


<form action="./ProductDetail" method="post">
    <%
        HttpSession sessioan = request.getSession();
        Products products = (Products) sessioan.getAttribute("pro");
        List<Categories> dire =  CategoriesDao.getDirectorysAdmin();
        List<Status> statusList = StatusDao.getStatusDirectory();
//        List<ProductImages> images = ImageDao.getImageProductByID(products.getId());
    %>
    <jsp:include page="menu.jsp"/>
    <!-- Start Welcome area -->
    <div class="all-content-wrapper">
        <jsp:include page="header.jsp"/>
        <!-- Single pro tab start-->
        <div class="single-product-tab-area mg-b-30">
            <!-- Single pro tab review Start-->
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#description"><i class="icon nalika-edit" aria-hidden="true"></i> Cập nhật sản phẩm</a></li>
                                    <li><a href="#reviews"><i class="icon nalika-picture" aria-hidden="true"></i> Hình ảnh</a></li>
                                    <li><a href="#INFORMATION"><i class="icon nalika-chat" aria-hidden="true"></i> Mô tả</a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <p>Mã sản phẩm: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-tags" aria-hidden="true"></i></span>
                                                        <input type="text"  class="form-control" name="masp" placeholder="Mã sản phẩm" value="">
                                                    </div>
                                                    <p>Tên sản phẩm: </p>
                                                    <div class="input-group mg-b-pro-edt">

                                                        <span class="input-group-addon"><i class="icon nalika-edit" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="ten" placeholder="Tên sản phẩm" value="">
                                                    </div>
                                                    <p>Giá sản phẩm(Vnđ): </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="price" placeholder="Giá bán" value="">
                                                    </div>
                                                    <p>Bảo hành: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="tgbh" placeholder="Thời gian bảo hành" value="">
                                                    </div>
                                                    <p>Hãng sản xuất: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="icon nalika-home" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="hang" placeholder="Hãng sản xuất" value="">
                                                    </div>
                                                    <p>Phiên bản sản phẩm: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="icon nalika-edit" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="version" placeholder="Phiên bản" value="">
                                                    </div>
                                                    <p>Số lượng sử dụng: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="icon nalika-edit" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="number" placeholder="Số lượng thiết bị" value="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <p>Loại sản phẩm: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="icon nalika-edit" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="type" placeholder="Loại sản phẩm" value="">
                                                    </div>
                                                    <p>Ngày thêm sản phẩm: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" placeholder="Ngày tạo" value="">
                                                    </div>
                                                    <p>Hạng sử dụng: </p>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="time" placeholder="Hạng sử dụng" value="">
                                                    </div>
                                                    <p>Trạng thái: </p>
                                                    <div class="input-group mg-b-pro-edt" style="width: 100%">
                                                        <select name="select" class="form-control pro-edt-select form-control-primary">
                                                            <option value="" > </option>
                                                            <%
                                                                for (Status s : statusList){%>
                                                            <option value="<%=s.getId()%>" ><%=s.getName()%></option>
                                                            <% }%>
                                                        </select>
                                                    </div>
                                                    <p>Danh mục: </p>
                                                    <select name="select1" class="form-control pro-edt-select form-control-primary">
                                                        <option value="" > </option>
                                                        <%
                                                            for (Categories d : dire){%>
                                                        <option value="<%=d.getId()%>"><%=d.getName()%></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="product-tab-list tab-pane fade" id="reviews">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="review-content-section ">
                                                    <div class="text-center custom-pro-edt-ds" >

                                                        <form action="./ImageSerive" method="post">
                                                            <input name="masp"  style="display: none;" value="">
                                                            <input type="file" name="url" class="form-control" placeholder="Đường dẫn hình ảnh " style="width: 1200px; float: left">
                                                            <button type="submit" class="btn btn-ctl-bt waves-effect waves-light" style="margin-bottom: 30px; margin-left:30px;float: left">Thêm ảnh
                                                            </button>
                                                        </form>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <div class="pro-edt-img">
                                                                <img src="" alt="" />
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="product-edt-pix-wrap">
                                                                        <div class="row">
                                                                            <div class="col-lg-6">
                                                                                <div class="product-edt-remove">
                                                                                    <button type="button" class="btn btn-ctl-bt waves-effect waves-light">Xóa
                                                                                        <i class="fa fa-times" aria-hidden="true"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
<%--                                                    <%--%>
<%--                                                        for (ProductImages i : images){%>--%>
<%--                                                    <div class="row">--%>
<%--                                                        <div class="col-lg-4">--%>
<%--                                                            <div class="pro-edt-img">--%>
<%--                                                                <img src="<%=i.getUrl()%>" alt="" />--%>
<%--                                                            </div>--%>

<%--                                                        </div>--%>
<%--                                                        <div class="col-lg-8">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12">--%>
<%--                                                                    <div class="product-edt-pix-wrap">--%>
<%--                                                                        <div class="row">--%>
<%--                                                                            <div class="col-lg-6">--%>
<%--                                                                                <div class="product-edt-remove">--%>
<%--                                                                                    <button type="button" class="btn btn-ctl-bt waves-effect waves-light">Xóa--%>
<%--                                                                                        <i class="fa fa-times" aria-hidden="true"></i>--%>
<%--                                                                                    </button>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <%}%>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-tab-list tab-pane fade" id="INFORMATION">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="card-block">
                                                        <div class="input-group mg-b-15">
                                                            <textarea rows="20" name="text" cols="225"></textarea>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>

</html>