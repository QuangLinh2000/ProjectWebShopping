<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thời trang sevenam</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
    <!-- ====================FONT AWESOME ============================= -->
    <script src="https://kit.fontawesome.com/936c874066.js" crossorigin="anonymous"></script>

</head>
<body>
 <%@ include file="../views/Header.jsp" %>
<section id="banner">
    <div id="main-slideshow">
        <div class="slideshow-content" id="ml-slide">
            <!-- slide1 -->
            <div class="mySlides">
                <img src="<%=request.getContextPath()%>/img/slider1.jpg" alt="">
            </div>
            <!-- slide2 -->
            <div class="mySlides">
                <img src="<%=request.getContextPath()%>/img/slider2.jpg" alt="">

            </div>
            <!-- slide 3 -->
            <div class="mySlides">
                <img src="<%=request.getContextPath()%>/img/slider3.jpg" alt="">
            </div>
            <!-- slide 4 -->
            <div class="mySlides">
                <img src="<%=request.getContextPath()%>/img/slider4.jpg" alt="">
            </div>
            <!-- slide 5 -->
            <div class="mySlides">
                <img src="<%=request.getContextPath()%>/img/slider5.jpg" alt="">
            </div>
        </div>
        <div class="slick">
            <div onclick="plusDivs(-1)">
                <i class="fa-solid fa-chevron-left" ></i>
            </div>
            <div onclick="plusDivs(1)">
                <i class="fa-solid fa-chevron-right" ></i>
            </div>
        </div>
        <div class="dots">
            <span class="dot demo" onclick="currentDiv(1)"></span>
            <span class="dot demo" onclick="currentDiv(2)"></span>
            <span class="dot demo" onclick="currentDiv(3)"></span>
            <span class="dot demo" onclick="currentDiv(4)"></span>
            <span class="dot demo" onclick="currentDiv(5)"></span>
        </div>
    </div>
</section>
<section id="home-collection">
    <div class="container">
        <div class="collection-item" id="collection-first">
            <div class="collection-banner">
                <a href="#"></a>
            </div>
            <div class="collection-main">
                <h2 class="section-title margin-right-5">
                    SEVEN.AM - SHALL WE DANCE
                </h2>
                <p class="subtile-section">
                    Shall We DanceVũ khúc của mùa thu như đang nhảy múa trên những thiết kế
                    đầy cuốn hút của Shall We Dance với gam màu nâu vàng chủ đạo cùng họa
                    tiết cách điệu trang nhã.                            </p>

                <div class="collection-slide">
                    <div class="collection-content">

                        <div class="slideshow-collection">

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>


                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="slick-collection">
                        <div class="prev-btn slick-style-prev">
                            <i class="fa-solid fa-chevron-left"></i>
                        </div>
                        <div class="next-btn slick-style-next">
                            <i class="fa-solid fa-chevron-right" ></i>
                        </div>
                    </div>
                </div>

                <!-- btn -->
                <div>
                    <a href="#" class="btn">
                        xem thêm
                    </a>
                </div>
            </div>


        </div>

        <div class="collection-item" id="collection-second">

            <div class="collection-main">
                <h2 class="section-title margin-right-5">
                    SEVEN.AM - SHALL WE DANCE
                </h2>
                <p class="subtile-section">
                    Shall We DanceVũ khúc của mùa thu như đang nhảy múa trên những thiết kế
                    đầy cuốn hút của Shall We Dance với gam màu nâu vàng chủ đạo cùng họa
                    tiết cách điệu trang nhã.                            </p>

                <div class="collection-slide">
                    <div class="collection-content">

                        <div class="slideshow-collection">

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>


                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>

                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="#">
                                        <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <span>mua ngay</span>
                                        </div>
                                        <div class="btn-img-cart">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-image-hover">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                                    <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                                </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                                    </h3>
                                    <span class="slide-collection-price">
                                            847,000đ
                                        </span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="slick-collection">
                        <div class="prev-btn slick-style-prev">
                            <i class="fa-solid fa-chevron-left"></i>
                        </div>
                        <div class="next-btn slick-style-next">
                            <i class="fa-solid fa-chevron-right" ></i>
                        </div>
                    </div>
                </div>

                <!-- btn -->
                <div>
                    <a href="#" class="btn">
                        xem thêm
                    </a>
                </div>
            </div>
            <div class="collection-banner">
                <a href="#"></a>
            </div>

        </div>
    </div>
</section>


