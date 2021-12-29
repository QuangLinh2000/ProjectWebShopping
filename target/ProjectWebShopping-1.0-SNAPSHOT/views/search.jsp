<%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/936c874066.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/search.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
</head>
<body>
<%@include file="../views/Header.jsp"%>


<section id="main-search" class="margin-top-mobile">
    <div class="container">
        <div class="top-search-title">
            <h2 class="text-search">Áo</h2>
            <span class="title-sum-product">415949 sản phẩm</span>
        </div>
        <div class="contain">
            <div class="left-contain">
                <div class="left-contain-price-range">
                    <p class="left-contain-item-title">Khoảng Giá</p>
                    <div class="left-contain-item-box-content">
                        <input type="radio" name="all" value="Tất Cả">
                        <label > Tất Cả</label><br>
                        <input type="radio" name="all" value="Tất Cả">
                        <label > Nhỏ hơn 300,000₫</label><br>
                        <input type="radio" name="all" value="Tất Cả">
                        <label >Từ 300,000₫ - 500,000₫</label><br>
                        <input type="radio" name="all" value="Tất Cả">
                        <label > Từ 500,000₫ - 700,000₫</label><br>
                        <input type="radio" name="all" value="Tất Cả">
                        <label > Từ 700,000₫ - 1,000,000₫</label><br>
                        <input type="radio" name="all" value="Tất Cả">
                        <label > Từ 1,000,000₫ - 1,500,000₫</label><br>
                        <input type="radio" name="all" value="Tất Cả">
                        <label > Lớn hơn 1,500,000₫</label><br>
                    </div>
                </div>
                <div class="left-contain-size">
                    <p class="left-contain-item-title">Kích Thước</p>
                    <div class="left-contain-item-box-content-size">
                        <div class="left-contain-item-box-content-size-item">
                            <input type="checkbox" name="size" value="S">
                            <label >S</label><br>
                        </div>
                        <div class="left-contain-item-box-content-size-item">
                            <input type="checkbox" name="size" value="M">
                            <label >M</label><br>
                        </div>
                        <div class="left-contain-item-box-content-size-item">
                            <input type="checkbox" name="size" value="L">
                            <label >L</label><br>
                        </div>
                        <div class="left-contain-item-box-content-size-item">
                            <input type="checkbox" name="size" value="XL">
                            <label >XL</label><br>
                        </div>
                    </div>
                </div>
                <div class="left-contain-color">
                    <p class="left-contain-item-title">Màu Sắc</p>
                    <div class="left-contain-item-box-content-color">
                        <div class="left-contain-item-box-content-color-item">
                            <input type="checkbox" name="color" value="white">
                            <p style="background-color: red;" ></p><br>
                        </div>
                        <div class="left-contain-item-box-content-color-item">
                            <input type="checkbox" name="color" value="white">
                            <p style="background-color: yellow;" ></p><br>
                        </div>
                        <div class="left-contain-item-box-content-color-item">
                            <input type="checkbox" name="color" value="white">
                            <p style="background-color: black;" ></p><br>
                        </div>
                        <div class="left-contain-item-box-content-color-item">
                            <input type="checkbox" name="color" value="white">
                            <p style="background-color: greenyellow;" ></p><br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-contain">
                <div class="list-tab-content">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="./checkouts.html">mua ngay</a>
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
                                Áo Ngắn Tay Seven.AM Chất Liệu Vải Thun Kiểu Dáng Thêu Viền Tay &amp; Vải Thun Kiểu Dáng
                                Thêu Viền Tay
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
    </div>

</section>

<%@include file="../views/footer.jsp"%>
<script src="<%=request.getContextPath()%>/script/header.js"></script>
<script src="<%=request.getContextPath()%>/script/search.js"></script>

</body>

</html>