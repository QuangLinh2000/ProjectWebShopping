<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.dto.client.DetailProduct" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.data.DataString" %>


<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    DetailProduct detailProduct = (DetailProduct) request.getAttribute("detailProduct");
    Product product = detailProduct.getProduct();
    BoSuaTap bst = detailProduct.getBoSuaTap();
    List<Product> listRelateds = detailProduct.getRelated();
    double oleSale=product.getSell();

%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail.css">

<script>

</script>
<div class="container" >
<section class="detail">
    <div class="detail__image">
        <div id="image__right" <%if(product.getListUrlImg().size()==1){%>style="width: 85%"<%}%>>

            <div id="image__right__element">
                <img id="image__right__element--img"
                     src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>">
            </div>
            <div class="img-zoom-lens">
            </div>
            <div class="img-zoom-result">
            </div>
        </div>

        <div id="image__left"  <%if(product.getListUrlImg().size()==1){%>style="display: none"<%}%>>
            <ul class="image__left__list">

                <%for (int i = 0; i < product.getListUrlImg().size(); i++) {%>
                <li class="image__left__item">
                    <img onclick="leftToRightSupport(this);imageZoom();"
                         class="image__left__element"
                         src="<%=request.getContextPath()%><%=product.getListUrlImg().get(i)%>">
                </li>
                <%}%>

            </ul>
            <div class="up text-center" onclick="changeImage(-1,<%=product.getListUrlImg().size()%>)"><i
                    class="fas fa-angle-up"></i></div>
            <div class="down text-center" onclick="changeImage(1,<%=product.getListUrlImg().size()%>)"><i
                    class="fas fa-angle-down"></i></div>
        </div>


    </div>
    <div class="detail__infor">
        <div class="infor__head">
            <div class="product__title">
                <h1><%=product.getTenSP() + " " + product.getMaSP()%>
                </h1>
            </div>

        </div>
        <div class="infor__body">
            <div class="product__price">
                <c:choose>
                    <c:when test="<%=product.getSell()>0%>">
                            <span class="product__price__sale">
                               <%=ProductManager.getInstance().formatPrice(product.getGia() - (product.getGia() * product.getSell()))%>₫
                            </span>
                        <div class="product__price-origin">
                              <s>  <%=ProductManager.getInstance().formatPrice(product.getGia())%>₫</s>
                        </div>
                        <div class='product__percent__sale' >
                            <span><%=product.getSell() * 100%>%</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                            <span class="product__price__sale" style="color: #000">
                                <%=ProductManager.getInstance().formatPrice(product.getGia())%>₫
                            </span>
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
                                <%if (product.getS() > 0) {%>
                                <label class="text-center label__size" >
                                    <strong>S</strong>
                                    <img class="sold-out-image select-image"
                                         src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                </label>
                                <%} else {%>
                                <label class="text-center label__size" >
                                    <strong>S</strong>
                                    <img class="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png"
                                         alt="">
                                </label>
                                <%}%>

                                <%if (product.getM() > 0) {%>
                                <label class="text-center label__size" >
                                    <strong>M</strong>
                                    <img class="sold-out-image select-image"
                                         src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                </label>
                                <%} else {%>
                                <label class="text-center label__size" >
                                    <strong>M</strong>
                                    <img class="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png"
                                         alt="">
                                </label>
                                <%}%>
                                <%if (product.getL() > 0) {%>
                                <label class="text-center label__size" >
                                    <strong>L</strong>
                                    <img class="sold-out-image select-image"
                                         src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                </label>
                                <%} else {%>
                                <label class="text-center label__size" >
                                    <strong>L</strong>
                                    <img class="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png"
                                         alt="">
                                </label>
                                <%}%>
                                <%if (product.getXL() > 0) {%>
                                <label class="text-center label__size" >
                                    <strong>XL</strong>
                                    <img class="sold-out-image select-image"
                                         src="<%=request.getContextPath()%>/img/icon/select.png" alt="">
                                </label>
                                <%} else {%>
                                <label class="text-center label__size" >
                                    <strong>XL</strong>
                                    <img class="sold-out-image" src="<%=request.getContextPath()%>/img/icon/soldout.png"
                                         alt="">
                                </label>
                                <%}%>

                            </div>
                        </div>

                    </div>

                    <div class="product__color">
                        <div class="product__header">
                            Màu sắc

                        </div>
                        <div class="product__color__elements action-flex">
                            <%
                                StringTokenizer sk = new StringTokenizer(product.getMau(), ",");
                                while (sk.hasMoreTokens()) {
                            %>
                            <label class="text-center"><%=sk.nextToken()%>
                            </label>
                            <%}%>
                        </div>

                    </div>


                    <div class="infor__footer">
                        <div class="add-cart text-center">
                            <button class="add-cart__button" onclick="activeForm();">THÊM VÀO GIỎ</button>
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
                <p><strong><%=bst.getName()%>
                </strong></p>
                <p><%=bst.getMota()%>
                </p>
                <%if(product.getMoTa()!=null){%>
                <p><%=product.getMoTa()%>
                </p>
                <%}%>
            </div>
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
                            <div class="wrap__element__image"><img
                                    src="<%=request.getContextPath()%>/${item.listUrlImg.get(0)}" alt="">
                                <div class="clear-fix">
                                    <a href="/Shopping/detail?id=${item.maSP}"
                                       class="detail__link"></a>
                                    <div class="advise-box">
                                        <a href="" class="advise__button text-center">TƯ VẤN</a>
                                    </div>
                                </div>
                                <c:choose>
                                    <c:when test="${item.m+item.s+item.l+item.XL==0}">
                                        <c:if test="${item.sell>0}">
                                            <div class="wrap__sale-off text-center">
                                                    ${item.sell*100}%
                                            </div>
                                        </c:if>

                                        <div class="wrap__sold-out text-center">STORE ONLY</div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${item.sell>0}">
                                            <div class="wrap__sale-off text-center"
                                                 style="right:50%; transform:translateX(50%);">${item.sell*100}%
                                            </div>
                                        </c:if>

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

                                          <%=ProductManager.getInstance().formatPrice(product.getGia() - (product.getGia() * product.getSell()))%>₫

                                        </span>
                                        <span class="origin-price">
                                      <s>  <%=ProductManager.getInstance().formatPrice(product.getGia())%>₫</s>

                        </span>
                                    </c:when>
                                    <c:otherwise>
                                      <span class="curren-price" style="color: #000">

                                <%=ProductManager.getInstance().formatPrice(product.getGia())%>₫

                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </c:forEach>
                </div>
                <div class="wrap-left-slide text-center" onclick="transition(-1,<%=listRelateds.size()%>)"><i
                        class="fas fa-angle-left"></i></div>
                <div class="wrap-right-slide text-center" onclick="transition(1,<%=listRelateds.size()%>)"><i
                        class="fas fa-angle-right"></i></div>
            </ul>
        </div>
    </div>
