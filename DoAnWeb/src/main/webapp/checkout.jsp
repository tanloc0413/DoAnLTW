<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Set" %>
<%@ page import="vn.edu.hcmuaf.dao.ProductsDao" %>
<%@ page import="vn.edu.hcmuaf.model.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
	ustora by freshdesignweb.com
	Twitter: https://twitter.com/freshdesignweb
	URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thanh Toán</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
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
<form action="./Oder" method="post">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Thanh Toán</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">


                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Sản phẩm</h2>
                        <div class="thubmnail-recent">
                            <img src="img/VPN_1/nordvpn.png" class="recent-thumb" alt="">
                            <h2><a href="single-product.jsp">NordVPN</a></h2>
                            <div class="product-sidebar-price">
                                <ins>390.000đ</ins> <del>490.000đ</del>
                            </div>
                        </div>
                        <div class="thubmnail-recent">
                            <img src="img/VPN_1/Hotspot-VPN-1nam.png" class="recent-thumb" alt="">
                            <h2><a href="single-product.jsp">Hotspot Shield VPN</a></h2>
                            <div class="product-sidebar-price">
                                <ins>349.000đ</ins> <del>2.240.000đ</del>
                            </div>
                        </div>
                        <div class="thubmnail-recent">
                            <img src="img/VPN_1/expressvpn.png" class="recent-thumb" alt="">
                            <h2><a href="single-product.jsp">ExpressVPN</a></h2>
                            <div class="product-sidebar-price">
                                <ins>149.000đ</ins> <del>307.000đ</del>
                            </div>
                        </div>
                        <div class="thubmnail-recent">
                            <img src="img/VPN_1/avira-vpn-3-thang.png" class="recent-thumb" alt="">
                            <h2><a href="single-product.jsp">Avira Phantom VPN Pro</a></h2>
                            <div class="product-sidebar-price">
                                <ins>249.000đ</ins> <del>357.000đ</del>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">

                            <div class="clear"></div>


                            <form enctype="multipart/form-data" action="./Oder" class="checkout" method="post" name="checkout">

                                <div id="customer_details" class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">
                                            <h3>Phần thanh toán</h3>


                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">Họ và Tên <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${sessionScope.currentUser.name}" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
                                            </p>
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">Địa chỉ <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${sessionScope.currentUser.address}" placeholder="Địa chỉ" id="billing_address_1" name="billing_address" class="input-text ">
                                            </p>
                                            <div class="clear"></div>

                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">Số điện thoại <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${sessionScope.currentUser.phone}" placeholder="" id="billing_phone" name="billing_phone" class="input-text ">
                                            </p>
                                            <div class="clear"></div>


                                        </div>
                                    </div>



                                </div>

                                <h3 id="order_review_heading">Đơn hàng của bạn</h3>

                                <div id="order_review" style="position: relative;">
                                    <table class="shop_table">
                                        <thead>
                                        <tr>
                                            <th class="product-name">Sản phẩm</th>
                                            <th class="product-total">Tổng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="p" items="${sessionScope.cart}">
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                <strong class="product-quantity">${p.productName}</strong> </td>
                                            <td class="product-total">
                                                <span class="amount">${p.price * p.quantity}</span> </td>
                                        </tr>
                                        </c:forEach>

                                        </tbody>
                                        <tfoot>


                                        <tr class="shipping">
                                            <th>Phí ship và xử lí</th>
                                            <td>

                                                Miễn phí ship
                                                <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                            </td>
                                        </tr>


                                        <tr class="order-total">
                                            <th>Tổng cộng</th>

                                            <td><strong><span class="amount"><c:out value="${sessionScope.totalAmount}"/></span></strong> </td>
                                        </tr>

                                        </tfoot>
                                    </table>


                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_bacs">
                                                <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs">
                                                <label for="payment_method_bacs">Chuyển khoản </label>
                                                <div class="payment_box payment_method_bacs">
                                                    <p>Thực hiện thanh toán trực tiếp vào tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng ID đơn hàng của bạn làm tài liệu tham khảo thanh toán. Đơn đặt hàng của bạn sẽ không được giao cho đến khi tiền đã được xóa trong tài khoản của chúng tôi.</p>
                                                </div>
                                            </li>
                                            <li class="payment_method_cheque">
                                                <input type="radio" data-order_button_text="" value="cheque" name="payment_method" class="input-radio" id="payment_method_cheque">
                                                <label for="payment_method_cheque">Thanh toán khi nhận hàng </label>
                                                <div style="display:none;" class="payment_box payment_method_cheque">
                                                    <p>Vui lòng gửi cheque của bạn tới tên cửa hàng, tên đường, tên xã, tên huyện / thành phố, mã bưu điện cửa hàng.</p>
                                                </div>
                                        </ul>

                                        <div class="form-row place-order">

                                            <input type="submit" data-value="Place order" value="đặt hàng" id="place_order" name="woocommerce_checkout_place_order" class="button alt">


                                        </div>

                                        <div class="clear"></div>

                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>



<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2><span>TPT</span></h2>
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
                        <li><a href="#">Chính sách giao hàng  </a></li>
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
                    <p>Đăng ký nhận bản tin của chúng tôi và nhận các ưu đãi độc quyền mà bạn sẽ không tìm thấy ở bất kỳ nơi nào khác trực tiếp vào hộp thư đến của mình!</p>
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
                    <p> © Thương mại điện tử 2023. Đã đăng ký Bản quyền. <a href="http://www.freshdesignweb.com" target="_blank"></a></p>
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
</div>

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
</body>
</html>