<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%List<BoSuaTap> listBST = (List<BoSuaTap>) request.getAttribute("listBST");
    BoSuaTap boSuaTap1 = listBST.get(0);
    BoSuaTap boSuaTap2 = listBST.get(1);%>
<%--limit imgae small gioi han anh hover--%>
<%int limitImageSmall =5;%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">
<%--modal css--%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/modal/modal.css">
<section id="banner">
    <div id="main-slideshow">
        <div class="slideshow-content" id="ml-slide">
            <!-- slide1 -->


            <c:forEach var="p" items="${listQC}">
                <div class="mySlides">
                    <a href="<%=request.getContextPath()%>/${p.url}"><img src="${p.hinhAnh}" alt=""></a>
                </div>

            </c:forEach>
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
            <div class="collection-banner" style="background-image: url(<%=boSuaTap1.getHinhAnh()%>)">
                <a href=""></a>
            </div>
            <div class="collection-main">
                <h2 class="section-title margin-right-5">
                   <%=boSuaTap1.getName()%>
                </h2>
                <p class="subtile-section">
                    <%=boSuaTap1.getTieuDe()%>
                </p>

                <div class="collection-slide">
                    <div class="collection-content">


                        <div class="slideshow-collection">

                            <%List<Product> productList2 = (List<Product>) request.getAttribute("listBoSTLeft");
                                for ( Product p : productList2) {%>
                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="/Shopping/detail?id=<%=p.getMaSP()%>">

                                        <img class="collection-slide-image" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(0)%>" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <a href="/Shopping/detail?id=<%=p.getMaSP()%>">mua ngay</a>
                                        </div>

                                        <div class="btn-img-cart" idSP =<%=p.getMaSP()%>  onclick="openModal(this)"
                                             data-product-id="<%=p.getMaSP()%>"
                                             data-product-name="<%=p.getTenSP()%>"
                                             data-product-price="<%=p.getGia()%>"
                                             data-product-img="<%=p.getListUrlImg().get(0)%>"
                                             data-product-sell="<%=p.getSell()%>"
                                             data-product-size-s="<%=p.getS()%>"
                                             data-product-size-l="<%=p.getL()%>"
                                             data-product-size-m="<%=p.getM()%>"
                                             data-product-size-xl="<%=p.getXL()%>"
                                             data-product-color="<%=p.getMau()%>">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                    <%if(p.getSell() > 0){%>
                                    <div class="colection-tag">
                                        <div class="tag-saleoff">
                                    <span><%String giasel =((int)(p.getSell()*100))+"%";%>
                                    <%=giasel%></span>
                                        </div>
                                        <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                                    </div>
                                    <%}%>
                                </div>
                                <div class="list-image-hover">

                                    <%for ( int j = 0; j < p.getListUrlImg().size(); j++ ) {%>
                                    <% if(j >= limitImageSmall)break;%>
                                    <img class="img-item-hov" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(j)%>" alt="">
                                    <%}%>
                                </div>
                                <div class="text-content-collection">

                                    <h3 class="slide-collection-title">
                                        <%=p.getTenSP()%>
                                    </h3>
                                    <span class="slide-collection-price">
                                <%double giaSell = p.getGia()- p.getSell()*p.getGia();%>
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>đ
                                </span>
                                    <%if(p.getSell() > 0){%>
                                    <span class="current-price">
                                 <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>đ
                                </span>
                                    <%}%>
                                </div>
                            </div>


                            <%}%>


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
                    <a href="/Shopping/search?id=<%=boSuaTap1.getId()%>&res=bst&name=<%=boSuaTap1.getName()%>" class="btn">
                        xem thêm
                    </a>
                </div>
            </div>


        </div>

        <div class="collection-item" id="collection-second">

            <div class="collection-main">
                <h2 class="section-title margin-right-5">
                    <%=boSuaTap2.getName()%>
                </h2>
                <p class="subtile-section">
                    <%=boSuaTap2.getTieuDe()%>
                </p>

                <div class="collection-slide">
                    <div class="collection-content">

                        <div class="slideshow-collection">

                         <%List<Product> productList = (List<Product>) request.getAttribute("listBoSTRight");
                             for ( Product p : productList) {%>
                            <div class="slide-collection">
                                <div class="collection-slide-div">
                                    <a href="/Shopping/detail?id=<%=p.getMaSP()%>">

                                        <img class="collection-slide-image" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(0)%>" alt="">
                                    </a>
                                    <div class="btn-img">
                                        <div class="btn-img-search">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </div>
                                        <div class="btn-img-buy">
                                            <a href="/Shopping/detail?id=<%=p.getMaSP()%>">mua ngay</a>
                                        </div>
                                        <div class="btn-img-cart" idSP =<%=p.getMaSP()%>  onclick="openModal(this)"
                                             data-product-id="<%=p.getMaSP()%>"
                                             data-product-name="<%=p.getTenSP()%>"
                                             data-product-price="<%=p.getGia()%>"
                                             data-product-img="<%=p.getListUrlImg().get(0)%>"
                                             data-product-sell="<%=p.getSell()%>"
                                             data-product-size-s="<%=p.getS()%>"
                                             data-product-size-l="<%=p.getL()%>"
                                             data-product-size-m="<%=p.getM()%>"
                                             data-product-size-xl="<%=p.getXL()%>"
                                             data-product-color="<%=p.getMau()%>">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </div>
                                    </div>
                                    <%if(p.getSell() > 0){%>
                                    <div class="colection-tag">
                                        <div class="tag-saleoff">
                                    <span><%String giasel =((int)(p.getSell()*100))+"%";%>
                                    <%=giasel%></span>
                                        </div>
                                        <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                                    </div>
                                    <%}%>
                                </div>
                                <div class="list-image-hover">
                                    <%for ( int j = 0; j < p.getListUrlImg().size(); j++ ) {%>
                                    <% if(j >= limitImageSmall)break;%>
                                    <img class="img-item-hov" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(j)%>" alt="">
                                    <%}%>
                                   </div>
                                <div class="text-content-collection">
                                    <h3 class="slide-collection-title">
                                        <%=p.getTenSP()%>
                                    </h3>
                                    <span class="slide-collection-price">
                                        <%double giaSell = p.getGia()- p.getSell()*p.getGia();%>
                                        <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>đ

                                        </span>
                                    <%if(p.getSell() > 0){%>
                                    <span class="current-price">
                                     <fmt:formatNumber type = "number"
                                                       maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>đ
                                </span>
                                    <%}%>
                                </div>
                            </div>


                            <%}%>


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
                    <a href="/Shopping/search?id=<%=boSuaTap2.getId()%>&res=bst&name=<%=boSuaTap2.getName()%>" class="btn">
                        xem thêm
                    </a>
                </div>
            </div>
            <div class="collection-banner" style="background-image: url(<%=boSuaTap2.getHinhAnh()%>)">
                <a href=""></a>
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
                <%List<Product> productList3 = (List<Product>) request.getAttribute("listSPNoiBat");
                    for ( Product p : productList3){%>
                <div class="slides-item">
                    <div class="slide-collection">
                        <div class="collection-slide-div">
                            <a href="/Shopping/detail?id=<%=p.getMaSP()%>">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(0)%>" alt="">
                            </a>
                            <div class="btn-img padding-btn-slider">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="/Shopping/detail?id=<%=p.getMaSP()%>">mua ngay</a>
                                </div>
                                <div class="btn-img-cart" idSP =<%=p.getMaSP()%>  onclick="openModal(this)"
                                     data-product-id="<%=p.getMaSP()%>"
                                     data-product-name="<%=p.getTenSP()%>"
                                     data-product-price="<%=p.getGia()%>"
                                     data-product-img="<%=p.getListUrlImg().get(0)%>"
                                     data-product-sell="<%=p.getSell()%>"
                                     data-product-size-s="<%=p.getS()%>"
                                     data-product-size-l="<%=p.getL()%>"
                                     data-product-size-m="<%=p.getM()%>"
                                     data-product-size-xl="<%=p.getXL()%>"
                                     data-product-color="<%=p.getMau()%>">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                            <%if(p.getSell() > 0){%>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span><%String giasel =((int)(p.getSell()*100))+"%";%>
                                    <%=giasel%></span>
                                </div>
                                <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                            </div>
                            <%}%>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                <%=p.getTenSP()%>
                            </h3>
                            <span class="slide-collection-price">
                                <%double giaSell = p.getGia()- p.getSell()*p.getGia();%>
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>đ
                                </span>
                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                 <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>đ
                                </span>
                            <%}%>
                        </div>
                    </div>
                </div>


                <%}%>
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
            <h2 class="tablinks"> KHUYẾN MÃI</h2>
        </div>
        <div id="list-tab1">
            <div class="list-tab-content list-tab-content1">

                <%List<Product> productList4 = (List<Product>) request.getAttribute("listSPMoi");
                    for ( Product p : productList4) {%>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="/Shopping/detail?id=<%=p.getMaSP()%>">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(0)%>" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <a href="/Shopping/detail?id=<%=p.getMaSP()%>">mua ngay</a>
                            </div>
                            <div class="btn-img-cart" idSP =<%=p.getMaSP()%>  onclick="openModal(this)"
                                 data-product-id="<%=p.getMaSP()%>"
                                 data-product-name="<%=p.getTenSP()%>"
                                 data-product-price="<%=p.getGia()%>"
                                 data-product-img="<%=p.getListUrlImg().get(0)%>"
                                 data-product-sell="<%=p.getSell()%>"
                                 data-product-size-s="<%=p.getS()%>"
                                 data-product-size-l="<%=p.getL()%>"
                                 data-product-size-m="<%=p.getM()%>"
                                 data-product-size-xl="<%=p.getXL()%>"
                                 data-product-color="<%=p.getMau()%>">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <%if(p.getSell() > 0){%>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                           <span><%String giasel =((int)(p.getSell()*100))+"%";%>
                                    <%=giasel%></span>
                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                        <%}%>
                    </div>
                    <div class="list-image-hover">
                        <%for ( int j = 0; j < p.getListUrlImg().size(); j++ ) {%>
                        <% if(j >= limitImageSmall)break;%>
                        <img class="img-item-hov" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(j)%>" alt="">
                        <%}%>
                         </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            <%=p.getTenSP()%>
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                     <%double giaSell = p.getGia()- p.getSell()*p.getGia();%>
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>đ

                                </span>

                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                   <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>đ
                                </span>
                            <%}%>

                        </div>
                    </div>
                </div>


                <%}%>

            </div>
            <div class="div-btn-tab">
                <a class="btn btn-tab" so="1" size ="<%=productList4.size()%>">xem thêm</a>
            </div>

        </div>

        <div id="list-tab2">
            <div class="list-tab-content list-tab-content3">
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
                            <div class="btn-img-cart" onclick="openModal('1')">
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
                            <div class="btn-img-cart" onclick="openModal('1')">
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
                <a class="btn btn-tab" so="3" size ="4" >xem thêm</a>
            </div>

        </div>
        <div id="list-tab3">
            <div class="list-tab-content list-tab-content2">

                <%List<Product> productList6 = (List<Product>) request.getAttribute("listSPKM");
                    for ( Product p : productList6) {%>

                <div class="slide-collection">
                    <div class="collection-slide-div">
                        <a href="/Shopping/detail?id=<%=p.getMaSP()%>">
                            <img class="collection-slide-image" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(0)%>" alt="">
                        </a>
                        <div class="btn-img">
                            <div class="btn-img-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <div class="btn-img-buy">
                                <a href="/Shopping/detail?id=<%=p.getMaSP()%>">mua ngay</a>
                            </div>
                            <div class="btn-img-cart" idSP =<%=p.getMaSP()%>  onclick="openModal(this)"
                                 data-product-id="<%=p.getMaSP()%>"
                                 data-product-name="<%=p.getTenSP()%>"
                                 data-product-price="<%=p.getGia()%>"
                                 data-product-img="<%=p.getListUrlImg().get(0)%>"
                                 data-product-sell="<%=p.getSell()%>"
                                 data-product-size-s="<%=p.getS()%>"
                                 data-product-size-l="<%=p.getL()%>"
                                 data-product-size-m="<%=p.getM()%>"
                                 data-product-size-xl="<%=p.getXL()%>"
                                 data-product-color="<%=p.getMau()%>">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                        </div>
                        <%if(p.getSell() > 0){%>
                        <div class="colection-tag">
                            <div class="tag-saleoff">
                         <span><%String giasel =((int)(p.getSell()*100))+"%";%>
                                    <%=giasel%></span>                            </div>
                            <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                        </div>
                        <%}%>
                    </div>
                    <div class="list-image-hover">
                        <%for ( int j = 0; j < p.getListUrlImg().size(); j++ ) {%>
                        <% if(j >= limitImageSmall)break;%>
                        <img class="img-item-hov" src="<%=request.getContextPath()%><%=p.getListUrlImg().get(j)%>" alt="">
                        <%}%>
                    </div>
                    <div class="text-content-collection">
                        <h3 class="slide-collection-title">
                            <%=p.getTenSP()%>
                        </h3>
                        <div>
                                <span class="slide-collection-price">
                                    <%double giaSell = p.getGia()- p.getSell()*p.getGia();%>
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>đ

                                </span>

                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                    <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>đ
                                </span>
                            <%}%>

                        </div>
                    </div>
                </div>


                <%}%>

            </div>
            <div class="div-btn-tab">
                <a class="btn btn-tab" so="2" size ="<%=productList6.size()%>">xem thêm</a>
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
<%--=================================================modal====================================================--%>
<div class="modal-custom" id="modal-cart">
    <div class="modal-dialog-custom">
        <div class="modal-content-custom">
            <div class="modal-slide">
                <img class="modal-img" src="<%=request.getContextPath()%>/img/collection1_slide_product_1.jpg" alt="">

            </div>
            <div class="modal-body-custom">
                <h4 class="modal-title">
                    Áo Khoác Lửng Dạ Hồng Ốp Tua Rua Cài Móc Mã H331013C
                </h4>
                <h4 class="modal-id">
                    Mã SP: 321691492193020636
                </h4>
                <div class="modal-price">
                    <span class="slide-collection-price">
                        847,000đ
                    </span>
                    <span class="current-price">
                        941,000đ
                    </span>
                </div>
                <p class="color-product modal-text"><span class="modal-text-bold">Màu sắc:</span><span class="product-color">trắng</span></p>
                <div class="product-size modal-text">
                    <p class="modal-text-bold">Kích cỡ:</p>
                    <ul class="product-list-sizes">
                        <li class="product-list-size">S</li>
                        <li class="product-list-size">M</li>
                        <li class="product-list-size">L</li>
                        <li class="product-list-size">XL</li>
                    </ul>
                </div>
                <a class="btn-modal">THÊM VÀO GIỎ HÀNG</a>
                <a href="#" class="link-continue">Xem chi tiết đầy đủ</a>
            </div>
            <div class="icon-close-modal" onclick="closeModal()">
                <i class="fa-solid fa-xmark icon-modal"></i>
            </div>
        </div>

    </div>
