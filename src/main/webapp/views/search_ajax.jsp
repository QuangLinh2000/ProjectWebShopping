<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="com.example.projectwebshopping.service.client.IHomeService" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %><%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/search.css">
<%--modal css--%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/modal/modal.css">

<%
    List<Product> productList = (List<Product>) request.getAttribute("list_product");

%>
<style>
    .list-tab-content{
        grid-template-columns: repeat(5, 1fr);
    }
</style>
<section id="main-search" class="margin-top-mobile">
    <div class="container">
        <div class="contain">
            <div class="right-contain">
                <div class="top-search-title">
                    <div class="wrapper-search-left">
                        <h2 class="text-search">SEARCH: <%=request.getParameter("txt")%>
                        </h2>
                        <span class="title-sum-product"><%=request.getAttribute("count")%> sản phẩm</span>
                    </div>

                </div>

                <div class="list-tab-content" >
                    <%int temp = 0;%>
                    <%int item = 0;%>
                    <%
                        for (int i = 0; i < productList.size(); i++) {
                            Product product = productList.get(i);
                    %>

                    <%if (item == 0) {%>
                    <div class="slide-collection active">
                        <div class="collection-slide-div">
                            <a href="<%=request.getContextPath()%>/detail?id=<%=product.getMaSP()%>">
                                <img class="collection-slide-image"
                                     src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search" >
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="<%=request.getContextPath()%>/detail?id=<%=product.getMaSP()%>">mua ngay</a>
                                </div>
                                <div class="btn-img-cart" idSP =<%=product.getMaSP()%>  onclick="openModal(this)"
                                     data-product-id="<%=product.getMaSP()%>"
                                     data-product-name="<%=product.getTenSP()%>"
                                     data-product-price="<%=product.getGia()%>"
                                     data-product-img="<%=product.getListUrlImg().get(0)%>"
                                     data-product-sell="<%=product.getSell()%>"
                                     data-product-size-s="<%=product.getS()%>"
                                     data-product-size-l="<%=product.getL()%>"
                                     data-product-size-m="<%=product.getM()%>"
                                     data-product-size-xl="<%=product.getXL()%>"
                                     data-product-color="<%=product.getMau()%>">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                            <%if (product.getSell() > 0) {%>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span><%=(int) (product.getSell() * 100)%>%</span>
                                </div>
                                <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                            </div>
                            <%}%>

                        </div>
                        <div class="list-image-hover">

                            <%int limitImageSmall =5;%>
                            <%for ( int j = 0; j < product.getListUrlImg().size(); j++ ) {%>
                            <% if(j >= limitImageSmall)break;%>
                            <img class="img-item-hov" src="<%=request.getContextPath()%><%=product.getListUrlImg().get(j)%>" alt="">
                            <%}%>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                <%=product.getTenSP()%>
                            </h3>
                            <div>
                                    <span class="slide-collection-price">

                                         <fmt:formatNumber type="number"
                                                           maxFractionDigits="3"
                                                           value="<%=(1-product.getSell())*product.getGia()%>"/>đ

                                    </span>
                                <%if (product.getSell() > 0) {%>
                                <span class="current-price">
                                       <fmt:formatNumber type="number"
                                                         maxFractionDigits="3" value="<%=product.getGia()%>"/>đ



                                    </span>
                                <%}%>

                            </div>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="slide-collection item<%=item%>">
                        <div class="collection-slide-div">
                            <a href="<%=request.getContextPath()%>/detail?id=<%=product.getMaSP()%>">
                                <img class="collection-slide-image"
                                     src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="<%=request.getContextPath()%>/detail?id=<%=product.getMaSP()%>">mua ngay</a>
                                </div>
                                <div class="btn-img-cart" idSP =<%=product.getMaSP()%>  onclick="openModal(this)"
                                     data-product-id="<%=product.getMaSP()%>"
                                     data-product-name="<%=product.getTenSP()%>"
                                     data-product-price="<%=product.getGia()%>"
                                     data-product-img="<%=product.getListUrlImg().get(0)%>"
                                     data-product-sell="<%=product.getSell()%>"
                                     data-product-size-s="<%=product.getS()%>"
                                     data-product-size-l="<%=product.getL()%>"
                                     data-product-size-m="<%=product.getM()%>"
                                     data-product-size-xl="<%=product.getXL()%>"
                                     data-product-color="<%=product.getMau()%>">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </div>
                            </div>
                            <%if (product.getSell() > 0) {%>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span><%=(int) (product.getSell() * 100)%>%</span>
                                </div>
                                <img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">
                            </div>
                            <%}%>

                        </div>
                        <div class="list-image-hover">

                            <%int limitImageSmall =5;%>
                            <%for ( int j = 0; j < product.getListUrlImg().size(); j++ ) {%>
                            <% if(j >= limitImageSmall)break;%>
                            <img class="img-item-hov" src="<%=request.getContextPath()%><%=product.getListUrlImg().get(j)%>" alt="">
                            <%}%>
                        </div>
                        <div class="text-content-collection">
                            <h3 class="slide-collection-title">
                                <%=product.getTenSP()%>
                            </h3>
                            <div>
                                     <span class="slide-collection-price">

                                         <fmt:formatNumber type="number"
                                                           maxFractionDigits="3"
                                                           value="<%=(1-product.getSell())*product.getGia()%>"/>đ

                                    </span>
                                <%if (product.getSell() > 0) {%>
                                <span class="current-price">
                                       <fmt:formatNumber type="number"
                                                         maxFractionDigits="3" value="<%=product.getGia()%>"/>đ


                                    </span>
                                <%}%>

                            </div>
                        </div>
                    </div>
                    <%}%>
                    <%
                            temp++;
                            if (temp == 12) {
                                temp = 0;
                                item++;
                            }
                        }%>

                </div>
                <div class="div-btn-tab">
                    <a class="btn btn-tab" id="btn-load-more">xem thêm</a>
                </div>
            </div>
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
<script src="<%=request.getContextPath()%>/script/search.js"></script>
<script>


    var listProduct = <%=new Gson().toJson(productList)%>;
    var countShow = listProduct.length;
    $(document).ready(function () {


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
            position: 'right top',
            customWrapper: '',
        })
    }

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

    //----------click add cart --------------
    //click add cart jquery
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
            pushNotify('warning','Vui lòng chọn size','chọn size');
            return;
        }
        addCart( arrSize);

    });

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
                    pushNotify('success','thêm vào giỏi hàng thành công','Thêm Sản phẩm');

                } else {
                    pushNotify('error','thêm vào giỏi hàng thất bại','Thêm Sản phẩm');

                }
            }
        });
    }
    var txt = "<%=request.getParameter("txt")%>";
    // click load more product ajax

    $('#btn-load-more').click(function () {
        let offset = $('.slide-collection').length;
        // console.log(offset);

        $.ajax({
            url: '<%=request.getContextPath()%>/searchAjax',
            type: 'POST',
            data: {
                type: "SEARCHLOADMORE",
                txtSearch: txt,
                offset: offset,
                limit: 10
            },
            success: function (data) {
                if (data!==null && data.length > 0) {
                    //data to html
                    for (var i = 0; i < data.length; i++) {
                        var product = data[i];
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
                        $('.list-tab-content').append('<div class="slide-collection active">' +
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
                    const listImageHover = document.querySelectorAll(".img-item-hov");
                    listImageHover.forEach((element) => {
                        element.addEventListener("mouseover", () => {
                            element
                                .closest(".slide-collection")
                                .querySelector(".collection-slide-image").src = element.src;
                        });
                    });
                    if ((offset+data.length )>=<%=request.getAttribute("count")%>) {
                        $('#btn-load-more').hide();
                    }
                }
            }
        });
    });



</script>
