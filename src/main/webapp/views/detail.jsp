<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.util.List" %>


<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% Product product=(Product)request.getAttribute("product");
    BoSuaTap bst=(BoSuaTap) request.getAttribute("bosuutap");
    List<Product> listRelateds=(List<Product>)request.getAttribute("related");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail.css">


    <section class="detail">
        <div class="detail__image">
            <div id="image__right">

                <div id="image__right__element">
                    <img id="image__right__element--img" src="<%=request.getContextPath()%>/<%=product.getListUrlImg().get(0)%>" >
                </div>
                <div class="img-zoom-lens">
                </div>
                <div class="img-zoom-result">
                </div>
            </div>
            <div id="image__left">
                <ul class="image__left__list">

                    <c:forEach items="<%=product.getListUrlImg()%>>" var="i" >
                    <li class="image__left__item">
                       <img onclick="leftToRightSupport(this);imageZoom();" class="image__left__element" src="<%=request.getContextPath()%>/${i}">
                   </li>
                    </c:forEach>

                </ul>
                <div class="up text-center" onclick="changeImage(-1,<%=product.getListUrlImg().size()%>)"><i class="fas fa-angle-up"></i></div>
                <div class="down text-center" onclick="changeImage(1,<%=product.getListUrlImg().size()%>)"><i class="fas fa-angle-down"></i></div>
            </div>

        </div>
        <div class="detail__infor">
            <div class="infor__head">
                <div class="product__title">
                    <h1><%=product.getTenSP()+" "+product.getMaSP()%>></h1>
                </div>
