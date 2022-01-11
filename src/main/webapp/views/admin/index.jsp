<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 9:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <h6 class="mb-1">Tổng doanh thu</h6>  <span>19,626,058.20đ</span>
                    </div>
                </article>

            </div> <!-- card  end// -->
        </div> <!-- col end// -->
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-success-light"><i class="text-success material-icons md-local_shipping"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng đơn hàng</h6> <span>87790</span>
                    </div>
                </article>
            </div> <!-- card end// -->
        </div> <!-- col end// -->
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-warning material-icons md-shopping_basket"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng sản phẩm</h6>  <span>5678</span>

                    </div>
                </article>
            </div> <!--  end// -->
        </div> <!-- col end// -->
        <div class="col-lg-3">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-danger material-icons md-supervised_user_circle"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Tổng khách hàng</h6>  <span>5678</span>
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
                        <article class="itemlist">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%>/admin/images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                        <div class="info">
                                            <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                            </div> <!-- row .// -->
                        </article>  <!-- itemlist  .// -->
                        <article class="itemlist">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%>/admin/images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                        <div class="info">
                                            <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                            </div> <!-- row .// -->
                        </article>  <!-- itemlist  .// -->
                        <article class="itemlist">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%>/admin/images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                        <div class="info">
                                            <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                            </div> <!-- row .// -->
                        </article>  <!-- itemlist  .// -->
                        <article class="itemlist">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%>/admin/images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                        <div class="info">
                                            <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                            </div> <!-- row .// -->
                        </article>  <!-- itemlist  .// -->
                        <article class="itemlist">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="<%=request.getContextPath()%>/admin/images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                        <div class="info">
                                            <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                            </div> <!-- row .// -->
                        </article>  <!-- itemlist  .// -->
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
                    <tr>
                        <td>2323</td>
                        <td><b>Devon Lane</b></td>
                        <td>devon@example.com</td>
                        <td>$778.35</td>
                        <td><span class="badge rounded-pill alert-success">Đã giao</span></td>
                        <td>07.05.2020</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
                    <tr>
                        <td>2323</td>
                        <td><b>Darrell Steward</b></td>
                        <td>stew123@mysite.com</td>
                        <td>$980.90</td>
                        <td><span class="badge rounded-pill alert-warning">Chờ xác nhận</span></td>
                        <td>12.02.2020</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div>
                            <!-- dropdown //end -->
                        </td>
                    </tr>
                    <tr>
                        <td>9053</td>
                        <td><b>Mike Jonatan</b></td>
                        <td>mike@somename.com</td>
                        <td>$778.35</td>
                        <td><span class="badge rounded-pill alert-warning">Chờ xác nhận</span></td>
                        <td>07.05.2020</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
                    <tr>
                        <td>1234</td>
                        <td><b>Ahmed Hassan</b></td>
                        <td>devon@example.com</td>
                        <td>1.000.000đ</td>
                        <td><span class="badge rounded-pill alert-danger">Đã huỷ</span></td>
                        <td>02.01.2020</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
                    <tr>
                        <td>7532</td>
                        <td><b>Abdul Mohammad</b></td>
                        <td>abdu@example.com</td>
                        <td>$190.15</td>
                        <td><span class="badge rounded-pill alert-success">Đã giao</span></td>
                        <td>17.02.2020</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
                    <tr>
                        <td>2323</td>
                        <td><b>Devon Lane</b></td>
                        <td>devon@example.com</td>
                        <td>$778.35</td>
                        <td><span class="badge rounded-pill alert-success">Đã giao</span></td>
                        <td>07.05.2020</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
                    <tr>
                        <td>4521</td>
                        <td><b>Alex Pushkin</b></td>
                        <td>myphkin@company.com</td>
                        <td>$708.35</td>
                        <td><span class="badge rounded-pill alert-success">Đã giao</span></td>
                        <td>01.05.2019</td>
                        <td class="text-end">
                            <a href="#" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Xem chi tiết</a>
                                    <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
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
