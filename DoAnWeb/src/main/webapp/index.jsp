<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.model.Products" %>
<%@ page import="vn.edu.hcmuaf.model.Categories" %>
<%@ page import="vn.edu.hcmuaf.dao.CategoriesDao" %>
<%@ page import="vn.edu.hcmuaf.dao.ProductsDao" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div class="slider-area">
    <!-- Slider -->
    <div class="block-slider block-slider4">
        <ul class="" id="bxslider-home4">
            <li>
                <img src="img/OIP.jpg" alt="Slide">
<%--                <div class="caption-group">--%>
<%--                    <h2 class="caption title">--%>
<%--                        <span class="primary"> <strong>Google Drive</strong></span>--%>
<%--                    </h2>--%>
<%--                    <h4 class="caption subtitle">2TB</h4>--%>
<%--                    <a class="caption button-radius" href="single-product.jsp"><span class="icon"></span>Mua ngay</a>--%>
<%--                </div>--%>
            </li>
            <li><img src="img/OIP (1).jpg" alt="Slide">
<%--                <div class="caption-group">--%>
<%--                    <h2 class="caption title">--%>
<%--                        Microsoft <span class="primary">30% <strong>Off</strong></span>--%>
<%--                    </h2>--%>
<%--                    <h4 class="caption subtitle">Microsoft Office 2021 professional</h4>--%>
<%--                    <a class="caption button-radius" href="single-product.jsp"><span class="icon"></span>Mua ngay</a>--%>
<%--                </div>--%>
            </li>
            <li><img src="img/download.jpg" alt="Slide">
<%--                <div class="caption-group">--%>
<%--                    <h2 class="caption title">--%>
<%--                        <span class="primary"><strong>Win 11 </strong></span>--%>
<%--                    </h2>--%>
<%--                    <h4 class="caption subtitle">Home</h4>--%>
<%--                    <a class="caption button-radius" href="single-product.jsp"><span class="icon"></span>Mua ngay</a>--%>
<%--                </div>--%>
            </li>
            <li><img src="img/OIP (1).jpg" alt="Slide">
<%--                <div class="caption-group">--%>
<%--                    <h2 class="caption title">--%>
<%--                        Netflix <span class="primary"> <strong>Movie</strong></span>--%>
<%--                    </h2>--%>
<%--                    <h4 class="caption subtitle"></h4>--%>
<%--                    <a class="caption button-radius" href="single-product.jsp"><span class="icon"></span>Mua ngay</a>--%>
<%--                </div>--%>
            </li>
        </ul>
    </div>
    <!-- ./Slider -->
</div> <!-- End slider area -->


<%
    List<Categories> categories = CategoriesDao.getDirectorysAdmin();
%>

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <%
                for (Categories cate: categories){%>
            <form action="./ShopCategory" method="post">
            <div class="col-md-3 col-sm-6">
                <div class="single-promo promo1">
<%--                    <p><%=cate.getName()%></p>--%>
                    <input name="categoryId" value="<%= cate.getId()%>" style="display: none">
                    <button type="submit"><a style="color: white"><%=cate.getName()%></a></button>
                </div>
            </div>
            </form>
            <%   }%>
        </div>
    </div>
</div> <!-- End promo area -->


<%
    List<Products> newProduct = ProductsDao.getNewProduct();
