
<%@ page import="java.util.ArrayList" %>
<%@ page import="modal.beans.Product" %>
<%@ page import="modal.beans.ProductSize" %>
<%@ page import="modal.beans.ProductColor" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% Product product=(Product)request.getAttribute("productDetail");
    ArrayList<Product> listRelated=(ArrayList<Product>)request.getAttribute("relatedProduct");
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String trademark=product.getTrademark();
    String title =product.getTitle();
    String id=product.getId();
    double price= product.getPrice();
    double sale=product.getSale();
    int available=product.getAvailable();
    ProductSize[] listSizes= product.getListSize();
    ProductColor[] listColor= product.getListColor();
    String material=product.getMaterial();
    String type=product.getType();
    String match=product.getMatch();
    String productBranch=product.getProductBranch();
    String modelDescribe=product.getModelDescribe();
    String[] listImage=product.getListImage();
    int amount=0;

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Product</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body onresize="resizeWindow()">
   <%@include file="Header.jsp"%>
    <section class="detail">
        <div class="detail__image">
            <div id="image__right">

                <div id="image__right__element">
                    <img id="image__right__element--img" src="<%=request.getContextPath()%>/img/${productDetail.id}/<%=listImage[0]%>" >
                </div>
                <div class="img-zoom-lens">
                </div>
                <div class="img-zoom-result">
                </div>
            </div>
            <div id="image__left">
                <ul class="image__left__list">

                    <c:forEach items="${productDetail.listImage}" var="i" >
                    <li class="image__left__item">

                       <img onclick="leftToRightSupport(this);imageZoom();" class="image__left__element" src="<%=request.getContextPath()%>/img/${productDetail.id}/${i}">
                   </li>
                    </c:forEach>

                </ul>
                <div class="up text-center" onclick="changeImage(-1,<%=product.getListImage().length%>)"><i class="fas fa-angle-up"></i></div>
                <div class="down text-center" onclick="changeImage(1,<%=product.getListImage().length%>)"><i class="fas fa-angle-down"></i></div>
            </div>

        </div>
        <div class="detail__infor">
            <div class="infor__head">
                <div class="product__title">
                    <h1>${productDetail.title}</h1>
                </div>
                <div class="product__trademark">

                    <span>${productDetail.trademark}</span>
                </div>
                <div class="product__id">

                    <span>Mã SP: ${productDetail.id}</span>
                </div>
            </div>
            <div class="infor__body">
                <div class="product__price" >

                    <c:choose>
                        <c:when test="<%=sale>0%>">

                            <span><%=convertPrice(price-price*sale/100)%>₫</span>
                            <div class='product__price__sale'><s><%=convertPrice(price)%>₫</s> </div>
                            <div class='product__percent__sale' >
                            <span><%=sale%>%</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span><%=convertPrice(price)%>₫</span>
                        </c:otherwise>
                    </c:choose>

                </div>
                <c:choose>
                <c:when test="<%=available>0%>">
                <div class="product__size">
                    <div class="product__header">
                        Kích thước
                    </div>
                    <div class="product__size__elements">
                        <div class="product__size__element">

                            <c:forEach var="item" items="<%=listSizes%>" >

                                <label <c:if test="${item.status==1}">onclick="hiddenLabel(this)" </c:if>class="text-center">
                                    <c:out value="${item.sizeTitle}"></c:out>
                                    <c:choose>
                                    <c:when test="${item.status==0}">

                                        <img class ="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png" alt="">

                                    </c:when>
                                        <c:otherwise>
                                            <img class ="sold-out-image select-image" src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </label>

                            </c:forEach>

                        </div>
                    </div>

                </div>

                <div class="product__color">
                    <div class="product__header">
                    Màu sắc

                    </div>
                    <div class="product__color__elements action-flex">
                        <c:forEach var="item" items="<%=listColor%>">
                        <div class="product__color__element" style="background-color: ${item.colorID}">
                        </div>
                        </c:forEach>
                    </div>

                </div>


            </div>
            <div class="infor__footer">
                <div class="product__amount">
                    <div class="product__header">Số lượng</div>
                    <div class="product__amount__form">
                        <button class="decrease" onclick='changeAmount(-1,<%=available%>)'><i class="fas fa-chevron-left"></i></button>
                        <label id="countLabel" class="amount-num text-center">1</label>
                        <button class="increase" onclick='changeAmount(1,<%=available%>)'><i class="fas fa-chevron-right"></i></button>

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
                <span><strong>Chất Liệu: </strong><%=material%></span>
                <span><strong>Kiểu Dáng: </strong> <%=type%> </span>
                <span><strong>Phù Hợp: </strong><%=match%></span>
                <span><strong>Sản phẩm thuộc dòng sản phẩm: </strong><%=productBranch%></span>
                <span> <strong>Thông tin người mẫu: </strong><%=modelDescribe%></span>
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
                        <c:forEach var="item" items="<%=listRelated%>">
                        <li class="wrap__element">
                            <div class="wrap__element__image"> <img src="<%=request.getContextPath()%>/img/${item.id}/${item.listImage[0]}" alt="">
                                <div class="clear-fix">
                                    <a href="https://nemshop.vn/collections/tat-ca-san-pham/products/ao-khoac-2710" class="detail__link"></a>
                                    <div class="advise-box">
                                        <a href="" class="advise__button text-center">TƯ VẤN</a>
                                    </div>
                                </div>
                               <c:choose>
                                   <c:when test="${item.available==0}">
                                       <div class="wrap__sale-off text-center">
                                               ${item.sale}%
                                       </div>
                                       <div class="wrap__sold-out text-center">STORE ONLY</div>
                                   </c:when>
                                   <c:otherwise>
                                       <div class="wrap__sale-off text-center" style="right:50%; transform:translateX(50%);">${item.sale}%</div>
                                   </c:otherwise>
                               </c:choose>
                            </div>
                            <div class="wrap__title">
                                <a class="text-center" href=""> ${item.title}</a>
                            </div>
                            <div class="wrap__price text-center">
                                <c:choose>
                                    <c:when test="<%=product.getSale()>0%>">
                                        <span class="curren-price"><%=convertPrice(product.getPrice()-(product.getPrice()*product.getSale()/100))%>₫
                        </span>
                                        <span class="origin-price">
                            <s><%=convertPrice(product.getPrice())%>₫</s>
                        </span>
                                    </c:when>
                                    <c:otherwise>
                                      <span class="curren-price">
                            <s><%=convertPrice(product.getPrice())%>₫</s>
                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                        </c:forEach>
                    </div>
                    <div class="wrap-left-slide text-center" onclick="transition(-1)"><i class="fas fa-angle-left"></i></div>
                    <div class="wrap-right-slide text-center" onclick="transition(1)"><i class="fas fa-angle-right"></i></div>         
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
   <%@include file="footer.jsp"%>
    <script src="<%=request.getContextPath()%>/script/detail.js"></script>

</body>

</html>
<%!
    private String convertPrice(double price) {
        double priceCoppy=price;
        String str="";
        if((int)(priceCoppy/1000000)>0){
            str=(int)(priceCoppy/1000000)+",";
            //chỉ lấy phần nguyên
            priceCoppy=priceCoppy%1000000;
        }
        if((int)(priceCoppy/1000)>0){
            str+=(int)(priceCoppy/1000)+",";
            priceCoppy=priceCoppy%1000;
        }
        else str+="000,";
        if((int)(priceCoppy/1)>0){
            str+=(int)(priceCoppy/1);

        }
        else str+="000";
        return str;
    }
%>