<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.dao.client.ChiTietHoaDon" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="com.example.projectwebshopping.model.admin.Order" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 2/14/2022
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ChiTietHoaDon> orderDetails = (List<ChiTietHoaDon>) request.getAttribute("orderDetails");
    Order order = (Order) request.getAttribute("order");
%>
<html>
<head>
    <title>Chi tiết hóa đơn</title>
    <style>
        body{
            position: relative;
        }
        .title-update {
            color: #88B04B;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-weight: 900;
            font-size: 40px;
            margin-bottom: 10px;
            margin-left: 20%;
        }
        .mess-update {
            color: #404F5E;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-size:20px;
            margin: 0;
        }
        .checkmark {
            color: #9ABC66;
            font-size: 100px;
            line-height: 200px;
            margin-left:55px;
        }
        .card-mode-update {
            background: white;
            padding: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;
            display: inline-block;
            margin:  auto;
        }
        .card-mode-update-parent{
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 100;
            background: rgba(0,0,0,0.5);
            display:flex;
            visibility: hidden;
        }
        #btn-update-suss{
            margin-left: 40%;
            margin-top: 20px;

        }
    </style>
</head>
<body>
<!-- * modal delete -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Hủy đơn hàng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn Hủy đơn hàng này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                <button id="Huy-don-hang" data-dismiss="modal" type="button" class="btn btn-primary bg-danger btn-accept">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<!-- * modal update -->

<div class="modal fade" id="updateModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLongTitle">Xác nhận đơn hàng</h5>
                <button type="button" class="close close-update" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               <input name="so" type="number" placeholder="Số ngày dự kiến" min="0" id="so-ngay-du-kien">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary close-update" data-dismiss="modal">Thoát</button>
                <button  id="btn-xac-nhan" data-dismiss="modal" type="button" class="btn btn-primary  btn-accept close-update">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="card-mode-update-parent">
    <div class="card-mode-update">
        <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
            <i class="checkmark">✓</i>
        </div>
        <h1 class="title-update">Success</h1>
        <p class="mess-update">Cập nhật đơn hàng Thành công!</p>
        <button type="button"  class="btn btn-primary" id="btn-update-suss" data-dismiss="modal">Close</button>
    </div>

</div>
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Chi tiết đơn hàng</h2>
    </div>


    <div class="card">
        <header class="card-header">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                <span>
                  <i class="material-icons md-calendar_today"></i> <b><%=order.getOrderDate()%></b>
                </span> <br>
                    <small class="text-muted">Mã: <%=order.getOrderId()%></small>
                </div>
                <div class="col-lg-6 col-md-6 ms-auto text-md-end">
                    <span class="badge rounded-pill <%=order.getClassTrangThai()%>"><%=order.getTrangThai()%></span>
                    <% if(order.getStatus() == 0){%>
                    <a  class="btn btn-sm btn-light" id="xac-nhan-don-hang" >
                        <i class="material-icons md-edit"></i>  Xác nhận
                    </a>
                    <%}%>
                    <% if(order.getStatus() == 2){%>
                    <a  class="btn btn-sm btn-light" id="giao-hang" >
                        <i class="material-icons md-edit"></i>  Giao Hàng
                    </a>
                    <%}%>
                    <% if(order.getStatus() != 1){%>
                    <a href="#"  data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-sm btn-outline-danger" >
                        <i class="material-icons md-delete_forever"></i>  Hủy
                    </a>
                    <%}%>


                </div>
            </div>
        </header> <!-- card-header end// -->
        <div class="card-body">

            <div class="row mb-5 order-info-wrap">
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                  <span class="icon icon-sm rounded-circle bg-primary-light">
                    <i class="text-primary material-icons md-person"></i>
                  </span>
                        <div class="text">
                            <h6 class="mb-1">Khách hàng</h6>
                            <p class="mb-1">
                                <%=order.getName()%> <br> <%=order.getEmail()%> <br> <%=order.getPhoneNumber()%>
                            </p>
                            <a href="#">Xem thêm</a>
                        </div>
                    </article>
                </div> <!-- col// -->
                <div class="col-md-4">

                </div> <!-- col// -->
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                  <span class="icon icon-sm rounded-circle bg-primary-light">
                    <i class="text-primary material-icons md-place"></i>
                  </span>
                        <div class="text">
                            <h6 class="mb-1">Địa chỉ giao hàng</h6>
                            <p class="mb-1">
                                <%=order.getAddress()%> <br>  <%=order.getPhuongXa()%> <br><%=order.getQuanHuyen()%> <br> <%=order.getTinhTP()%>
                            </p>
                            <a href="#">Xem thêm</a>
                        </div>
                    </article>
                </div> <!-- col// -->
            </div> <!-- row // -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        <table class="table border table-hover table-lg">
                            <thead>
                            <tr>
                                <th width="40%">Sản phẩm</th>
                                <th width="20%">Đơn giá</th>
                                <th width="10%">Số lượng</th>
                                <th width="10%">Size</th>
                                <th width="40%" class="text-end">Thành tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                            for (int i = 0; i < orderDetails.size(); i++) {
                             ChiTietHoaDon cthd = orderDetails.get(i);

                            %>
                            <tr>
                                <td>
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%><%=cthd.getUrlImg()%>" width="40" height="40" class="img-xs" alt="Item">
                                        </div>
                                        <div class="info"> <%=cthd.getName()%>  </div>
                                    </a>
                                </td>
                                <td> <%=ProductManager.getInstance().formatPrice(cthd.getGia())%> đ</td>
                                <td> <%=cthd.getSoLuong()%> </td>
                                <td> <%=cthd.getSize()%> </td>
                                <td class="text-end">  <%=ProductManager.getInstance().formatPrice(cthd.getGia()*cthd.getSoLuong())%> đ </td>
                            </tr>

                            <%}%>

                            </tbody>
                        </table>
                    </div> <!-- table-responsive// -->
                </div>  <!-- col// -->

            </div>
        </div> <!-- card-body end// -->
    </div> <!-- card end// -->



