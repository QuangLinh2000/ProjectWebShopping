<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.model.admin.Appreciate" %><%--
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
    BoSuaTap boSuaTap2 = listBST.get(1);
List<Appreciate> listComment=(List<Appreciate>)request.getAttribute("listComment");
%>
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
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>??
                                </span>
                                    <%if(p.getSell() > 0){%>
                                    <span class="current-price">
                                 <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>??
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
                        xem th??m
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
                                        <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>??

                                        </span>
                                    <%if(p.getSell() > 0){%>
                                    <span class="current-price">
                                     <fmt:formatNumber type = "number"
                                                       maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>??
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
                        xem th??m
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
            S???N PH???M N???I B???T
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
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>??
                                </span>
                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                 <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>??
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
        <a href="#" class="btn-more-white1">Xem ?????a ch??? h??? th???ng c???a h??ng</a>
    </class>
</section>

<section id="tab-home">
    <div class="container">
        <div class="tab">
            <h2 class="tablinks active">S???n ph???m m???i</h2>
            <h2 class="tablinks">BEST SELLER</h2>
            <h2 class="tablinks"> KHUY???N M??I</h2>
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
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>??

                                </span>

                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                   <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>??
                                </span>
                            <%}%>

                        </div>
                    </div>
                </div>


                <%}%>

            </div>
            <div class="div-btn-tab">
                <a class="btn btn-tab" so="1" size ="<%=productList4.size()%>">xem th??m</a>
            </div>

        </div>

        <div id="list-tab2">
            <div class="list-tab-content list-tab-content3">

                <%List<Product> productList7 = (List<Product>) request.getAttribute("listSPBanChay");
                    for ( Product p : productList7) {%>

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
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>??

                                </span>

                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                    <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>??
                                </span>
                            <%}%>

                        </div>
                    </div>
                </div>


                <%}%>

            </div>
            <div class="div-btn-tab">
                <a class="btn btn-tab" so="3" size ="<%=productList7.size()%>">xem th??m</a>
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
                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=giaSell%>"/>??

                                </span>

                            <%if(p.getSell() > 0){%>
                            <span class="current-price">
                                    <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "<%=p.getGia()%>"/>??
                                </span>
                            <%}%>

                        </div>
                    </div>
                </div>


                <%}%>

            </div>
            <div class="div-btn-tab">
                <a class="btn btn-tab" so="2" size ="<%=productList6.size()%>">xem th??m</a>
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
            <%for(int i=0;i<listComment.size();i++){%>
            <div class="customer-item">
                <div class="customer-img shine-hover">
                    <img src="<%=request.getContextPath()%>/img/home_customer_img1.jpg" alt="">
                </div>
                <div class="bg-color">
                </div>
                <div class="customer-des">
                    <h3>
                        <%=listComment.get(i).getUserName()%>
                    </h3>
                    <span><%=listComment.get(i).getJob()%></span>
                    <p>
                     <%=listComment.get(i).getComment()%>
                    </p>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

<section id="home-blog">
    <div class="container">
        <div class="section-title">
            Tin t???c m???i nh???t
        </div>
        <div class="grid-article">
            <div class="article-item article-item-left">
                <div>
                    <div class="article-img shine-hover">
                        <img src="<%=request.getContextPath()%>/img/home_blog_main.jpg" alt="">
                    </div>
                    <div class="article-info">
                        <a href="#" class="article-title">
                            ??u ????i l??n ?????n 30% m???ng ng??y ph??? n??? Vi???t Nam 20/10
                        </a>
                        <div class="article-date">
                            12 Th??ng 10 2021
                        </div>
                        <div class="article-comment">
                            <i class="fas fa-comment-dots"></i>
                            <span class="fb_comments_count">0</span>
                        </div>
                        <div class="article-desc ">
                            Th??ng 10 l?? th??ng c?? ?? ngh??a ?????c bi???t v???i ch??? em ph??? n???. Ch??o m???ng ng??y ph??? n??? Vi???t Nam 20/10, Seven.AM ??U ????I L??N ?????...
                        </div>
                    </div>
                </div>
            </div>
            <div class="article-item article-item-right">
                <div class="article-img1 shine-hover zoom-hover">
                    <img src="<%=request.getContextPath()%>/img/home_blog.jpg" alt="Shall We Dance - V?? kh??c m??a thu trong BST m???i nh???t c???a Seven.AM">
                </div>

                <div class="article-info1">
                    <a href="#" class="article-title">
                        Shall We Dance - V?? kh??c m??a thu trong BST m???i ...
                    </a>
                    <div class="article-date1">
                        05 Th??ng 10 2021
                    </div>
                    <div class="article-comment1">
                        <i class="fas fa-comment-dots"></i>
                        <span class="fb_comments_count">0</span>

                    </div>
                    <div class="article-desc1">
                        M??a thu l??ng ????ng, m?? m???ng v?? ?????y ch???t th?? ???? mang ?????n c???m h???ng ????? Seven.AM tr??nh l??ng
                    </div>
                    <a href="#" class="btn-blog"><i class="fas fa-arrow-right"></i> Xem th??m</a>
                </div>
            </div>
            <div class="article-item article-item-right">
                <div class="article-img1 shine-hover zoom-hover">
                    <img src="<%=request.getContextPath()%>/img/home_blog.jpg" alt="Shall We Dance - V?? kh??c m??a thu trong BST m???i nh???t c???a Seven.AM">

                </div>

                <div class="article-info1">
                    <a href="#" class="article-title">
                        Shall We Dance - V?? kh??c m??a thu trong BST m???i ...
                    </a>
                    <div class="article-date1">
                        05 Th??ng 10 2021
                    </div>
                    <div class="article-comment1">
                        <i class="fas fa-comment-dots"></i>
                        <span class="fb_comments_count">0</span>

                    </div>
                    <div class="article-desc1">
                        M??a thu l??ng ????ng, m?? m???ng v?? ?????y ch???t th?? ???? mang ?????n c???m h???ng ????? Seven.AM tr??nh l??ng ...
                    </div>
                    <a href="#" class="btn-blog"><i class="fas fa-arrow-right"></i> Xem th??m</a>
                </div>
            </div>
        </div>
        <div class="collections-more flex-center">
            <a class="btn" href="#">Xem th??m</a>
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
                    ??o Kho??c L???ng D??? H???ng ???p Tua Rua C??i M??c M?? H331013C
                </h4>
                <h4 class="modal-id">
                    Ma?? SP: 321691492193020636
                </h4>
                <div class="modal-price">
                    <span class="slide-collection-price">
                        847,000??
                    </span>
                    <span class="current-price">
                        941,000??
                    </span>
                </div>
                <p class="color-product modal-text"><span class="modal-text-bold">M??u s???c:</span><span class="product-color">tr???ng</span></p>
                <div class="product-size modal-text">
                    <p class="modal-text-bold">K??ch c???:</p>
                    <ul class="product-list-sizes">
                        <li class="product-list-size">S</li>
                        <li class="product-list-size">M</li>
                        <li class="product-list-size">L</li>
                        <li class="product-list-size">XL</li>
                    </ul>
                </div>
                <a class="btn-modal">TH??M V??O GI??? H??NG</a>
                <a href="#" class="link-continue">Xem chi ti???t ?????y ?????</a>
            </div>
            <div class="icon-close-modal" onclick="closeModal()">
                <i class="fa-solid fa-xmark icon-modal"></i>
            </div>
        </div>

    </div>
</div>
<script src="<%=request.getContextPath()%>/script/home.js"></script>
<script>

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
            position: 'right top',
            customWrapper: '',
        })
    }

    //----------xem th??m san pham ---------
    //set attr

    //click btn btn-tab load sp
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
                                 '??</span>';
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

                             var price = formatNumber((product.gia - product.sell * product.gia)) + '??';
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

        $('.product-list-sizes .product-list-size').removeClass('crossed');
        $('.product-list-sizes .product-list-size').removeClass('active');


        var id =element.getAttribute('data-product-id');
        var name =element.getAttribute('data-product-name');
        var price =element.getAttribute('data-product-price');
        var img =element.getAttribute('data-product-img');
        var sell =element.getAttribute('data-product-sell');
        var sizeS =element.getAttribute('data-product-size-s');
        var sizeL =element.getAttribute('data-product-size-l');
        var sizeM =element.getAttribute('data-product-size-m');
        var sizeXL =element.getAttribute('data-product-size-xl');
        var color =element.getAttribute('data-product-color');
         // alert(sizeS+" "+sizeM+" "+sizeL+" "+sizeXL);

        var listbtnSize = document.getElementsByClassName('product-list-size');
        if(parseInt(sizeS) <= 0) {
            listbtnSize[0].classList.add('crossed');


        }
        if(parseInt(sizeM) <= 0) {
            listbtnSize[1].classList.add('crossed');
        }
        if(parseInt(sizeL) <= 0) {
            listbtnSize[2].classList.add('crossed');
        }
        if(parseInt(sizeXL) <= 0) {
            listbtnSize[3].classList.add('crossed');
        }




        $('.modal-img').attr('src','<%=request.getContextPath()%>'+img);
        $('.modal-title').text(name);
        $('.modal-id').text(id);
        if(sell > 0){
            $('.modal-custom .slide-collection-price').text(formatNumber(price-sell*price)+'??');
            $('.modal-custom .current-price').text(formatNumber(price)+'??');
        }else{
            $('.modal-custom .slide-collection-price').text(formatNumber(price)+'??');
            $('.modal-custom .current-price').text('');
        }
        $('.product-color').text(color);
        modalCart.style.display = "flex";



    }
  // click th??m  sp v??o gi??? h??ng

    $('.btn-modal').click(function () {
        var sizes = document.getElementsByClassName('product-list-size');
        //get class active
        var arrSize = [];
        for (var i = 0; i < sizes.length; i++) {
            if (sizes[i].classList.contains('active') && sizes[i].classList.contains('crossed') == false) {
                var size = sizes[i].innerText;
                arrSize.push(size);
            }
        }
        if(arrSize.length == 0){
            pushNotify('warning','Vui l??ng ch???n size','ch???n size');
            return;
        }
        addCart( arrSize);

    });

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

    function addCart(arrSize) {
        var id = $('.modal-id').text();
        closeModal();
        //convert array to json
        var size = JSON.stringify(arrSize);
        //ajax
        $.ajax({
            url: '<%=request.getContextPath()%>/cart',
            type: 'POST',
            data: {
                id: id,
                size: size
            },
            success: function (data) {
                //get json
                var json = JSON.parse(data);
                if (json.success === 'true') {
                    $('.cart-count.color-red').text(json.quantity);
                    pushNotify('success','th??m v??o gi???i h??ng th??nh c??ng','Th??m S???n ph???m');

                } else {
                    pushNotify('error','th??m v??o gi???i h??ng th???t b???i','Th??m S???n ph???m');

                }
            }
        });

    }


</script>