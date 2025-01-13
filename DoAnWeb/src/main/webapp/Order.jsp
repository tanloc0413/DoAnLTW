<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.model.Cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Giỏ hàng</title>

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


<%
    List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
    if (cartList == null) {
        cartList = new java.util.ArrayList<>();
        session.setAttribute("cart", cartList);
    }
%>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>


<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Giỏ Hàng</h2>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End Page title area -->


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">


<%--                <div class="single-sidebar">--%>
<%--                    <h2 class="sidebar-title">Sản phẩm</h2>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/Tiện Ích_2/navicat-premium.png" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="single-product.jsp">Navicat Premium</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins>790.000đ</ins>--%>
<%--                            <del>820.000đ</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/Windows_1/win_server/windows-server-2022-datacenter.png" class="recent-thumb"--%>
<%--                             alt="">--%>
<%--                        <h2><a href="single-product.jsp">Windows Server 2022 Datacenter</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins>549.000đ</ins>--%>
<%--                            <del>4.490.000đ</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/Giải trí_3/discord-nitro-basic.png" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="single-product.jsp">Discord Nitro</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins>949.000đ</ins>--%>
<%--                            <del>1.130.000đ</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="thubmnail-recent">--%>
<%--                        <img src="img/Tiện Ích_2/PDF-Reader-Pro-for-Mac.png" class="recent-thumb" alt="">--%>
<%--                        <h2><a href="single-product.jsp">PDF Reader Pro for MAC</a></h2>--%>
<%--                        <div class="product-sidebar-price">--%>
<%--                            <ins>1.490.000đ</ins>--%>
<%--                            <del>1.999.000đ</del>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <form action="./CartServlet" method="post">
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <table cellspacing="0" id="table" class="shop_table cart">
                                <thead>
                                <tr>
                                    <th class="product-remove">&nbsp;</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name">Sản phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số lượng</th>
                                    <th class="product-subtotal">Tổng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="p" items="${sessionScope.cart}">
                                    <form action="./CartRemove" method="post">
                                        <tr class="cart_item">
                                            <td class="product-remove">

                                                <input name="Id" value="${p.productId}" style="display: none">
                                                    <%--                                                    <input type="submit" value="X" name="com" class="button">--%>
                                                <button type="submit">X</button>


                                            </td>

                                            <td class="product-thumbnail">
                                                <input name="url[]" value="${p.imageUrl}" style="display: none">
                                                <a href=""><img width="145" height="145" alt="poster_1_up"
                                                                class="shop_thumbnail" src="${p.imageUrl}"></a>
                                            </td>

                                            <td class="product-name">
                                                <input name="productId" value="${p.productId}" style="display: none">
                                                <a href="">${p.productName}</a>
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">
                                                <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" groupingUsed="true" /></span>
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="button" class="minus" value="-" style="display: none">
                                                    <input name="quantity" type="number" size="4"
                                                           class="input-text qty text" title="Qty" value="${p.quantity}"
                                                           min="0" step="1">
                                                    <input type="button" class="plus" value="+" style="display: none">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">
                                                <fmt:formatNumber value="${p.price * p.quantity}" type="currency" currencySymbol="₫" groupingUsed="true" /></span>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>

                                <tr>
                                    <td class="actions" colspan="6">
                                        <input type="submit" value="Cập nhật" name="com" class="button">


                                        <input type="submit" value="Thanh toán" name="proceed"
                                               onclick="window.location.href='checkout.jsp'; return false;"
                                               class="checkout-button button alt wc-forward">

                                    </td>
                                </tr>

                                </tbody>
                            </table>

                            <div class="cart-collaterals">




                                <div class="cart_totals ">
                                    <h2>Tổng giỏ hàng</h2>

                                    <table cellspacing="0">
                                        <tbody>

                                        <tr class="shipping">
                                            <th>Vận chuyển và xử lí</th>
                                            <td>Miễn phí ship</td>
                                        </tr>

                                        <tr class="order-total">
                                            <th>Tổng tiền</th>
                                            <td><strong><span class="amount"><fmt:formatNumber value="${sessionScope.totalAmount}" type="currency" currencySymbol="₫" groupingUsed="true" /></span></strong></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>


                                <form method="post" action="#" class="shipping_calculator">
                                    <!--                                <h2><a class="shipping-calculator-button" data-toggle="collapse" href="#calcalute-shipping-wrap" aria-expanded="false" aria-controls="calcalute-shipping-wrap">Tính phí Ship</a></h2>-->

                                    <section id="calcalute-shipping-wrap" class="shipping-calculator-form collapse">

                                        <p class="form-row form-row-wide">
                                            <select rel="calc_shipping_state" class="country_to_state"
                                                    id="calc_shipping_country" name="calc_shipping_country">
                                                <option value="">Select a country…</option>
                                                <option value="AX">Åland Islands</option>
                                                <option value="AF">Afghanistan</option>
                                                <option value="AL">Albania</option>
                                                <option value="DZ">Algeria</option>
                                                <option value="AD">Andorra</option>
                                                <option value="AO">Angola</option>
                                                <option value="AI">Anguilla</option>
                                                <option value="AQ">Antarctica</option>
                                                <option value="AG">Antigua and Barbuda</option>
                                                <option value="AR">Argentina</option>
                                                <option value="AM">Armenia</option>
                                                <option value="AW">Aruba</option>
                                                <option value="AU">Australia</option>
                                                <option value="AT">Austria</option>
                                                <option value="AZ">Azerbaijan</option>
                                                <option value="BS">Bahamas</option>
                                                <option value="BH">Bahrain</option>
                                                <option value="BD">Bangladesh</option>
                                                <option value="BB">Barbados</option>
                                                <option value="BY">Belarus</option>
                                                <option value="PW">Belau</option>
                                                <option value="BE">Belgium</option>
                                                <option value="BZ">Belize</option>
                                                <option value="BJ">Benin</option>
                                                <option value="BM">Bermuda</option>
                                                <option value="BT">Bhutan</option>
                                                <option value="BO">Bolivia</option>
                                                <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                                                <option value="BA">Bosnia and Herzegovina</option>
                                                <option value="BW">Botswana</option>
                                                <option value="BV">Bouvet Island</option>
                                                <option value="BR">Brazil</option>
                                                <option value="IO">British Indian Ocean Territory</option>
                                                <option value="VG">British Virgin Islands</option>
                                                <option value="BN">Brunei</option>
                                                <option value="BG">Bulgaria</option>
                                                <option value="BF">Burkina Faso</option>
                                                <option value="BI">Burundi</option>
                                                <option value="KH">Cambodia</option>
                                                <option value="CM">Cameroon</option>
                                                <option value="CA">Canada</option>
                                                <option value="CV">Cape Verde</option>
                                                <option value="KY">Cayman Islands</option>
                                                <option value="CF">Central African Republic</option>
                                                <option value="TD">Chad</option>
                                                <option value="CL">Chile</option>
                                                <option value="CN">China</option>
                                                <option value="CX">Christmas Island</option>
                                                <option value="CC">Cocos (Keeling) Islands</option>
                                                <option value="CO">Colombia</option>
                                                <option value="KM">Comoros</option>
                                                <option value="CG">Congo (Brazzaville)</option>
                                                <option value="CD">Congo (Kinshasa)</option>
                                                <option value="CK">Cook Islands</option>
                                                <option value="CR">Costa Rica</option>
                                                <option value="HR">Croatia</option>
                                                <option value="CU">Cuba</option>
                                                <option value="CW">CuraÇao</option>
                                                <option value="CY">Cyprus</option>
                                                <option value="CZ">Czech Republic</option>
                                                <option value="DK">Denmark</option>
                                                <option value="DJ">Djibouti</option>
                                                <option value="DM">Dominica</option>
                                                <option value="DO">Dominican Republic</option>
                                                <option value="EC">Ecuador</option>
                                                <option value="EG">Egypt</option>
                                                <option value="SV">El Salvador</option>
                                                <option value="GQ">Equatorial Guinea</option>
                                                <option value="ER">Eritrea</option>
                                                <option value="EE">Estonia</option>
                                                <option value="ET">Ethiopia</option>
                                                <option value="FK">Falkland Islands</option>
                                                <option value="FO">Faroe Islands</option>
                                                <option value="FJ">Fiji</option>
                                                <option value="FI">Finland</option>
                                                <option value="FR">France</option>
                                                <option value="GF">French Guiana</option>
                                                <option value="PF">French Polynesia</option>
                                                <option value="TF">French Southern Territories</option>
                                                <option value="GA">Gabon</option>
                                                <option value="GM">Gambia</option>
                                                <option value="GE">Georgia</option>
                                                <option value="DE">Germany</option>
                                                <option value="GH">Ghana</option>
                                                <option value="GI">Gibraltar</option>
                                                <option value="GR">Greece</option>
                                                <option value="GL">Greenland</option>
                                                <option value="GD">Grenada</option>
                                                <option value="GP">Guadeloupe</option>
                                                <option value="GT">Guatemala</option>
                                                <option value="GG">Guernsey</option>
                                                <option value="GN">Guinea</option>
                                                <option value="GW">Guinea-Bissau</option>
                                                <option value="GY">Guyana</option>
                                                <option value="HT">Haiti</option>
                                                <option value="HM">Heard Island and McDonald Islands</option>
                                                <option value="HN">Honduras</option>
                                                <option value="HK">Hong Kong</option>
                                                <option value="HU">Hungary</option>
                                                <option value="IS">Iceland</option>
                                                <option value="IN">India</option>
                                                <option value="ID">Indonesia</option>
                                                <option value="IR">Iran</option>
                                                <option value="IQ">Iraq</option>
                                                <option value="IM">Isle of Man</option>
                                                <option value="IL">Israel</option>
                                                <option value="IT">Italy</option>
                                                <option value="CI">Ivory Coast</option>
                                                <option value="JM">Jamaica</option>
                                                <option value="JP">Japan</option>
                                                <option value="JE">Jersey</option>
                                                <option value="JO">Jordan</option>
                                                <option value="KZ">Kazakhstan</option>
                                                <option value="KE">Kenya</option>
                                                <option value="KI">Kiribati</option>
                                                <option value="KW">Kuwait</option>
                                                <option value="KG">Kyrgyzstan</option>
                                                <option value="LA">Laos</option>
                                                <option value="LV">Latvia</option>
                                                <option value="LB">Lebanon</option>
                                                <option value="LS">Lesotho</option>
                                                <option value="LR">Liberia</option>
                                                <option value="LY">Libya</option>
                                                <option value="LI">Liechtenstein</option>
                                                <option value="LT">Lithuania</option>
                                                <option value="LU">Luxembourg</option>
                                                <option value="MO">Macao S.A.R., China</option>
                                                <option value="MK">Macedonia</option>
                                                <option value="MG">Madagascar</option>
                                                <option value="MW">Malawi</option>
                                                <option value="MY">Malaysia</option>
                                                <option value="MV">Maldives</option>
                                                <option value="ML">Mali</option>
                                                <option value="MT">Malta</option>
                                                <option value="MH">Marshall Islands</option>
                                                <option value="MQ">Martinique</option>
                                                <option value="MR">Mauritania</option>
                                                <option value="MU">Mauritius</option>
                                                <option value="YT">Mayotte</option>
                                                <option value="MX">Mexico</option>
                                                <option value="FM">Micronesia</option>
                                                <option value="MD">Moldova</option>
                                                <option value="MC">Monaco</option>
                                                <option value="MN">Mongolia</option>
                                                <option value="ME">Montenegro</option>
                                                <option value="MS">Montserrat</option>
                                                <option value="MA">Morocco</option>
                                                <option value="MZ">Mozambique</option>
                                                <option value="MM">Myanmar</option>
                                                <option value="NA">Namibia</option>
                                                <option value="NR">Nauru</option>
                                                <option value="NP">Nepal</option>
                                                <option value="NL">Netherlands</option>
                                                <option value="AN">Netherlands Antilles</option>
                                                <option value="NC">New Caledonia</option>
                                                <option value="NZ">New Zealand</option>
                                                <option value="NI">Nicaragua</option>
                                                <option value="NE">Niger</option>
                                                <option value="NG">Nigeria</option>
                                                <option value="NU">Niue</option>
                                                <option value="NF">Norfolk Island</option>
                                                <option value="KP">North Korea</option>
                                                <option value="NO">Norway</option>
                                                <option value="OM">Oman</option>
                                                <option value="PK">Pakistan</option>
                                                <option value="PS">Palestinian Territory</option>
                                                <option value="PA">Panama</option>
                                                <option value="PG">Papua New Guinea</option>
                                                <option value="PY">Paraguay</option>
                                                <option value="PE">Peru</option>
                                                <option value="PH">Philippines</option>
                                                <option value="PN">Pitcairn</option>
                                                <option value="PL">Poland</option>
                                                <option value="PT">Portugal</option>
                                                <option value="QA">Qatar</option>
                                                <option value="IE">Republic of Ireland</option>
                                                <option value="RE">Reunion</option>
                                                <option value="RO">Romania</option>
                                                <option value="RU">Russia</option>
                                                <option value="RW">Rwanda</option>
                                                <option value="ST">São Tomé and Príncipe</option>
                                                <option value="BL">Saint Barthélemy</option>
                                                <option value="SH">Saint Helena</option>
                                                <option value="KN">Saint Kitts and Nevis</option>
                                                <option value="LC">Saint Lucia</option>
                                                <option value="SX">Saint Martin (Dutch part)</option>
                                                <option value="MF">Saint Martin (French part)</option>
                                                <option value="PM">Saint Pierre and Miquelon</option>
                                                <option value="VC">Saint Vincent and the Grenadines</option>
                                                <option value="SM">San Marino</option>
                                                <option value="SA">Saudi Arabia</option>
                                                <option value="SN">Senegal</option>
                                                <option value="RS">Serbia</option>
                                                <option value="SC">Seychelles</option>
                                                <option value="SL">Sierra Leone</option>
                                                <option value="SG">Singapore</option>
                                                <option value="SK">Slovakia</option>
                                                <option value="SI">Slovenia</option>
                                                <option value="SB">Solomon Islands</option>
                                                <option value="SO">Somalia</option>
                                                <option value="ZA">South Africa</option>
                                                <option value="GS">South Georgia/Sandwich Islands</option>
                                                <option value="KR">South Korea</option>
                                                <option value="SS">South Sudan</option>
                                                <option value="ES">Spain</option>
                                                <option value="LK">Sri Lanka</option>
                                                <option value="SD">Sudan</option>
                                                <option value="SR">Suriname</option>
                                                <option value="SJ">Svalbard and Jan Mayen</option>
                                                <option value="SZ">Swaziland</option>
                                                <option value="SE">Sweden</option>
                                                <option value="CH">Switzerland</option>
                                                <option value="SY">Syria</option>
                                                <option value="TW">Taiwan</option>
                                                <option value="TJ">Tajikistan</option>
                                                <option value="TZ">Tanzania</option>
                                                <option value="TH">Thailand</option>
                                                <option value="TL">Timor-Leste</option>
                                                <option value="TG">Togo</option>
                                                <option value="TK">Tokelau</option>
                                                <option value="TO">Tonga</option>
                                                <option value="TT">Trinidad and Tobago</option>
                                                <option value="TN">Tunisia</option>
                                                <option value="TR">Turkey</option>
                                                <option value="TM">Turkmenistan</option>
                                                <option value="TC">Turks and Caicos Islands</option>
                                                <option value="TV">Tuvalu</option>
                                                <option value="UG">Uganda</option>
                                                <option value="UA">Ukraine</option>
                                                <option value="AE">United Arab Emirates</option>
                                                <option selected="selected" value="GB">United Kingdom (UK)</option>
                                                <option value="US">United States (US)</option>
                                                <option value="UY">Uruguay</option>
                                                <option value="UZ">Uzbekistan</option>
                                                <option value="VU">Vanuatu</option>
                                                <option value="VA">Vatican</option>
                                                <option value="VE">Venezuela</option>
                                                <option value="VN">Vietnam</option>
                                                <option value="WF">Wallis and Futuna</option>
                                                <option value="EH">Western Sahara</option>
                                                <option value="WS">Western Samoa</option>
                                                <option value="YE">Yemen</option>
                                                <option value="ZM">Zambia</option>
                                                <option value="ZW">Zimbabwe</option>
                                            </select>
                                        </p>

                                        <p class="form-row form-row-wide"><input type="text" id="calc_shipping_state"
                                                                                 name="calc_shipping_state"
                                                                                 placeholder="Tỉnh / Thành phố" value=""
                                                                                 class="input-text"></p>

                                        <p class="form-row form-row-wide"><input type="text" id="calc_shipping_postcode"
                                                                                 name="calc_shipping_postcode"
                                                                                 placeholder="Mã bưu điện / Mã zip"
                                                                                 value="" class="input-text"></p>


                                        <p>
                                            <button class="button" value="1" name="calc_shipping" type="submit">Cập nhật
                                                tổng thể
                                            </button>
                                        </p>

                                    </section>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


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
                    <p> © Thương mại điện tử 2023. Đã đăng ký Bản quyền. <a href="http://www.freshdesignweb.com"
                                                                            target="_blank"></a></p>
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
</body>
</html>