</section> <!-- content-main end// -->
<script>
    var maDonHang = '<%=order.getOrderId()%>';
   var  soNgay = 0;
   var array = '<%=new Gson().toJson(orderDetails)%>';
   var userId = '<%=order.getUserId()%>';

    var xacnhan = document.querySelector('#xac-nhan-don-hang');
    if(xacnhan != null){
        xacnhan.addEventListener('click', function () {

            $('#updateModalCenter').modal('show')

            // sendAjax(2);
        });
    }
    var btnxacnhan = document.querySelector('#btn-xac-nhan');
    if(btnxacnhan != null){
        btnxacnhan.addEventListener('click', function () {
            //get value input
            soNgay = document.querySelector('#so-ngay-du-kien').value;
            if (soNgay.trim() == '') {
                pushNotify('warning','Vui lòng nhập số ngày dự kiến', 'warning' );
                return;
            }
            sendAjax(2);
        });
    }
    var huy = document.querySelector('#huy-don-hang');
    if(huy != null){
        huy.addEventListener('click', function () {
            sendAjax(1);
        });
    }

    var update = document.querySelector('#btn-update-suss');
    if(update != null){
        update.addEventListener('click', function () {
            window.location.href = '<%=request.getContextPath()%>/admin-order-detail?id='+maDonHang;
        });
    }
    var giaoHang = document.querySelector('#giao-hang');
    if(giaoHang != null){
        giaoHang.addEventListener('click', function () {
            sendAjax(3);
        });
    }

    function sendAjax(res){
        //send ajax jquery
        $.ajax({
            url: '<%=request.getContextPath()%>/admin-order-detail',
            type: 'POST',
            data: {
                maDonHang: maDonHang,
                soNgay: soNgay,
                status: res,
                array: array,
                userId: userId
            },
            success: function (data) {
                if (data == 'success') {
                    //set css visible
                     document.querySelector('.card-mode-update-parent').style.visibility = 'visible';
                } else {
                    pushNotify('error', 'Có lỗi xảy ra, vui lòng thử lại sau');
                }
            }
        });

    }

    document.querySelectorAll('.close-update').forEach(function (item) {
        item.addEventListener('click', function () {
            $('#updateModalCenter').modal('hide');
        });
    });
</script>
</body>
</html>