<%--                <div class="product__trademark">

                    <span>${productDetail.trademark}</span>
                </div>
                <div class="product__id">

                    <span>Mã SP: ${productDetail.id}</span>
                </div>--%>
            </div>
            <div class="infor__body">
                <div class="product__price" >

                    <c:choose>
                        <c:when test="<%=product.getSell()>0%>">
                            <span>
                                <scrip>
                                    convertPrice(<%=product.getGia()-product.getGia()*product.getSell()/100%>)
                                </scrip>
                            </span>
                            <div class='product__price__sale'><s>
                                <scrip>
                                    convertPrice(<%=product.getGia()%>)
                                </scrip>
                            </s> </div>
                            <div class='product__percent__sale' >
                            <span><%=product.getSell()%>%</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span> <scrip>
                                    convertPrice(<%=product.getGia()%>)
                                </scrip></span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:choose>
                <c:when test="<%=product.getM()+product.getS()+product.getL()+product.getXL()>0%>">
                <div class="product__size">
                    <div class="product__header">
                        Kích thước
                    </div>
                    <div class="product__size__elements">
                        <div class="product__size__element">

                                <label class="text-center">
                                    <c:choose>
                                        <strong>S</strong>
                                        <c:when test="<%=product.getS()>0%>">
                                         <img class ="sold-out-image select-image" src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img class ="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </label>
                            <label class="text-center">
                                <c:choose>
                                    <strong>M</strong>
                                    <c:when test="<%=product.getM()>0%>">
                                        <img class ="sold-out-image select-image" src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class ="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </label>
                            <label class="text-center">
                                <c:choose>
                                    <strong>L</strong>
                                    <c:when test="<%=product.getL()>0%>">
                                        <img class ="sold-out-image select-image" src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class ="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </label>
                            <label class="text-center">
                                <c:choose>
                                    <strong>XL</strong>
                                    <c:when test="<%=product.getXL()>0%>">
                                        <img class ="sold-out-image select-image" src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class ="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </label>

                        </div>
                    </div>

                </div>

                <div class="product__color">
                    <div class="product__header">
                    Màu sắc

                    </div>
                    <div class="product__color__elements action-flex">
                            <%StringTokenizer sk=new StringTokenizer(product.getMau(),",");
                            while(sk.hasMoreTokens()){%>
                        <label class="text-center"><%=sk.nextToken()%></label>
                            <%}%>
                    </div>

                </div>


            </div>
            <div class="infor__footer">
                <div class="product__amount">
                    <div class="product__header">Số lượng</div>
                    <div class="product__amount__form">
                        <button class="decrease" onclick='changeAmount(-1,<%=product.getM()+product.getS()+product.getL()+product.getXL()>0%>)'><i class="fas fa-chevron-left"></i></button>
                        <label id="countLabel" class="amount-num text-center">1</label>
                        <button class="increase" onclick='changeAmount(1,<%=product.getM()+product.getS()+product.getL()+product.getXL()>0%>)'><i class="fas fa-chevron-right"></i></button>

                    </div>

                </div>
                <div class="add-cart text-center">
                    <button class="add-cart__button" onclick="activeForm()">THÊM VÀO GIỎ</button>
                </div>
                <div class="buy-now text-center">
                    <button class="buy-now__button">MUA NGAY</button>
                </div>

            </div>
                </c:when>
            <c:otherwise>
            <div class="infor__footer">
                <div class="store-only text-center">
                    <button>CHỈ CÒN TẠI CỬA HÀNG</button>
                </div>
            </div>
            </c:otherwise>
            </c:choose>
            <div class="decriptions">
                <p><strong><%=bst.getName()%></strong></p>
                <p><%=bst.getMota()%></p>
                <p><%=product.getMoTa()%></p>

            </div>
        </div>

    </section>
    <section class="related-product">
        <div class="wrap">
            <div class="wrap__header">
                <h2 class="text-center">SẢN PHẨM TƯƠNG TỰ</h2>
            </div>
            <div class="wrap__content">

                <ul class="wrap__list">

                    <div class="wrap__list__box">
                        <c:forEach var="item" items="<%=listRelateds%>">

                        <li class="wrap__element">
                            <div class="wrap__element__image"> <img src="<%=request.getContextPath()%>/${item.listUrlImg.get(0)}" alt="">
                                <div class="clear-fix">
                                    <a href="https://nemshop.vn/collections/tat-ca-san-pham/products/ao-khoac-2710" class="detail__link"></a>
                                    <div class="advise-box">
                                        <a href="" class="advise__button text-center">TƯ VẤN</a>
                                    </div>
                                </div>
                               <c:choose>
                                   <c:when test="${item.m+item.s+item.l+item.XL==0}">
                                       <div class="wrap__sale-off text-center">
                                               ${item.sell}%
                                       </div>
                                       <div class="wrap__sold-out text-center">STORE ONLY</div>
                                   </c:when>
                                   <c:otherwise>
                                       <div class="wrap__sale-off text-center" style="right:50%; transform:translateX(50%);">${item.sell}%</div>
                                   </c:otherwise>
                               </c:choose>
                            </div>
                            <div class="wrap__title">
                                <a class="text-center" href=""> ${item.tenSP}</a>
                            </div>
                            <div class="wrap__price text-center">
                                <c:choose>
                                    <c:when test="${item.sell>0}">

                                        <span class="curren-price">
                                             <scrip>
                                    convertPrice(<%=product.getGia()-product.getGia()*product.getSell()/100%>)
                                </scrip>
                                        </span>
                                        <span class="origin-price">
                            <s> <scrip>
                                    convertPrice(<%=product.getGia()%>)
                                </scrip>
                            </s>
                        </span>
                                    </c:when>
                                    <c:otherwise>
                                      <span class="curren-price">
                            <s>
                                 <scrip>
                                    convertPrice(<%=product.getGia()%>)
                                </scrip>
                            </s>
                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                        </c:forEach>
                    </div>
                    <div class="wrap-left-slide text-center" onclick="transition(-1,${item.m+item.s+item.l+item.XL})"><i class="fas fa-angle-left"></i></div>
                    <div class="wrap-right-slide text-center" onclick="transition(1,${item.m+item.s+item.l+item.XL})"><i class="fas fa-angle-right"></i></div>
                </ul>
            </div>
        </div>
    </section>
    <!-- code html cho form thêm hàng -->
    <div class="form">
        <div class="form__content">
            <div class="delete-form" onclick="activeForm()">
                <i class="fas fa-times-circle"></i>
            </div>
            <div class="form__title"><h3>Giỏ hàng của bạn (Đang có 1 sản phẩm)</h3></div>
            <div class="form__table">
                <table>
                    <thead>
                        <th></th>
                        <th>Sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th></th>
    
                    </thead>
                    <tbody>
                        <tr>
                            <td class="table__image-decription"><a href=""><img src="<%=request.getContextPath()%>/img/321691492193020636/1.jpg" alt=""></a></td>
                            <td class="table__infor-decription ">	
                                <a href="" class="bold-text"><h5>ĐẦM TIỆC HỒNG PHỐI SEQUIN D32169</h5></a> <br>
                               <span>Phiên bản: Size 6 / Hồng </span><br>
                               <span>Thương hiệu: NEM</span> </td>
                            <td class="table__price-bill bold-text">1,493,000₫</td>
                            <td class="table__amount"><input type="text" placeholder="1"></td>
                            <td class="table__price bold-text">1,493,000₫</td>
                            <td class="table__delete-element"><i class="fas fa-trash-alt"></i></td>
                        </tr>
                        <tr>
                            <td class="table__image-decription"><a href=""><img src="<%=request.getContextPath()%>/img/321691492193020636/1.jpg" alt=""></a></td>
                            <td class="table__infor-decription ">	
                                <a href="" class="bold-text"><h5>ĐẦM TIỆC HỒNG PHỐI SEQUIN D32169</h5></a> <br>
                               <span>Phiên bản: Size 6 / Hồng </span><br>
                               <span>Thương hiệu: NEM</span> </td>
                            <td class="table__price-bill bold-text">1,493,000₫</td>
                            <td class="table__amount"><input type="text" placeholder="1"></td>
                            <td class="table__price bold-text">1,493,000₫</td>
                            <td class="table__delete-element"><i class="fas fa-trash-alt"></i></td>
                        </tr>
                    </tbody>
                    
                </table>
            </div>
            <div class="form__footer">
                <div class="form__footer__left">
                    <textarea name="" class="footer__note" cols="30" rows="5" placeholder="Ghi chú"></textarea>
                    <a href="" class="return-shop">
                        <i class="fas fa-reply"></i>
                        Tiếp tục mua hàng
                    </a>
                </div>
                <div class="form__footer__right">
                    <div class="summary-price"><h3>TỔNG: 2,986,000₫</h3></div>
                    <div class="save-price">Tiết kiệm: 899,000₫</div>
                    <button class="update-cart" >CẬP NHẬT GIỎ HÀNG</button>
                    
                    <a href="" class="pay-button">TIẾN HÀNH THANH TOÁN</a>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/script/detail.js"></script>