%>
<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
<%--        <div class="row">--%>
<%--            <div class="col-md-12">--%>
<%--                <div class="latest-product">--%>
<%--                    <h2 class="section-title">Sản phẩm mới nhất</h2>--%>
<%--                    <div class="product-carousel">--%>
<%--                        <%--%>
<%--                            for (Products p: newProduct){%>--%>
<%--                        <div class="single-product">--%>
<%--                            <div class="product-f-image">--%>
<%--                                <img src="<%=p.getImage()%>" alt="">--%>
<%--                                <div class="product-hover">--%>
<%--                                    <a href="#" class="add-to-cart-link" style="font-size: 11px"--%>
<%--                                       style="font-size: 11px"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</a>--%>
<%--                                    <a href="single-product.jsp" class="view-details-link" style="font-size: 11px"--%>
<%--                                       style="font-size: 11px"><i class="fa fa-link"></i> Xem chi tiết</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <h2><a href="single-product.jsp"><%=p.getName()%></a></h2>--%>

<%--                            <div class="product-carousel-price">--%>
<%--                                <ins><%=p.getPrice()%></ins>--%>
<%--                                <del>799.000&#x20AB</del>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <%    }%>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <br>
        <h2 class="section-title">Danh Sách Sản phẩm</h2>
        <%
            List<Products> productsList = ProductsDao.getProductAdmin();
            for (Products p: productsList){%>
        <div class="col-md-3 col-sm-6 " style="margin-bottom: 50px">
            <div class="single-shop-product">
                <div class="product-upper" >
                    <img src="<%=p.getImage()%>" alt="" style="height: 40%; width: 100%">
                </div>
<%--                <input name="maview" value="<%=p.getId()%>" style="display: none">--%>
                <h2><a href="single-product.jsp" style="color: black" ><%=p.getName()%></a></h2>
                <div class="product-carousel-price">
                    <%
                        double price = p.getPrice();
                        request.setAttribute("price", price);
                    %>
                    <ins><fmt:formatNumber value="${price}" type="currency" currencySymbol="₫" groupingUsed="true" /></ins>
                </div>

                <div class="product-option-shop" style="padding-bottom: 0">
                    <form action="./View" method="post">
                        <input name="maview" value="<%=p.getId()%>" style="display: none">
                        <button   type="submit" style="width: 250px; color: white; background: #00acee; ">Xem</button>
                    </form>
                </div>
            </div>
        </div>

        <%    }%>



    </div>
</div> <!-- End main content area -->


<%--<div class="product-widget-area">--%>
<%--    <div class="zigzag-bottom"></div>--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="single-product-widget">--%>
<%--                    <h2 class="product-wid-title">Top bán chạy</h2>--%>
<%--                    <a href="" class="wid-view-more">xem tất cả</a>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Thiết kế_2/figma.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Figma</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Thiết kế_2/canva.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Canva</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Office_3/office-2021-professional-plus-win.jpg"--%>
<%--                                                          alt="" class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Office 2021 professional</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="single-product-widget">--%>
<%--                    <h2 class="product-wid-title">Xem gần &#x20ABây</h2>--%>
<%--                    <a href="#" class="wid-view-more">xem tất cả</a>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Office_3/outlook-2021.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Outlook 2021</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Windows_1/win/windows-11-home.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Win 11 home</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Tiện Ích_2/navicat-premium.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Navicat premium</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="single-product-widget">--%>
<%--                    <h2 class="product-wid-title">Sản phẩm mới</h2>--%>
<%--                    <a href="#" class="wid-view-more">xem tất cả</a>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/VPN_1/Hotspot-VPN-1nam.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Hotspot VPN</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Tiện Ích_2/PDF-Reader-Pro-for-Mac.png" alt=""--%>
<%--                                                          class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">PDF Reader Pro for Mac</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="single-wid-product">--%>
<%--                        <a href="single-product.jsp"><img src="img/Tiện Ích_2/linkedin-Careers-premium-6 thang.png"--%>
<%--                                                          alt="" class="product-thumb"></a>--%>
<%--                        <h2><a href="single-product.jsp">Linkedin Careers Premium</a></h2>--%>
<%--                        <div class="product-wid-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-wid-price">--%>
<%--                            <ins>400.000&#x20AB</ins>--%>
<%--                            <del>425.000&#x20AB</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div> <!-- End product widget area -->--%>

<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2><span>TBT</span></h2>
                    <p>Cảm ơn đã tin tưởng và sử dụng sản phẩm của chúng tôi.</p>
                    <div class="footer-social">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Thông tin</h2>
                    <ul>
                        <li><a href="#">Chính sách giao hàng </a></li>
                        <li><a href="#">Điều khoản và điêù kiện</a></li>
                        <li><a href="#">Chính sách bảo hành</a></li>
                        <li><a href="#">Liên hệ với chúng tôi</a></li>
                        <li><a href="#">Mua hàng và thanh toán online</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Danh mục sản phẩm</h2>
                    <ul>
                        <li><a href="#">Window</a></li>
                        <li><a href="#">Office</a></li>
                        <li><a href="#">Máy ảo</a></li>
                        <li><a href="#">Thiết kế</a></li>
                        <li><a href="#">Giải trí</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-newsletter">
                    <h2 class="footer-wid-title">Tin tức</h2>
                    <p>Đăng ký nhận bản tin của chúng tôi và nhận các ưu đãi độc quyền mà bạn sẽ không tìm thấy ở bất kỳ
                        nơi nào khác trực tiếp vào hộp thư đến của mình!</p>
                    <div class="newsletter-form">
                        <form action="#">
                            <input type="email" placeholder="Nhập email của bạn">
                            <input type="submit" value="Đăng ký">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer top area -->

<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p> © Thương mại Điện tử 2023. Đã đăng ký Bản quyền. </p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-card-icon">
                    <i class="fa fa-cc-discover"></i>
                    <i class="fa fa-cc-mastercard"></i>
                    <i class="fa fa-cc-paypal"></i>
                    <i class="fa fa-cc-visa"></i>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer bottom area -->

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
