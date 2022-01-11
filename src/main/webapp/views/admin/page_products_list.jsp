<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <select class="form-select">
                        <option>Loại</option>
                        <option>Áo</option>
                        <option>Váy</option>
                        <option>Quần</option>
                    </select>
                </div>
                <div class="col-md-2 col-6" style="padding: 0 2px;">
                    <input type="date" class="form-control">
                </div>
                <div class="col-md-2 col-6">
                    <select class="form-select">
                        <option>Trạng thái</option>
                        <option>Còn hàng</option>
                        <option>Hết hàng</option>
                        <option>Hiện tất cả</option>
                    </select>
                </div>
            </div>
        </header> <!-- card-header end// -->

        <div class="card-body">

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
                                <img src="images/items/1.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">T-shirt for men medium size</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$34.50</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>04.12.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->


            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/2.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Helionic Hooded Down Jacket</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$990.99</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>02.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/3.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Lace mini dress with faux leather</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-warning">Hàng lỗi</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>13.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/4.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Fanmis Men's Travel Bag</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$18.00</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>02.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/3.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Jeans Shorts for Men</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-danger">Hết hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>13.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/5.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Wallet made of leather brown color</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$18.00</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-warning">Hàng lỗi</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>02.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/6.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Modern Armchair for home interiors</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>13.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/4.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Lace mini dress with faux leather</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$18.00</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>31.01.2021</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/3.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Lace mini dress with faux leather</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$76.99</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>13.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->

            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col col-check flex-grow-0">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="">
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="#">
                            <div class="left">
                                <img src="images/items/4.jpg" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">Lace mini dress with faux leather</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>$180.99</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Còn hàng</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>02.11.2020</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Xem chi tiết</a>
                                <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                <a class="dropdown-item text-danger" data-toggle="modal" data-target="#exampleModalCenter">Xoá</a>
                            </div>
                        </div> <!-- dropdown // -->
                    </div>
                </div> <!-- row .// -->
            </article>  <!-- itemlist  .// -->


            <nav class="float-end mt-4" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#">Trước</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                </ul>
            </nav>

        </div> <!-- card-body end// -->
    </div> <!-- card end// -->


</section> <!-- content-main end// -->

</body>
</html>
