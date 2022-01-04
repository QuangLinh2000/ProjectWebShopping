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
    int size = (int) request.getAttribute("size");

%>
<section id="main-search" class="margin-top-mobile">
    <div class="container">
        <div class="contain">
            <div class="left-contain">
                <div class="left-contain-price-range">
                    <p class="left-contain-item-title">Khoảng Giá</p>
                    <form name="myForm" class="left-contain-item-box-content">
                        <input type="radio" name="all" value="0">
                        <label> Tất Cả</label><br>
                        <input type="radio" name="all" value="0-300000">
                        <label> Nhỏ hơn 300,000₫</label><br>
                        <input type="radio" name="all" value="300000-500000">
                        <label>Từ 300,000₫ - 500,000₫</label><br>
                        <input type="radio" name="all" value="500000-700000">
                        <label> Từ 500,000₫ - 700,000₫</label><br>
                        <input type="radio" name="all" value="700000-1000000">
                        <label> Từ 700,000₫ - 1,000,000₫</label><br>
                        <input type="radio" name="all" value="1000000-1500000">
                        <label> Từ 1,000,000₫ - 1,500,000₫</label><br>
                        <input type="radio" name="all" value="1500000">
                        <label> Lớn hơn 1,500,000₫</label><br>
                    </form>
                </div>
                <div class="left-contain-size">
                    <p class="left-contain-item-title">Kích Thước</p>
                    <div class="left-contain-item-box-content-size">
                        <div class="left-contain-item-box-content-size-item">
                            <input class="size-product" type="checkbox" name="size" value="S">
                            <label>S</label><br>
                        </div>
                        <div class="left-contain-item-box-content-size-item">
                            <input class="size-product" type="checkbox" name="size" value="M">
                            <label>M</label><br>
                        </div>
                        <div class="left-contain-item-box-content-size-item">
                            <input class="size-product" type="checkbox" name="size" value="L">
                            <label>L</label><br>
                        </div>
                        <div  class="left-contain-item-box-content-size-item">
                            <input class="size-product" type="checkbox" name="size" value="XL">
                            <label>XL</label><br>
                        </div>
                    </div>
                </div>
                <div class="left-contain-color">
                    <p class="left-contain-item-title">Màu Sắc</p>
                    <div class="left-contain-item-box-content-color">
                        <%
                            List<String> listColor = ProductManager.getInstance().getColor(productList);
                            for (int i = 0; i <listColor.size();i++ ){%>
                        <div class="left-contain-item-box-content-color-item">
                            <input class="color-check" type="checkbox" name="color" value="<%=listColor.get(i)%>">
                            <p ><%=listColor.get(i)%></p><br>
                        </div>

                        <%}%>
                        <%%>

                    </div>
                </div>
            </div>

            <div class="right-contain">
                <div class="top-search-title">
                    <div class="wrapper-search-left">
                        <h2 class="text-search"><%=request.getParameter("name")%>
                        </h2>
                        <span class="title-sum-product"><%=request.getAttribute("soLuongSP")%> sản phẩm</span>
                    </div>

                    <div class="right-contain-sort">
                        <label for="cars">Sắp Xếp</label>
                        <select name="cars" id="cars">
                            <option value="0">Tùy chọn</option>
                            <option value="1">Sắp xếp từ A-Z</option>
                            <option value="2">Sắp xếp từ Z-A</option>
                            <option value="3">Sắp xếp theo giá tăng dần</option>
                            <option value="4">Sắp xếp theo giá giảm dần</option>
                        </select>
                    </div>
                </div>

                <div class="list-tab-content">
                    <%int temp = 0;%>
                    <%int item = 0;%>
                    <%
                        for (int i = 0; i < productList.size(); i++) {
                            Product product = productList.get(i);
                    %>

                    <%if (item == 0) {%>
                    <div class="slide-collection item<%=item%> active">
                        <div class="collection-slide-div">
                            <a href="<%=request.getContextPath()%>/detail?id=<%=product.getMaSP()%>">
                                <img class="collection-slide-image"
                                     src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" alt="">
                            </a>
                            <div class="btn-img">
                                <div class="btn-img-search" onclick="openModal()">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="btn-img-buy">
                                    <a href="<%=request.getContextPath()%>/detail?id=<%=product.getMaSP()%>">mua ngay</a>
                                </div>
                                <div class="btn-img-cart" idSP =<%=product.getMaSP()%>>
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
                                <div class="btn-img-cart" idSP =<%=product.getMaSP()%>>
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


                <div class="pagination">
                    <a href="#" id="per-page">&laquo;</a>
                    <div class="page-parrent">
                        <%
                            for (int i = 1; i <= size; i++) {
                                if (i == 1) {
                        %>
                        <a class="page active item<%=i%>" href="#"><%=i%>
                        </a>
                        <%} else {%>
                        <a class="page item<%=i%>" href="#"><%=i%>
                        </a>

                        <%}%>
                        <%}%>
                    </div>

                    <a href="#" id="next-page">&raquo;</a>
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
                <img class="modal-img" src="../img/collection1_slide_product_1.jpg" alt="">

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
                        <li class="product-list-size">S(4)</li>
                        <li class="product-list-size">M(4)</li>
                        <li class="product-list-size">L(4)</li>
                        <li class="product-list-size">XS(4)</li>
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
    var xapSep = 0;
    var khoangGia = '0';
    var arrColor = [];
    var sizeProduct =[];

    var indexPage = 1;
    //click class page dom
    var page = document.getElementsByClassName('page');
    for (var i = 0; i < page.length; i++) {
        page[i].addEventListener('click', function () {
            indexPage = this.innerHTML;
            loadData(indexPage);
            $('.page').removeClass('active');
            $(this).addClass('active');
        });
    }
    function loadData(indexPage) {
        $('.slide-collection').removeClass('active');
        $('.slide-collection.item' + (indexPage - 1)).addClass('active');
    }

    $(document).ready(function () {
        //click next page
        $('#next-page').click(function () {
            if (indexPage < <%=size%>) {
                indexPage++;
                loadData(indexPage);
                $('.page').removeClass('active');
                $('.page.item' + (indexPage )).addClass('active');
            }
        });
        //click per page
        $('#per-page').click(function () {
            if (indexPage > 1) {
                indexPage--;
                loadData(indexPage);
                $('.page').removeClass('active');
                $('.page.item' + (indexPage)).addClass('active');
            }
        });

        $('#cars').change(function () {
            xapSep = $(this).val();

                sortProduct();



        });

        //radio button
        var rad = document.myForm.all;
        for (var i = 0; i < rad.length; i++) {
            rad[i].addEventListener('change', function() {
                khoangGia = this.value;
                sortProduct();
            });
        }

        //click color-check chekcbox change

        $(".color-check").change(function() {
           var color =  document.getElementsByClassName('color-check');
            var colorCheck = [];
            for (var i = 0; i < color.length; i++) {
                if (color[i].checked) {
                    colorCheck.push(color[i].value);
                }
            }
            arrColor = colorCheck;
            sortProduct();
        });


        $(".size-product").change(function() {
            var color =  document.getElementsByClassName('size-product');
            var colorCheck = [];
            for (var i = 0; i < color.length; i++) {
                if (color[i].checked) {
                    colorCheck.push(color[i].value);
                }
            }
            sizeProduct = colorCheck;
            sortProduct();
        });

        addCart();


    });



    function sortProduct() {
        $('.list-tab-content').html('');
        $('.page-parrent').html('');

        indexPage = 1;


         var listProduct;
         switch (xapSep) {
               case '0':
                   listProduct = <%=new Gson().toJson(productList)%>
                   break;
             case '1':
                 listProduct = <%=new Gson().toJson(ProductManager.getInstance().sortByNameAZ(productList))%>
                 break;
             case '2':
                 listProduct = <%=new Gson().toJson(ProductManager.getInstance().sortByNameZA(productList))%>
                 break;
             case '3':
                 listProduct = <%=new Gson().toJson(ProductManager.getInstance().sortByPriceTC(productList))%>
                 break;
             case '4':
                 listProduct = <%=new Gson().toJson(ProductManager.getInstance().sortByPriceCT(productList))%>
                 break;
                 default:
                     listProduct = <%=new Gson().toJson(productList)%>
                     break;
         }
         var arrKhoangGia = khoangGia.split('-');

         if(arrKhoangGia.length == 1){
             if(arrKhoangGia[0] !== '0'){
                 listProduct = khoangGiaProduct(min,-1,listProduct);

             }
         }else{
             var min = arrKhoangGia[0];
             var max = arrKhoangGia[1];
             listProduct = khoangGiaProduct(min,max,listProduct);
         }

         // lọc màu sắc
         if(arrColor.length > 0){
            listProduct = filterColor(listProduct,arrColor);
         }

         if(sizeProduct.length > 0){

             listProduct = filterSize(listProduct,sizeProduct);
         }

         var item = 0;
         var temp = 0;
         for (var i = 0; i < listProduct.length; i++) {
             var product = listProduct[i];
             var  iconsell = '';
             var giaCu = '';

             if(product.sell > 0){
                 iconsell ='<div class="colection-tag">'+
                 '<div class="tag-saleoff">'+
                 '<span>'+(product.sell*100)+'%</span>'+
                 '</div>'+
                 '<img src="<%=request.getContextPath()%>/img/img-sale.png" alt="" class="img-sale">'+
                 '</div>';
                 giaCu =  '<span class="current-price">'+
                     formatNumber(product.gia)+
                     'đ</span>';
             }
             var iconHover = '';
             var  count = 0;
             for (var j = 0; j < product.listUrlImg.length; j++) {
                 var image = product.listUrlImg[j];
                     iconHover += '<img src="<%=request.getContextPath()%>'+image+'" alt="" class="img-item-hov">';
                     count++;
                     if(count >= 5){
                         break;
                     }
             }

             var  price = formatNumber((product.gia - product.sell*product.gia))+'đ';

              if(item == 0){
                  $('.list-tab-content').append('<div class="slide-collection item'+item+' active">'+
                      '<div class="collection-slide-div">'+
                      '<a href="<%=request.getContextPath()%>/detail?id='+product.maSP+'">'+
                      '<img class="collection-slide-image"'+
                      'src="<%=request.getContextPath()%>'+product.listUrlImg[0]+'" alt="">'+
                      '</a>'+
                      '<div class="btn-img">'+
                      '<div class="btn-img-search">'+
                      '<i class="fa-solid fa-magnifying-glass"></i>'+
                      '</div>'+
                      '<div class="btn-img-buy">'+
                      '<a href="<%=request.getContextPath()%>/detail?id='+product.maSP+'">mua ngay</a>'+
                      '</div>'+
                      '<div class="btn-img-cart" idSP ="'+product.maSP+'">'+
                      '<i class="fa-solid fa-cart-shopping"></i>'+
                      '</div>'+
                      '</div>'+ iconsell+
                      '</div>'+
                      '<div class="list-image-hover">'+ iconHover+
                      '</div>'+
                      '<div class="text-content-collection">'+
                      '<h3 class="slide-collection-title">'+
                      product.tenSP+
                      '</h3>'+
                      '<div>'+
                      '<span class="slide-collection-price">'+price+
                      '</span>'+
                      giaCu+
                      '</div>'+
                      '</div>'+
                      '</div>');

              }else{
                  $('.list-tab-content').append('<div class="slide-collection item'+item+'">'+
                      '<div class="collection-slide-div">'+
                      '<a href="<%=request.getContextPath()%>/detail?id='+product.maSP+'">'+
                      '<img class="collection-slide-image"'+
                      'src="<%=request.getContextPath()%>'+product.listUrlImg[0]+'" alt="">'+
                      '</a>'+
                      '<div class="btn-img">'+
                      '<div class="btn-img-search">'+
                      '<i class="fa-solid fa-magnifying-glass"></i>'+
                      '</div>'+
                      '<div class="btn-img-buy">'+
                      '<a href="<%=request.getContextPath()%>/detail?id='+product.maSP+'">mua ngay</a>'+
                      '</div>'+
                      '<div class="btn-img-cart" idSP ="'+product.maSP+'">'+
                      '<i class="fa-solid fa-cart-shopping"></i>'+
                      '</div>'+
                      '</div>'+ iconsell+
                      '</div>'+
                      '<div class="list-image-hover">'+ iconHover+
                      '</div>'+
                      '<div class="text-content-collection">'+
                      '<h3 class="slide-collection-title">'+
                      product.tenSP+
                      '</h3>'+
                      '<div>'+
                      '<span class="slide-collection-price">'+price+
                      '</span>'+
                      giaCu+
                      '</div>'+
                      '</div>'+
                      '</div>');

              }



             temp++;
             if (temp == 12) {
                 temp = 0;
                 item++;
             }

         }
         // ---------------phan trang-----------------
         var size = listProduct.length%12 == 0 ? listProduct.length/12 : listProduct.length/12 + 1;
         for (var i = 1; i <= size; i++) {
             if(i == 1){
                 $('.page-parrent').append('<a href="#" class="page active item' + i + '">' + i + '</a>');

             }else{
                 $('.page-parrent').append('<a href="#" class="page  item' + i + '">' + i + '</a>');

             }
         }
         // ---------------phan trang-----------------


        const listImageHover = document.querySelectorAll(".img-item-hov");
        listImageHover.forEach((element) => {
            element.addEventListener("mouseover", () => {
                element
                    .closest(".slide-collection")
                    .querySelector(".collection-slide-image").src = element.src;
            });
        });
        $('.title-sum-product').text(listProduct.length+' sản phẩm');
        addCart();
        var page = document.getElementsByClassName('page');
        for (var i = 0; i < page.length; i++) {
            page[i].addEventListener('click', function () {
                indexPage = this.innerHTML;
                loadData(indexPage);
                $('.page').removeClass('active');
                $(this).addClass('active');
            });
        }

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
    function addCart(){
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

    }
    function khoangGiaProduct(min,max,arr) {
        var result = [];
        if(max == -1){
            for(var i = 0; i < arr.length; i++){
                var product = arr[i];
                var gia = product.gia - product.sell*product.gia;

                if(gia>= min ){
                    result.push(product);
                }
            }
            return result;
        }else{
            for(var i = 0; i < arr.length; i++){
                var product = arr[i];
                var gia = product.gia - product.sell*product.gia;
                if(gia >= min && gia <= max){
                    result.push(product);
                }
            }
            return result;
        }


    }

    //lọc màu
    function filterColor(arr,colors) {
        var result = [];
        for(var i = 0; i < arr.length; i++){
            var product = arr[i];
            if(colors.indexOf(product.mau) != -1){
                result.push(product);
            }
        }
        return result;
    }

    //filter size
    function filterSize(arrProduct,arrSize) {
        var result = [];
        for(var i = 0; i < arrProduct.length; i++){
            var product = arrProduct[i];
            var S = product.S;
            var M = product.M;
            var L = product.L;
            var XL = product.XL;
            if((arrSize.indexOf('S') != -1 && S > 0 ) ||
                (arrSize.indexOf('M') != -1 && M > 0 ) ||
                (arrSize.indexOf('L') != -1 && L > 0 ) ||
                (arrSize.indexOf('XL') != -1 && XL > 0 )){
                result.push(product);
            }
        }
        return result;
    }
  //format mony đ

    function formatNumber(num) {
        //convert double to int
        num =parseInt(num);
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
    }

    //modal close dom
    const modalCart = document.getElementById('modal-cart');
    function closeModal() {
        modalCart.style.display = "none";
    }
    function openModal() {
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
        function openModal() {
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
    }



</script>