</div>
<script src="<%=request.getContextPath()%>/script/home.js"></script>
<script>
    $(document).ready(function () {
       //click btn-img-cart
        $('.btn-img-cart').click(function () {
            //get attr
            var id = $(this).attr('idSP');
           //ajax
            $.ajax({
                url: '<%=request.getContextPath()%>/cart',
                type: 'POST',
                data: {
                    id: id
                },
                success: function (data) {
                    //get json
                    var json = JSON.parse(data);
                    if (json.success === 'true') {
                            $('.cart-count.color-red').text(json.quantity);
                        pushNotify('success','thêm vào giỏi hàng thành công','Thêm Sản phẩm');

                    } else {
                        pushNotify('error','thêm vào giỏi hàng thất bại','Thêm Sản phẩm');

                    }
                }
            });
        });

    });

    function pushNotify(status, message, title) {
        new Notify({
            status: status,
            title: title,
            text: message,
            effect: 'fade',
            speed: 300,
            customClass: '',
            customIcon: '',
            showIcon: true,
            showCloseButton: true,
            autoclose: true,
            autotimeout: 2000,
            gap: 20,
            distance: 20,
            type: 1,
            position: 'right bottom',
            customWrapper: '',
        })
    }

    //----------xem thêm san pham ---------
    //set attr

    //click btn btn-tab
    $('.btn.btn-tab').click(function () {
        //set attr

        //get attr
        var so = $(this).attr('so');
        var size = $(this).attr('size');
        var actibu = $(this);

         //ajax
         $.ajax({
             url: '<%=request.getContextPath()%>/home',
             type: 'POST',
             data: {
                 so: so,
                 size: size
             },
             success: function (data) {

                 if (data != null) {
                     var json = data;
                     //set attr
                     actibu.attr('size', size + json.length);


                     for (var i = 0; i < json.length; i++) {
                         var product = json[i];
                         var iconsell = '';
                         var giaCu = '';

                         if (product.sell > 0) {
                             iconsell = '<div class="colection-tag">' +
                                 '<div class="tag-saleoff">' +
                                 '<span>' + (product.sell * 100) + '%</span>' +
                                 '</div>' +
                                 '<img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">' +
                                 '</div>';
                             giaCu = '<span class="current-price">' +
                                 formatNumber(product.gia) +
                                 'đ</span>';
                         }
                         var iconHover = '';
                         var count = 0;
                         for (var j = 0; j < product.listUrlImg.length; j++) {
                             var image = product.listUrlImg[j];
                             iconHover += '<img src="<%=request.getContextPath()%>' + image + '" alt="" class="img-item-hov">';
                             count++;
                             if (count >= 5) {
                                 break;
                             }
                         }

                             var price = formatNumber((product.gia - product.sell * product.gia)) + 'đ';
                         <%--data-product-id="<%=p.getMaSP()%>"--%>
                         <%--data-product-name="<%=p.getTenSP()%>"--%>
                         <%--data-product-price="<%=p.getGia()%>"--%>
                         <%--data-product-img="<%=p.getListUrlImg().get(0)%>"--%>
                         <%--data-product-sell="<%=p.getSell()%>"--%>
                         <%--data-product-size-s="<%=p.getS()%>"--%>
                         <%--data-product-size-l="<%=p.getL()%>"--%>
                         <%--data-product-size-m="<%=p.getM()%>"--%>
                         <%--data-product-size-xl="<%=p.getXL()%>"--%>
                         <%--data-product-color="<%=p.getMau()%>">--%>
                             $('.list-tab-content'+so).append('<div class="slide-collection">' +
                                 '<div class="collection-slide-div">' +
                                 '<a href="<%=request.getContextPath()%>/detail?id=' + product.maSP + '">' +
                                 '<img class="collection-slide-image"' +
                                 'src="<%=request.getContextPath()%>' + product.listUrlImg[0] + '" alt="">' +
                                 '</a>' +
                                 '<div class="btn-img">' +
                                 '<div class="btn-img-search">' +
                                 '<i class="fa-solid fa-magnifying-glass"></i>' +
                                 '</div>' +
                                 '<div class="btn-img-buy">' +
                                 '<a href="<%=request.getContextPath()%>/detail?id=' + product.maSP + '">mua ngay</a>' +
                                 '</div>' +
                                 '<div class="btn-img-cart" idSP ="' + product.maSP + '"onclick="openModal(this)"' +
                                 'data-product-id="'+ product.maSP+'"' +
                                 'data-product-name="'+ product.tenSP+'"' +
                                 'data-product-price="'+ product.gia+'"' +
                                 'data-product-img="'+ product.listUrlImg[0]+'"' +
                                 'data-product-sell="'+ product.sell+'"' +
                                 'data-product-size-s="'+ product.S+'"' +
                                 'data-product-size-l="'+ product.L+'"' +
                                 'data-product-size-m="'+ product.M+'"' +
                                 'data-product-size-xl="'+ product.XL+'"' +
                                 'data-product-color="'+ product.mau+'"' +
                                 '>' +
                                 '<i class="fa-solid fa-cart-shopping"></i>' +
                                 '</div>' +
                                 '</div>' + iconsell +
                                 '</div>' +
                                 '<div class="list-image-hover">' + iconHover +
                                 '</div>' +
                                 '<div class="text-content-collection">' +
                                 '<h3 class="slide-collection-title">' +
                                 product.tenSP +
                                 '</h3>' +
                                 '<div>' +
                                 '<span class="slide-collection-price">' + price +
                                 '</span>' +
                                 giaCu +
                                 '</div>' +
                                 '</div>' +
                                 '</div>');

                         }

                     }


                 const listImageHover = document.querySelectorAll(".img-item-hov");
                 listImageHover.forEach((element) => {
                     element.addEventListener("mouseover", () => {
                         element
                             .closest(".slide-collection")
                             .querySelector(".collection-slide-image").src = element.src;
                     });
                 });


             }
         });



    }
  );


    function formatNumber(num) {
        //convert double to int
        num =parseInt(num);
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
    }
    //-----------------------model add cart---------

    document.querySelectorAll('.product-list-size').forEach(element => {
        element.addEventListener('click', function () {
            this.classList.toggle('active');
        });
    });

    //modal close dom
    const modalCart = document.getElementById('modal-cart');
    function closeModal() {
        modalCart.style.display = "none";
    }
  //   data-product-id
  //   data-product-name
  //   data-product-price
  //   data-product-img
  //   data-product-sell
  //   data-product-size-s
  //   data-product-size-l
  //  data-product-size-m
  //   data-product-size-xl
  // data-product-color
    function openModal(element) {
        let id =element.getAttribute('data-product-id');
        let name =element.getAttribute('data-product-name');
        let price =element.getAttribute('data-product-price');
        let img =element.getAttribute('data-product-img');
        let sell =element.getAttribute('data-product-sell');
        let sizeS =element.getAttribute('data-product-size-s');
        let sizeL =element.getAttribute('data-product-size-l');
        let sizeM =element.getAttribute('data-product-size-m');
        let sizeXL =element.getAttribute('data-product-size-xl');
        let color =element.getAttribute('data-product-color');
        // alert(sizeS+" "+sizeM+" "+sizeL+" "+sizeXL);

        $('.product-list-sizes .product-list-size').removeClass('active');


        $('.modal-img').attr('src','<%=request.getContextPath()%>'+img);
        $('.modal-title').text(name);
        $('.modal-id').text(id);
        if(sell > 0){
            $('.modal-custom .slide-collection-price').text(formatNumber(price-sell*price)+'đ');
            $('.modal-custom .current-price').text(formatNumber(price)+'đ');
        }else{
            $('.modal-custom .slide-collection-price').text(formatNumber(price)+'đ');
            $('.modal-custom .current-price').text('');
        }
        $('.product-color').text(color);
        modalCart.style.display = "flex";

    }

    //modal close over modal
    //modal close on click outside
    modalCart.addEventListener('click', function (event) {
        if (event.target === modalCart) {
            modalCart.style.display = "none";
        }
    });
    //windowns load dom
    document.querySelectorAll('.product-list-size').forEach(element => {
        element.addEventListener('click', function () {
            this.classList.toggle('active');
        });
    });
    //============================================modal==============================
    window.onload = function () {
        const modalCart = document.getElementById('modal-cart');
        function closeModal() {
            modalCart.style.display = "none";
        }
        function openModal(position) {
            modalCart.style.display = "flex";

        }
        //modal close over modal
        //modal close on click outside
        modalCart.addEventListener('click', function (event) {
            if (event.target === modalCart) {
                modalCart.style.display = "none";
            }
        });
        //windowns load dom
        document.querySelectorAll('.product-list-size').forEach(element => {
            element.addEventListener('click', function () {
                element.classList.toggle('active');
            });
        });
    }

</script>