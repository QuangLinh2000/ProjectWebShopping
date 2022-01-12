<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> productList =(List<Product>) request.getAttribute("products");
    List<LoaiSP> loaiSPS = (List<LoaiSP>) request.getAttribute("loaiSPs");
    int totalPage = (int) request.getAttribute("total");

%>
<html>
<head>
    <title>Xem dạng danh sách</title>
</head>
<body>
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Danh sách sản phẩm </h2>
        <div>
            <a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Tạo mới</a>
        </div>
    </div>

    <div class="card mb-4">
        <header class="card-header">
            <div class="row align-items-center">
                <div class="col col-check flex-grow-0">
                    <div class="form-check ms-2">
                        <input class="form-check-input" type="checkbox" value="">
                    </div>
                </div>
                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                    <select id="loai-product" class="form-select">
                        <option>Loại</option>
                        <%for (int i = 0; i < loaiSPS.size(); i++) {
                            LoaiSP loaiSP = loaiSPS.get(i);
                        %>
                        <option value="<%=loaiSP.getMaLoai()%>"><%=loaiSP.getTenLoai()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="col-md-2 col-6" style="padding: 0 2px;">
                    <input id="filter-date" type="date" class="form-control">
                </div>
                <div class="col-md-2 col-6">
                    <select id="status-product" class="form-select">
                        <option value="-1">Trạng thái</option>
                        <option value="1">Còn hàng</option>
                        <option value="0">Hết hàng</option>
                        <option value="2">Tạm ngừng</option>
                        <option value="-1">Hiện tất cả</option>
                    </select>
                </div>
            </div>
        </header> <!-- card-header end// -->

        <div id="list-product" class="card-body">
            <%for (int i = 0; i < productList.size();i++){
                Product product = productList.get(i);
                Date ngayNhap = product.getNayNhap();
            %>
                <article class="itemlist">
                    <div class="row align-items-center">
                        <div class="col col-check flex-grow-0">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox">
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                            <a class="itemside" href="#">
                                <div class="left">
                                    <img src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" class="img-sm img-thumbnail" alt="Item">
                                </div>
                                <div class="info">
                                    <h6 class="mb-0"><%=product.getTenSP()%></h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-2 col-sm-2 col-4 col-price"> <span><%=ProductManager.getInstance().formatPrice(product.getGia()-product.getGia()*product.getSell())%>đ</span> </div>
                        <div class="col-lg-2 col-sm-2 col-4 col-status">
                            <span class="badge rounded-pill <%=product.getClassTrangThai()%>"><%=product.getTrangThaiProduct()%></span>
                        </div>

                        <div class="col-lg-2 col-sm-2 col-4 col-date">
                            <span><%=ngayNhap.getDate()+"/"+(ngayNhap.getMonth()+1)+"/"+(ngayNhap.getYear()+1900)%></span>
                        </div>
                        <div class="col-lg-1 col-sm-2 col-4 col-action">
                            <div class="dropdown float-end">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>">Xem chi tiết</a>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown // -->
                        </div>
                    </div> <!-- row .// -->
                </article>  <!-- itemlist  .// -->


            <%}%>


        </div> <!-- card-body end// -->
    </div> <!-- card end// -->
    <div id="page-index">


        <%if(totalPage > 1){%>

        <nav class="float-end mt-4" aria-label="Page navigation">
            <ul class="pagination">
                <li id="page-item-pre" class="page-item disabled"><a class="page-link" href="#">Trước</a></li>
                <%for (int i = 1; i <= totalPage; i++) {
//                    if (i > 23) {
//                        break;
//                    }
                    if(i == 1){
                %>
                <li class="page-item page-item-child active"><a class="page-link" href="#"><%=i%></a></li>
                <%}else{%>
                <li  class="page-item page-item-child"><a class="page-link" href="#"><%=i%></a></li>

                <%}%>
                <%}%>

                <li id="page-item-next" class="page-item"><a class="page-link" href="#">Sau</a></li>
            </ul>
        </nav>
        <%}%>
    </div>


</section> <!-- content-main end// -->
<script>
      var date;
      var  satus = -1;
      var loai = "Loại";
      var page = 1;
      var total = <%=totalPage%>;
      setNonePageItemChild();
        //event onchange filter-date use dom
        document.getElementById("filter-date").addEventListener("change", function () {
            var value = this.value;
            date = value;
            page = -1;
            sendAjax();
            setNonePageItemChild();

        });
        //event onchange status-product use dom
        document.getElementById("status-product").addEventListener("change", function () {
            var value = this.value;
            satus = value;
            page = -1;
            sendAjax();
            setNonePageItemChild();

        });
        //event onchange  loai-product use dom
       document.getElementById("loai-product").addEventListener("change", function () {
            var value = this.value;
            loai = value;
            page = -1;
           sendAjax();
           setNonePageItemChild();

       });
       clickPage();
      function clickPage() {
          if(total > 1){
              //event onclick page-index use dom
              document.querySelectorAll(".page-item-child").forEach(function (item) {
                  item.addEventListener("click", function () {
                      page = this.innerText;
                      document.querySelectorAll(".page-item").forEach(function (item) {
                          item.classList.remove("active");
                      });
                      this.classList.add("active");
                      if(page == 1) {
                          document.getElementById("page-item-pre").classList.add("disabled");
                          document.getElementById("page-item-next").classList.remove("disabled");
                      }else{
                          if(page == total) {
                              document.getElementById("page-item-next").classList.add("disabled");
                              document.getElementById("page-item-pre").classList.remove("disabled");
                          }else{
                              document.getElementById("page-item-pre").classList.remove("disabled");
                              document.getElementById("page-item-next").classList.remove("disabled");
                          }
                      }

                      sendAjax();
                      setNonePageItemChild();

                  })
              });

              document.getElementById("page-item-pre").addEventListener("click", function () {
                  if (page > 1) {
                      page--;
                      document.querySelectorAll(".page-item").forEach(function (item) {
                          if(item.innerText == page){
                              item.classList.add("active");
                          }else{
                              item.classList.remove("active");

                          }
                          if(page == 1) {
                              document.getElementById("page-item-pre").classList.add("disabled");
                              document.getElementById("page-item-next").classList.remove("disabled");
                          }else{
                              if(page == total) {
                                  document.getElementById("page-item-next").classList.add("disabled");
                                  document.getElementById("page-item-pre").classList.remove("disabled");
                              }else{
                                  document.getElementById("page-item-pre").classList.remove("disabled");
                                  document.getElementById("page-item-next").classList.remove("disabled");
                              }
                          }
                      });
                      sendAjax();
                      setNonePageItemChild();

                  }
              });
              document.getElementById("page-item-next").addEventListener("click", function () {
                  if (page < total) {
                      page++;
                      document.querySelectorAll(".page-item").forEach(function (item) {
                          if(item.innerText == page){
                              item.classList.add("active");
                          }else{
                              item.classList.remove("active");

                          }
                          if(page == 1) {
                              document.getElementById("page-item-pre").classList.add("disabled");
                              document.getElementById("page-item-next").classList.remove("disabled");
                          }else{
                              if(page == total) {
                                  document.getElementById("page-item-next").classList.add("disabled");
                                  document.getElementById("page-item-pre").classList.remove("disabled");
                              }else{
                                  document.getElementById("page-item-pre").classList.remove("disabled");
                                  document.getElementById("page-item-next").classList.remove("disabled");
                              }
                          }
                      });
                      sendAjax();
                      setNonePageItemChild();


                  }
              });
          }



      }
       function sendAjax() {
           // ajax jquery
           $.ajax({
               url: "<%=request.getContextPath()%>/admin-list-view-product",
               type: "POST",
               data: {
                   date: date,
                   status: satus,
                   loai: loai,
                   page: page
               },
               success: function (data) {
                   var totalPage = data.total;
                   var listProduct = data.data;
                   $("#list-product").html("");

                   for (var i = 0; i < listProduct.length; i++) {
                       var product = listProduct[i];
                       $("#list-product").append('<article class="itemlist">' +
                           '<div class="row align-items-center">' +
                           '<div class="col col-check flex-grow-0">' +
                           ' <div class="form-check">' +
                           '<input class="form-check-input" type="checkbox">' +
                           ' </div>' +
                           ' </div>' +
                           '<div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">' +
                           ' <a class="itemside" href="#">' +
                           '  <div class="left">' +
                           '     <img src="<%=request.getContextPath()%>' + product.listUrlImg[0] + '" class="img-sm img-thumbnail" alt="Item">' +
                           '  </div>' +
                           '   <div class="info">' +
                           '       <h6 class="mb-0">' + product.tenSP + '</h6>' +
                           '    </div>' +
                           '  </a>' +
                           '</div>' +
                           '<div class="col-lg-2 col-sm-2 col-4 col-price"> <span>' + formatPrice(product.gia + product.gia * product.sell) + 'đ</span> </div>' +
                           '<div class="col-lg-2 col-sm-2 col-4 col-status">' +
                           ' <span class="badge rounded-pill ' + getClassTrangThai(product.trangThai) + '">' + getTrangThaiProduct(product.trangThai) + '</span>' +
                           '</div>' +

                           '<div class="col-lg-2 col-sm-2 col-4 col-date">' +
                           ' <span>' + formatDate(product.nayNhap) + '</span>' +
                           '</div>' +
                           '<div class="col-lg-1 col-sm-2 col-4 col-action">' +
                           '<div class="dropdown float-end">' +
                           ' <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>' +
                           ' <div class="dropdown-menu">' +
                           '    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '">Xem chi tiết</a>' +
                           '       <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '">Chỉnh sửa</a>' +
                           '    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>' +
                           '    </div>' +
                           '</div> ' +
                           '</div>' +
                           '</div> ' +
                           '</article>');
                   }

                   //pagination
                   if (totalPage != -1){
                       var htmlPagination = '<li id="page-item-pre" class="page-item disabled"><a class="page-link" href="#">Trước</a></li>';
                   for (var i = 1; i <= getPageCount(10,totalPage); i++) {
                       if (i == 1) {
                           htmlPagination += '<li class="page-item page-item-child active"><a class="page-link" href="#">' + i + '</a></li>';
                       } else {
                           htmlPagination += '<li class="page-item page-item-child"><a class="page-link" href="#">' + i + '</a></li>';
                       }
                   }
                   htmlPagination += '<li id="page-item-next"  class="page-item"><a class="page-link" href="#">Sau</a></li>';
                   if(getPageCount(10,totalPage) <= 1) {

                       $('.pagination').html('') ;
                   }else{
                       $('.pagination').html(htmlPagination);

                   }
                       total = getPageCount(10,totalPage);
                       page = 1;
                       clickPage();
                       setNonePageItemChild();

                   }
               }
           });

       }
       //set none page-item-child
       function setNonePageItemChild(){
         var pageItem =  document.getElementsByClassName('page-item-child');
           for (var i = 0; i <pageItem.length; i++) {
               pageItem[i].style.display = 'none';
           }
           var count = 0;
           for (var i = page-1; i < pageItem.length; i++) {
               if(i >= 0){
                   pageItem[i].style.display = 'block';
                   count++;

               }
               if (count >= 5){
                   break;
               }
           }
       }

       //format price
       function formatPrice(price) {
           //cast double to int
           var priceInt = parseInt(price);
           return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
       }
      function getTrangThaiProduct(status) {
          switch (status) {
              case 0:
                  return "Hết hàng";
              case 1:
                  return "Còn hàng";
              case 2:
                  return "Tạm ngừng";
              default:
                  return "";
          }
      }


     function getClassTrangThai(status) {
          switch (status) {
              case 0:
                  return "alert-danger";
              case 1:
                  return "alert-success";
              case 2:
                  return "alert-warning";
              default:
                  return "";
          }
      }
      //format date
      function formatDate(date) {
          var d = new Date(date),
              month = '' + (d.getMonth() + 1),
              day = '' + d.getDate(),
              year = d.getFullYear();

          if (month.length < 2) month = '0' + month;
          if (day.length < 2) day = '0' + day;

          return [day, month, year].join('-');
      }

      function getPageCount( pageSize, sum) {
          if(sum % pageSize == 0) {
              return sum / pageSize;
          }
          return parseInt(sum / pageSize )+ 1;
      }
</script>
</body>

</html>
