<%@ page import="com.example.projectwebshopping.model.admin.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 2/11/2022
  Time: 5:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> listOrder = (List<Order>) request.getAttribute("listOder");
%>
<html>
<head>
    <title>Danh Sách hóa đơn</title>
</head>
<body>
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Danh sách đơn hàng</h2>
        <div>
            <a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Tạo mới</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <div class="card mb-4">
                <header class="card-header">
                    <div class="row gx-3">
                        <div class="col-lg-4 col-md-6 me-auto">
                            <input type="text" placeholder="Tìm kiếm..." class="form-control">
                        </div>
                        <div class="col-md-3 col-6" style="padding: 0 2px;">
                            <input id="filter-date" type="date" class="form-control">
                        </div>
                        <div class="col-lg-3 col-md-3 col-6">
                            <select id="status-product" class="form-select">
                                <option value="-1">Trạng thái</option>
                                <option value="0">Chờ xác nhận</option>
                                <option value="2">Đã xác nhận</option>
                                <option value="3">Đang giao hàng</option>
                                <option value="1">Đã hủy</option>
                                <option value="4">Đã giao hàng</option>
                            </select>
                        </div>

                    </div>
                </header> <!-- card-header end// -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên khách hàng</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                                <th>Ngày</th>
                                <th class="text-end"> Hành động </th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for (int i = 0; i < listOrder.size();i++){
                                Order order = listOrder.get(i);
                            %>
                            <tr>
                                <td><%=i+1%></td>
                                <td><b><%=order.getName()%></b></td>
                                <td><%=ProductManager.getInstance().formatPrice(order.getTotalPrice())%>đ</td>
                                <td><span class="badge rounded-pill <%=order.getClassTrangThai()%>"><%=order.getTrangThai()%></span></td>
                                <%Date ngayNhap = order.getOrderDate();%>
                                <td><%=ngayNhap.getDate()+"/"+(ngayNhap.getMonth()+1)+"/"+(ngayNhap.getYear()+1900)%></td>
                                <td class="text-end">
                                    <a href="#" class="btn btn-light">Chi tiết</a>
                                    <div class="dropdown">
                                        <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                                class="material-icons md-more_horiz"></i> </a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#">Xem chi tiết</a>
                                            <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                            <a class="dropdown-item text-danger" href="#">Xóa</a>
                                        </div>
                                    </div> <!-- dropdown //end -->
                                </td>
                            </tr>

                            <%}%>

                            </tbody>
                        </table>
                    </div> <!-- table-responsive //end -->
                </div> <!-- card-body end// -->
            </div> <!-- card end// -->
        </div>
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="mb-3">Bộ lọc</h5>
                    <form>
                        <div class="mb-4">
                            <label for="order_id" class="form-label">Mã</label>
                            <input type="text" placeholder="Nhập tại đây" class="form-control" id="order_id">
                        </div>
                        <div class="mb-4">
                            <label for="order_customer" class="form-label">Tên khách hàng</label>
                            <input type="text" placeholder="Nhập tại đây" class="form-control" id="order_customer">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Trạng thái</label>
                            <select class="form-select">
                                <option>Đã thêm</option>
                                <option>Nháp</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="order_total" class="form-label">Giá</label>
                            <input type="text" placeholder="Nhập tại đây" class="form-control" id="order_total">
                        </div>
                        <div class="mb-4">
                            <label for="order_created_date" class="form-label">Ngày lập đơn</label>
                            <input type="text" placeholder="Nhập tại đây" class="form-control" id="order_created_date">
                        </div>
                        <div class="mb-4">
                            <label for="order_modified_date" class="form-label">Ngày sửa đổi</label>
                            <input type="text" placeholder="Nhập tại đây" class="form-control" id="order_modified_date">
                        </div>
                    </form>
                </div>
            </div> <!-- card end// -->
        </div>
    </div>
    <!-- .row end// -->


</section> <!-- content-main end// -->
<script>
    document.getElementById("filter-date").addEventListener("change", function () {
        var value = this.value;
        console.log(value)
    });
    document.getElementById("status-product").addEventListener("change", function () {
        var value = this.value;
        console.log(value)

    });
</script>
</body>
</html>