</section>
</div>
<div class="form">
    <div class="form__content">
        <div class="delete-form" onclick="closeForm()">
            <i class="fas fa-times-circle"></i>
        </div>
        <div class="form__title"><h3>Giỏ hàng của bạn (Đang có 0 sản phẩm)</h3></div>
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
                <tbody class="row-product">


                </tbody>

            </table>
        </div>
        <div class="form__footer">
            <div class="form__footer__left">
                <a href="" class="return-shop">
                    <i class="fas fa-reply"></i>
                    Tiếp tục mua hàng
                </a>
            </div>
            <div class="form__footer__right">

            </div>
        </div>
    </div>
</div>
<!-- code html cho form thêm hàng -->
<script src="<%=request.getContextPath()%>/script/detail.js"></script>

<script>

    //click text-center add active
    let form = document.querySelector(".form")
    let arrNumber;
    document.querySelectorAll('.label__size').forEach(function (item) {
        item.addEventListener('click', function () {
            item.classList.toggle('active');
        })
    })
    let listSelect=document.querySelectorAll(".label__size");
    function activeForm() {
        if (checkSelect(listSelect)) {
            var array = document.querySelectorAll(".select-image");
            var arrSize = [];
            $('.row-product').html('');
            var sizegioHang = document.querySelector(".cart-count.color-red").innerHTML;
            let totalNumber=2;
            $('.form__title h3').text('GIỎ HÀNG CỦA BẠN (ĐANG CÓ '+sizegioHang+' SẢN PHẨM)');
            for (var i = 0; i < array.length; i++) {
                var parent = array[i].closest('.text-center');
                if (parent.classList.contains('active')) {
                    var size = parent.querySelector("strong").innerHTML;
                    arrSize.push(size);
                    var input = '';
                    if (size === 'S') {
                        input = '<input class="quantity" type="number" min="1" value ="1" max="<%=product.getS()%>">';
                    }
                    if (size === 'M') {
                        input = '<input  class="quantity" type="number" min="1" value ="1" max="<%=product.getM()%>">';

                    }
                    if (size === 'L') {
                        input = '<input class="quantity" type="number" min="1" value ="1" max="<%=product.getL()%>">';

                    }
                    if (size === 'XL') {
                        input = '<input class="quantity" type="number" min="1" value ="1" max="<%=product.getXL()%>">';

                    }

                    $('.row-product').append('<tr >' +
                        '<td class="table__image-decription"><a href=""><img' +
                        ' src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" alt=""></a></td>' +
                        '<td class="table__infor-decription ">' +
                        '<a href="" class="bold-text"><h5><%=product.getTenSP()+" "+product.getMaSP()%></h5></a> <br>' +
                        '<span class = "size-product" size = "' + size + '">Phiên bản: Size ' + size + ' <%=product.getMau()%> </span><br>' +
                        '<span>Bộ sưu tập: <%=bst.getName()%></span></td>' +
                        '<td class="table__price-bill bold-text"><%=ProductManager.getInstance().formatPrice(product.getGia()-product.getGia()*product.getSell())%>₫</td>' +
                        '<td class="table__amount">' + input + '</td>' +
                        '<td class="table__price bold-text">' + convertPrice((<%=product.getGia()-product.getGia()*product.getSell()%>)) + '</td>' +
                        '<td class="table__delete-element"><i class="fas fa-trash-alt"></i></td>' +
                        '</tr>');

                }


            }
            arrNumber = document.querySelectorAll('.quantity')
            totalNumber = arrNumber.length
            let footerTable = document.querySelector('.form__footer__right');


            footerTable.innerHTML = ` <div class="summary-price"><h3>
TỔNG: ` + convertPrice(arrNumber.length * (<%=product.getGia()-product.getGia()*product.getSell()%>)) + `</h3></div>
                <div class="save-price">Tiết kiệm: ` + convertPrice(arrNumber.length * (<%=product.getGia()*product.getSell()%>)) + `</div>
                <button class="update-cart">CẬP NHẬT GIỎ HÀNG</button>

                <a href="" class="pay-button">TIẾN HÀNH THANH TOÁN</a>`
            let form = document.querySelector(".form")

            form.firstElementChild.style.animation = "modalFadeIn  ease-in 0.4s"
            form.classList.add("action-flex")
            $('.quantity').change(function () {
                arrNumber = document.querySelectorAll('.quantity')
                totalNumber = 0;
                for (var i = 0; i < arrNumber.length; i++) {
                    totalNumber += parseInt(arrNumber[i].value)
                }

                $(this).parent().siblings('.table__price.bold-text').text(convertPrice(parseInt(this.value) * (<%=product.getGia()-product.getGia()*product.getSell()%>)))
                $('.summary-price').html(`<h3>TỔNG: ` + convertPrice(totalNumber * (<%=product.getGia()-product.getGia()*product.getSell()%>)) + `</h3>`)

                $('.save-price').text(`Tiết kiệm: ` + convertPrice(totalNumber * (<%=product.getGia()*product.getSell()%>)))
            })
            $('.table__delete-element').click(function () {
                $(this).parent().remove()
                arrNumber = document.querySelectorAll('.quantity')
                totalNumber = 0;
                for (var i = 0; i < arrNumber.length; i++) {
                    totalNumber += parseInt(arrNumber[i].value)
                }
                $('.summary-price').html(`<h3>TỔNG: ` + convertPrice(totalNumber * (<%=product.getGia()-product.getGia()*product.getSell()%>)) + `</h3>`)

                $('.save-price').text(`Tiết kiệm: ` + convertPrice(totalNumber * (<%=product.getGia()*product.getSell()%>)))

            })
        }

        //click cap nhat gio hang
        $('.update-cart').click(function () {
            let arrNumber = document.querySelectorAll('.size-product');
            let arrQuantity = document.querySelectorAll('.quantity');
            var arrayQuantity = []
            //get attribute size
            let arrSize = [];
            for (var i = 0; i < arrNumber.length; i++) {
                arrSize.push(arrNumber[i].getAttribute('size'));
            }
            //get quantity
            for (var i = 0; i < arrQuantity.length; i++) {
                arrayQuantity.push(arrQuantity[i].value)
            }
            addCart(arrSize, arrayQuantity);


        })

    }
        function closeForm() {

        if (form.classList.contains("action-flex")) {
            form.firstElementChild.style.animation = "modalFadeOut ease 0.4s"
            form.classList.remove("action-flex")
        }}

        function responsive() {

            if (window.innerWidth <= 739) {
                $('#image__right').insertAfter('.product__price')
            } else $('#image__right').insertBefore('#image__left')

        }

        responsive();

        document.getElementsByTagName("BODY")[0].onresize = function () {
            resizeWindow();
            responsive();
        }

        function addCart(arrSize, arrayQuantity) {
            var id = '<%=product.getMaSP()%>';
            //convert array to json
            var size = JSON.stringify(arrSize);
            var quantity = JSON.stringify(arrayQuantity);
            //ajax
            $.ajax({
                url: '<%=request.getContextPath()%>/cart',
                type: 'POST',
                data: {
                    id: id,
                    size: size,
                    quantity: quantity
                },
                success: function (data) {
                    //get json
                    var json = JSON.parse(data);
                    if (json.success === 'true') {
                        $('.cart-count.color-red').text(json.quantity);
                        pushNotify('success', 'thêm vào giỏi hàng thành công', 'Thêm Sản phẩm');
                        closeForm();

                    } else {
                        pushNotify('error', 'thêm vào giỏi hàng thất bại', 'Thêm Sản phẩm');

                    }
                }
            });

        }

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


</script>

