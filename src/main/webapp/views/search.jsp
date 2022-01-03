<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="com.example.projectwebshopping.service.client.IHomeService" %><%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/search.css">
<%
    List<Product> productList = (List<Product>) request.getAttribute("list_product");
      int size = (int)request.getAttribute("size");
%>
<section id="main-search" class="margin-top-mobile">
    <div class="container">
        <div class="top-search-title">
            <div class="wrapper-search-left">
                <h2 class="text-search"><%=request.getParameter("name")%></h2>
                <span class="title-sum-product"><%=request.getAttribute("soLuongSP")%> sản phẩm</span>
            </div>

            <div class="right-contain-sort">
                <label for="cars">Sắp Xếp</label>
                <select name="cars" id="cars">
                    <option value="volvo">Tùy chọn</option>
                    <option value="saab">Sản phẩm bán chạy</option>
                    <option value="opel">Sắp xếp từ A-Z</option>
                    <option value="audi">Sắp xếp từ Z-A</option>
                </select>
            </div>
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
                    <%int temp = 0;%>
                    <%int item = 0;%>
                    <%for ( int i = 0; i < productList.size(); i++ ) {
                    Product product = productList.get(i);%>
                    <%if ( item == 0 ) {%>
                    <div class="slide-collection item<%=item%> active">
                        <div class="collection-slide-div">
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" alt="">
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
                            <%if(product.getSell() > 0){%>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span><%=(int)(product.getSell()*100)%>%</span>
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
                                        <%=(1-product.getSell())*product.getGia()%>
                                    </span>
                                <%if(product.getSell() > 0){%>
                                <span class="current-price">
                                        <%=product.getGia()%>
                                    </span>
                                <%}%>

                            </div>
                        </div>
                    </div>
                    <%}else{%>
                    <div class="slide-collection item<%=item%>">
                        <div class="collection-slide-div">
                            <a href="./detail.html">
                                <img class="collection-slide-image" src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" alt="">
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
                            <%if(product.getSell() > 0){%>
                            <div class="colection-tag">
                                <div class="tag-saleoff">
                                    <span><%=(int)(product.getSell()*100)%>%</span>
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
                                        <%=(1-product.getSell())*product.getGia()%>
                                    </span>
                                <%if(product.getSell() > 0){%>
                                <span class="current-price">
                                        <%=product.getGia()%>
                                    </span>
                                <%}%>

                            </div>
                        </div>
                    </div>
                    <%}%>
                    <%
                        temp ++;
                        if(temp == 12) {
                            temp = 0;
                            item++;
                        }
                    }%>

                    <%%>
                    <%%>


                </div>


                <div class="pagination">
                    <a href="#" id=" per-page">&laquo;</a>
                    <%for ( int i = 1; i <= size; i++ ) {
                     if(i == 1){%>
                    <a class="page active item<%=i%>" href="#"><%=i%></a>
                    <%}else{%>
                    <a class="page item<%=i%>" href="#"><%=i%></a>

                    <%}%>
                    <%}%>
                    <a href="#" id="next-page">&raquo;</a>
                </div>
            </div>
        </div>
    </div>

</section>

<script src="<%=request.getContextPath()%>/script/search.js"></script>
<script>
    var indexPage = 1;
    //click class page dom
   var page = document.getElementsByClassName('page');
   for(var i = 0; i < page.length; i++){
       page[i].addEventListener('click', function(){
           indexPage = this.innerHTML;
           loadData(indexPage);
           $('.page').removeClass('active');
           $(this).addClass('active');
       });
   }
   function loadData(indexPage) {
       $('.slide-collection').removeClass('active');
       $('.slide-collection.item'+ (indexPage-1)).addClass('active');
   }
   //click next page
    document.getElementById('next-page').addEventListener('click', function(){
        if(indexPage < <%=size%>){
            indexPage++;
            loadData(indexPage);
            $('.page').removeClass('active');
            $('.page.item'+indexPage).addClass('active');
        }
    });
    //click per page
    document.getElementById('per-page').addEventListener('click', function(){
        if(indexPage > 1){
            indexPage--;
            loadData(indexPage);
            $('.page').removeClass('active');
            $('.page.item'+indexPage).addClass('active');
        }
    });
    $(document).ready(function () {
        //click next page
        $('#next-page').click(function(){
            console.log("ok")
            if(indexPage < <%=size%>){
                indexPage++;
                loadData(indexPage);
                $('.page').removeClass('active');
                $('.page.item'+ (indexPage-1)).addClass('active');
            }
        });
        //click per page
        $('#per-page').click(function(){
            if(indexPage > 1){
                indexPage--;
                loadData(indexPage);
                $('.page').removeClass('active');
                $('.page.item'+ (indexPage-1)).addClass('active');
            }
        });
    });


</script>