<section id="section-slider">
    <div class="container">
        <h2 class="section-title section-title-big">
            SẢN PHẨM NỔI BẬT
        </h2>
        <div class="section-content">
            <div class="section-slideshow" id="section-slideshow">
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <span class="slide-collection-price">
                                    847,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <!-- have sale tag -->
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span>-10%</span>
                                </div>
                                <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <div>
                                    <span class="slide-collection-price">
                                        847,000đ
                                    </span>
                                <span class="current-price">
                                        941,000đ
                                    </span>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <span class="slide-collection-price">
                                    847,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <!-- have sale tag -->
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span>-10%</span>
                                </div>
                                <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <div>
                                    <span class="slide-collection-price">
                                        847,000đ
                                    </span>
                                <span class="current-price">
                                        941,000đ
                                    </span>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <span class="slide-collection-price">
                                    847,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <span class="slide-collection-price">
                                    847,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="#">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <span>mua ngay</span>
                                </div>
                                <div class="btn-img-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay & Vải Thun Kiểu Dáng Thêu Viền Tay
                            </h3>
                            <span class="slide-collection-price">
                                    847,000đ
                                </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slick-section">
                <div class="slick-style-prev" id="slick-prev">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="slick-style-next" id="slick-next">
                    <i class="fa-solid fa-chevron-right" ></i>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="home-shop-map">
    <class class="fixed-bg">
        <a href="#" class="btn-more-white1">Xem địa chỉ hệ thống cửa hàng</a>
    </class>
</section>

<section id="tab-home">
    <div class="container">
        <div class="tab">
            <h2 class="tablinks active">Sản phẩm mới</h2>
            <h2 class="tablinks">BEST SELLER</h2>
            <h2 class="tablinks">BEST SELLER</h2>
        </div>
        <div id="list-tab1">
            <div class="list-tab-content">
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="div-btn-tab">
                <a href="#" class="btn btn-tab">xem thêm</a>
            </div>

        </div>

        <div id="list-tab2">
            <div class="list-tab-content">
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>


            </div>
            <div class="div-btn-tab">
                <a href="#" class="btn btn-tab">xem thêm</a>
            </div>

        </div>

        <div id="list-tab3">
            <div class="list-tab-content">
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>
                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="#">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <span>mua ngay</span>
                            </div>
                            <div class="btn-img-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                                <span>-10%</span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                    </div>
                    <div class="list-image-hover">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_2.jpg" alt="">
                        <img class="img-item-hov" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng Thêu Viền Tay
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    847,000đ
                                </span>
                            <span class="current-price">
                                    941,000đ
                                </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="div-btn-tab">
                <a href="#" class="btn btn-tab">xem thêm</a>
            </div>

        </div>
    </div>
</section>

<section id="home-customer">
    <div class="container">
        <h2 class="section-title">
            SEVEN.AM - SHALL WE DANCE
        </h2>
        <div class="customer-grid">
            <div class="customer-item">
                <div class="customer-img shine-hover">
                    <img src="<%=request.getContextPath()%>/img/home_customer_img1.jpg" alt="">
                </div>
                <div class="bg-color">
                </div>
                <div class="customer-des">
                    <h3>
                        Nguyễn Trần Mỹ Nga
                    </h3>
                    <span>Công chức</span>
                    <p>
                        Cảm ơn Seven.AM vì đã mang đến những sản phẩm rất vừa với vóc dáng của người phụ nữ Việt. Khi khoác lên mình các trang phục ở đây, tôi cảm thấy vô cùng thoải mái và tự tin.
                    </p>
                </div>
            </div>
            <div class="customer-item">
                <div class="customer-img shine-hover">
                    <img src="<%=request.getContextPath()%>/img/home_customer_img1.jpg" alt="">
                </div>
                <div class="bg-color">
                </div>
                <div class="customer-des">
                    <h3>
                        Nguyễn Trần Mỹ Nga
                    </h3>
                    <span>Công chức</span>
                    <p>
                        Cảm ơn Seven.AM vì đã mang đến những sản phẩm rất vừa với vóc dáng của người phụ nữ Việt. Khi khoác lên mình các trang phục ở đây, tôi cảm thấy vô cùng thoải mái và tự tin.
                    </p>
                </div>
            </div>
            <div class="customer-item">
                <div class="customer-img shine-hover">
                    <img src="<%=request.getContextPath()%>/img/home_customer_img1.jpg" alt="">
                </div>
                <div class="bg-color">
                </div>
                <div class="customer-des">
                    <h3>
                        Nguyễn Trần Mỹ Nga
                    </h3>
                    <span>Công chức</span>
                    <p>
                        Cảm ơn Seven.AM vì đã mang đến những sản phẩm rất vừa với vóc dáng của người phụ nữ Việt. Khi khoác lên mình các trang phục ở đây, tôi cảm thấy vô cùng thoải mái và tự tin.
                    </p>
                </div>
            </div>
            <div class="customer-item">
                <div class="customer-img shine-hover">
                    <img src="<%=request.getContextPath()%>/img/home_customer_img1.jpg" alt="">
                </div>
                <div class="bg-color">
                </div>
                <div class="customer-des">
                    <h3>
                        Nguyễn Trần Mỹ Nga
                    </h3>
                    <span>Công chức</span>
                    <p>
                        Cảm ơn Seven.AM vì đã mang đến những sản phẩm rất vừa với vóc dáng của người phụ nữ Việt. Khi khoác lên mình các trang phục ở đây, tôi cảm thấy vô cùng thoải mái và tự tin.
                    </p>
                </div>
            </div>
            <div class="customer-item">
                <div class="customer-img shine-hover">
                    <img src="<%=request.getContextPath()%>/img/home_customer_img1.jpg" alt="">
                </div>
                <div class="bg-color">
                </div>
                <div class="customer-des">
                    <h3>
                        Nguyễn Trần Mỹ Nga
                    </h3>
                    <span>Công chức</span>
                    <p>
                        Cảm ơn Seven.AM vì đã mang đến những sản phẩm rất vừa với vóc dáng của người phụ nữ Việt. Khi khoác lên mình các trang phục ở đây, tôi cảm thấy vô cùng thoải mái và tự tin.
                    </p>
                </div>
            </div>

        </div>
    </div>
