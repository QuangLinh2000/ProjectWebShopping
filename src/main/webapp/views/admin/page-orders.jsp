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
    int totalPage = (int) request.getAttribute("total");

%>
<html>
<head>
    <title>Danh Sách hóa đơn</title>
</head>
<body>
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Danh sách đơn hàng</h2>

    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <header class="card-header">
                    <div class="row gx-3">
                        <div class="col-lg-4 col-md-6 me-auto">
                            <input id="search-oder" type="text" placeholder="Tìm kiếm..." class="form-control">
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
                                <th>STT</th>
                                <th>Tên khách hàng</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                                <th>Ngày</th>
                                <th class="text-end"> Hành động </th>
                            </tr>
                            </thead>
                            <tbody id="table-order">
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
                                    <a href="<%=request.getContextPath()%>/admin-order-detail?id=<%=order.getOrderId()%>" class="btn btn-light">Chi tiết</a>

                                </td>
                            </tr>

                            <%}%>

                            </tbody>
                        </table>
                    </div> <!-- table-responsive //end -->
                    <nav class="float-end mt-4" aria-label="Page navigation">
                        <ul class="pagination">
                            <li id="page-item-pre" class="page-item disabled"><a class="page-link" href="#">Trước</a></li>
                            <%for (int i = 1; i <= totalPage; i++) {
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
                </div> <!-- card-body end// -->
            </div> <!-- card end// -->
        </div>

    </div>
    <!-- .row end// -->


</section> <!-- content-main end// -->
<script>
    var date;
    var  satus = -1;
    var page = 1;
    var total = <%=totalPage%>;
    var key = "";

    document.getElementById("filter-date").addEventListener("change", function () {
        var value = this.value;
        date = value;
        page = 1;
        sendAjax();

    });
    document.getElementById("status-product").addEventListener("change", function () {
        var value = this.value;
        satus = value;
        page = 1;
        sendAjax();
    });
    //send ajax
    function sendAjax() {
        // ajax jquery
        $.ajax({
            url: "<%=request.getContextPath()%>/admin-orders",
            type: "POST",
            data: {
                date: date,
                status: satus,
                page: page,
                key: key
            },
            success: function (data) {
                $("#table-order").html('');
                for (var i = 0; i < data.data.length; i++) {
                    var order = data.data[i];
                    total = data.total;
                $("#table-order").append(
                    '<tr>'+
                    '<td>'+(i+1)+'</td>'+
                    '<td><b>'+order.name+'</b></td>'+
                    '<td>'+formatPrice(order.totalPrice)+'đ</td>'+
                    '<td><span class="badge rounded-pill '+getClassTrangThai(order.status)+'">'+getTrangThai(order.status)+'</span></td>'+
                    '<td>'+formatDate(order.orderDate)+'</td>'+
                    '<td class="text-end">'+
                    '<a href="<%=request.getContextPath()%>/admin-order-detail?id='+order.orderId+'" class="btn btn-light">Chi tiết</a>'+
                    '</td>'+
                    '</tr>');


              }
               $(".pagination").html('');
                $(".pagination").append('<li id="page-item-pre" class="page-item disabled"><a class="page-link" href="#">Trước</a></li>')
                for (var i = 1; i <= total; i++) {
                    if(i == page){
                        $(".pagination").append('<li class="page-item page-item-child active"><a class="page-link" href="#">'+i+'</a></li>');
                    }else{
                        $(".pagination").append('<li class="page-item page-item-child"><a class="page-link" href="#">'+i+'</a></li>');
                    }
                }
                $(".pagination").append('<li id="page-item-next" class="page-item"><a class="page-link" href="#">Sau</a></li>');
                clickPage();
                setNonePageItemChild();
            }
        });

    }
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
    //set none page-item-child
    function setNonePageItemChild(){
        var pageItem =  document.getElementsByClassName('page-item-child');
       if(total > 5){
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
    }
    //format price
    function formatPrice(price) {
        //cast double to int
        var priceInt = parseInt(price);
        return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
    }
    function getClassTrangThai(status) {
        switch (status) {
            case 0:
                return "alert-warning";
            case 1:
                return "alert-danger";
            case 2:
                return "alert-primary";
            case 3:
                return "alert-info";
            case 4:
                return "alert-success";
            default:
                return "alert-warning";
        }
    }    //format date
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [day, month, year].join('-');
    }
    function getTrangThai(status) {
        switch (status) {
            case 0:
                return "Chờ xác nhận";
            case 1:
                return "Đã hủy";
            case 2:
                return "Đã xác nhận";
            case 3:
                return "Đang giao hàng";
            case 4:
                return "Đã giao hàng";
            default:
                return "Chờ xác nhận";
        }
    }


    //----------tim kiem -------------
    //chaneg input
    document.getElementById("search-oder").addEventListener("keyup", function () {
        var value = this.value;
        key = value;
        page = 1;
       sendAjax();
    });
</script>
</body>
</html>
