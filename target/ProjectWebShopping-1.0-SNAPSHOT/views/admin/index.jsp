<%@ page import="com.example.projectwebshopping.dao.client.HoaDonDao" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="com.example.projectwebshopping.model.admin.Order" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 9:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    double tongDoanhThu = (double) request.getAttribute("tongDoanhThu");
    int tongSoHoaDon = (int) request.getAttribute("tongSoHoaDon");
    int tongSoSanPham = (int) request.getAttribute("tongSoSanPham");
    int tongSoKhachHang = (int) request.getAttribute("tongSoKhachHang");
    List<Product> listProduct = (List<Product>) request.getAttribute("listSPBanChay");
    List<Order> listOrder = (List<Order>) request.getAttribute("listOder");
%>
<html>
<head>
    <title>Bảng điều khiển</title>
</head>
<body>
<section class="content-main">
    <div class="content-header">
        <h2 class="content-title"> Bảng điều khiển </h2>
        <div>
            <a href="#" class="btn btn-primary">Tạo báo cáo</a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-primary-light"><i class="text-primary material-icons md-monetization_on"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng doanh thu</h6>  <span><%=ProductManager.getInstance().formatPrice(tongDoanhThu)%>đ</span>
                    </div>
                </article>

            </div> <!-- card  end// -->
        </div> <!-- col end// -->
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-success-light"><i class="text-success material-icons md-local_shipping"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng đơn hàng</h6> <span><%=ProductManager.getInstance().formatPrice(tongSoHoaDon)%></span>
                    </div>
                </article>
            </div> <!-- card end// -->
        </div> <!-- col end// -->
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-warning material-icons md-shopping_basket"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng sản phẩm</h6>  <span><%=ProductManager.getInstance().formatPrice(tongSoSanPham)%></span>

                    </div>
                </article>
            </div> <!--  end// -->
        </div> <!-- col end// -->
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-danger material-icons md-supervised_user_circle"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng khách hàng</h6>  <span><%=ProductManager.getInstance().formatPrice(tongSoKhachHang)%></span>
                    </div>
                </article>
            </div> <!--  end// -->
        </div> <!-- col end// -->
    </div> <!-- row end// -->


    <div class="row">

        <div class="col-xl-6 col-lg-12">
            <div class="card mb-4">
                <article class="card-body">

                    <h5 class="card-title">Sản phẩm bán chạy</h5>

                    <div class="card-body-main">
                        <%for (int i = 0; i < listProduct.size() ; i++){
                            Product product = listProduct.get(i);
                        %>
                        <article class="itemlist">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%><%=product.getListUrlImg().get(0)%>" class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                        <div class="info">
                                            <h6 class="mb-0"><%=product.getTenSP()%></h6>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-4 col-price"> <span><%=ProductManager.getInstance().formatPrice(product.getGia()-product.getGia()*product.getSell())%>đ</span> </div>
                            </div> <!-- row .// -->
                        </article>  <!-- itemlist  .// -->

                        <%}%>

                    </div>
                    <!-- <a href="#" class="btn btn-light">Open analytics <i class="material-icons md-open_in_new"></i> </a> -->
                </article> <!-- card-body end// -->
            </div> <!-- card end// -->
        </div> <!-- col end// -->
        <div class="col-xl-6 col-lg-12">
            <div class="card mb-4">
                <article class="card-body">
                    <h5 class="card-title">Thống kê bán hàng</h5>
                    <canvas height="150" id="myChart"></canvas>

                </article> <!-- card-body end// -->

            </div> <!-- card end// -->
        </div> <!-- col end// -->
    </div> <!-- row end// -->


    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Đơn hàng mới nhất</h5>
            <div class="table-responsive">
                <table class="table table-hover">
                    <%for (int i = 0; i < listOrder.size() ; i++){
                        Order order = listOrder.get(i);
                    %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><b><%=order.getName()%></b></td>
                        <td><%=order.getEmail()%></td>
                        <td><%=ProductManager.getInstance().formatPrice(order.getTotalPrice())%>đ</td>
                        <td><span class="badge rounded-pill <%=order.getClassTrangThai()%>"><%=order.getTrangThai()%></span></td>
                        <%Date ngayNhap = order.getOrderDate();%>
                        <td><%=ngayNhap.getDate()+"/"+(ngayNhap.getMonth()+1)+"/"+(ngayNhap.getYear()+1900)%></td>
                        <td class="text-end">
                            <a href="<%=request.getContextPath()%>/admin-order-detail?id=<%=order.getOrderId()%>" class="btn btn-light">Chi tiết</a>

                        </td>
                    </tr>

                    <%}%>

                </table>
            </div> <!-- table-responsive end// -->
        </div> <!-- card-body end// -->
    </div> <!-- card end// -->

</section> <!-- content-main end// -->
<script src="<%=request.getContextPath()%>/admin/js/chart.js"></script>

<script>
    var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'line',

            // The data for our dataset
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [
                    {
                        label: 'Sales',
                        backgroundColor: 'rgb(44, 120, 220)',
                        borderColor: 'rgb(44, 120, 220)',
                        data: [18, 17, 4, 3, 2, 20, 25, 31, 25, 22, 20, 9]
                    },
                    {
                        label: 'Visitors',
                        backgroundColor: 'rgb(180, 200, 230)',
                        borderColor: 'rgb(180, 200, 230)',
                        data: [40, 20, 17, 9, 23, 35, 39, 30, 34, 25, 27,18]
                    }

                ]
            },

            // Configuration options go here
            options: {}
        });
</script>
</body>


</html>