</section>

<section id="home-blog">
    <div class="container">
        <div class="section-title">
            Tin tức mới nhất
        </div>
        <div class="grid-article">
            <div class="article-item article-item-left">
                <div>
                    <div class="article-img shine-hover">
                        <img src="<%=request.getContextPath()%>/img/home_blog_main.jpg" alt="">
                    </div>
                    <div class="article-info">
                        <a href="#" class="article-title">
                            Ưu đãi lên đến 30% mừng ngày phụ nữ Việt Nam 20/10
                        </a>
                        <div class="article-date">
                            12 Tháng 10 2021
                        </div>
                        <div class="article-comment">
                            <i class="fas fa-comment-dots"></i>
                            <span class="fb_comments_count">0</span>
                        </div>
                        <div class="article-desc ">
                            Tháng 10 là tháng có ý nghĩa đặc biệt với chị em phụ nữ. Chào mừng ngày phụ nữ Việt Nam 20/10, Seven.AM ƯU ĐÃI LÊN ĐẾ...
                        </div>
                    </div>
                </div>
            </div>
            <div class="article-item article-item-right">
                <div class="article-img1 shine-hover zoom-hover">
                    <img src="<%=request.getContextPath()%>/img/home_blog.jpg" alt="Shall We Dance - Vũ khúc mùa thu trong BST mới nhất của Seven.AM">
                </div>

                <div class="article-info1">
                    <a href="#" class="article-title">
                        Shall We Dance - Vũ khúc mùa thu trong BST mới ...
                    </a>
                    <div class="article-date1">
                        05 Tháng 10 2021
                    </div>
                    <div class="article-comment1">
                        <i class="fas fa-comment-dots"></i>
                        <span class="fb_comments_count">0</span>

                    </div>
                    <div class="article-desc1">
                        Mùa thu lãng đãng, mơ mộng và đầy chất thơ đã mang đến cảm hứng để Seven.AM trình làng
                    </div>
                    <a href="#" class="btn-blog"><i class="fas fa-arrow-right"></i> Xem thêm</a>
                </div>
            </div>
            <div class="article-item article-item-right">
                <div class="article-img1 shine-hover zoom-hover">
                    <img src="<%=request.getContextPath()%>/img/home_blog.jpg" alt="Shall We Dance - Vũ khúc mùa thu trong BST mới nhất của Seven.AM">

                </div>

                <div class="article-info1">
                    <a href="#" class="article-title">
                        Shall We Dance - Vũ khúc mùa thu trong BST mới ...
                    </a>
                    <div class="article-date1">
                        05 Tháng 10 2021
                    </div>
                    <div class="article-comment1">
                        <i class="fas fa-comment-dots"></i>
                        <span class="fb_comments_count">0</span>

                    </div>
                    <div class="article-desc1">
                        Mùa thu lãng đãng, mơ mộng và đầy chất thơ đã mang đến cảm hứng để Seven.AM trình làng ...
                    </div>
                    <a href="#" class="btn-blog"><i class="fas fa-arrow-right"></i> Xem thêm</a>
                </div>
            </div>
        </div>
        <div class="collections-more flex-center">
            <a class="btn" href="#">Xem thêm</a>
        </div>
    </div>
</section>
<%@include file="../views/footer.jsp"%>
<script src="<%=request.getContextPath()%>/script/home.js"></script>
<script src="<%=request.getContextPath()%>/script/header.js"></script>

</body>
</html>
