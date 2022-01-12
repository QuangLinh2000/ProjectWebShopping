<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/12/2022
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<BoSuaTap> list = (List<BoSuaTap>) request.getAttribute("boSuaTaps");
    List<LoaiSP> listLoai = (List<LoaiSP>) request.getAttribute("loaiSPS");
%>
<html>
<head>
    <title>Thêm sản phẩm</title>
</head>
<body>
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Sản phẩm</h2>
        <div>
            <a href="#" class="btn btn-light">Xuất file</a>
            <a href="#" class="btn btn-primary">Lưu</a>
        </div>
    </div>

    <div  id="content-wrapper">
        <div class="accordion" id="accordionExample">
            <aside class="col-lg-12 border-end">
                <nav class="nav nav-pills flex-lg-row ps-5 pe-5">
                    <a class="nav-link accordion-button border-0" type="button" data-bs-toggle="collapse"
                       data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <span class="text">Tổng quan</span>
                    </a>

                    <a class="nav-link accordion-button border-0 collapsed" type="button" data-bs-toggle="collapse"
                       data-bs-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
                        <span class="text">Hình ảnh</span>
                    </a>
                </nav>

            </aside>
            <div class="row gx-5">

                <div class="col-lg-12">
                    <section class="content-body p-xl-4">

                        <form>
                            <div id="collapseOne" class=" row accordion-collapse collapse show border-0"
                                 aria-labelledby="headingOne"
                                 data-bs-parent="#accordionExample">
                                <aside class="col-xl-8 col-lg-8 ">
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="row  mb-4">
                                                <div class="col-md-12 form-group">
                                                    <label for="product_name" class="form-label">Tên sản phẩm</label>
                                                    <input type="text" placeholder="Tên sản phẩm" class="form-control"
                                                           id="product_name" required>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-3 form-group mb-4">
                                                    <label for="product_quantity_s" class="form-label">Số lượng S</label>
                                                    <input type="number" min="0" class="form-control" id="product_quantity_s"
                                                           value="0" >
                                                </div>
                                                <div class="col-md-3 form-group mb-4">
                                                    <label for="product_quantity_l" class="form-label">Số lượng X</label>
                                                    <input type="number" min="0" class="form-control" id="product_quantity_l"
                                                           value="0" >
                                                </div>
                                                <div class="col-md-3 form-group mb-4">
                                                    <label for="product_quantity_m" class="form-label">Số lượng M</label>
                                                    <input type="number" min="0" class="form-control" id="product_quantity_m"
                                                           value="0" >
                                                </div>
                                                <div class="col-md-3 form-group mb-4">
                                                    <label for="product_quantity_xl" class="form-label">Số lượng XL</label>
                                                    <input type="number" min="0" class="form-control" id="product_quantity_xl" value="0" >
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-md-6 form-group  mb-4" data-bs-toggle="tooltip" data-bs-placement="top"
                                                     title="Các Loại quần áo">
                                                    <label class="form-label" for="product-type">Loại</label>
                                                    <select class="form-select" id="product-type" name="product-type">
                                                        <option>Quần</option>
                                                        <option>Áo</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6 form-group  mb-4" data-bs-toggle="tooltip" data-bs-placement="top" title="Các Loại quần áo">
                                                    <label class="form-label" for="product-colection">Bộ sưu tập</label>
                                                    <select class="form-select" id="product-colection" name="product-colection">
                                                        <%

                                                        %>
                                                        <option>bst1</option>
                                                        <option>bst2</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 form-group  mb-4" data-bs-toggle="tooltip"
                                                     data-bs-placement="top"
                                                     title="Các màu ngăn cách bằng dấu ,">
                                                    <label for="product_color" class="form-label">Màu</label>
                                                    <input type="text" placeholder="Màu" class="form-control" id="product_color"
                                                           value="đỏ, cam">
                                                </div>
                                            </div>
                                            <div class="row mb-4 ">
                                                <div class="form-group ">
                                                    <label for="product_description" class="form-label">Mô tả</label>
                                                    <textarea id="product_description" placeholder="Mô tả" class="form-control"
                                                              rows="4"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </aside>

                                <aside class="col-xl-4 col-lg-4">
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="mb-4">
                                                <label class="form-label" for="product-status">Trạng thái</label>
                                                <select class="form-select" id="product-status" name="product-status">
                                                    <option value="1">Còn hàng</option>
                                                    <option value="0">Hết hàng</option>
                                                    <option value="2">Tạm ngưng</option>
                                                </select>
                                            </div>
                                            <div class="mb-4">
                                                <label for="product_price" class="form-label">Giá gốc</label>
                                                <div class="input-group">
                                                    <input type="text" placeholder="Giá gốc" class="form-control" id="product_price" value="500000">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">vnđ</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <h5 class="mb-3">Giảm giá</h5>
                                            <div class="mb-2">
                                                <label for="product_price_sale" class="form-label">Giá sale</label>
                                                <div class="input-group">
                                                    <input type="number" placeholder="Giá sale" class="form-control" id="product_price_sale" value="10" min="0"
                                                           max="100">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">%</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-2">
                                                <label for="product_date_start" class="form-label">Ngày bắt đầu</label>
                                                <input type="date" class="form-control" min="2010-02-01" id="product_date_start">
                                            </div>
                                            <div class="mb-4">
                                                <label for="product_date_end" class="form-label">Ngày Kết thúc</label>
                                                <input type="date" class="form-control" min="2010-02-01" id="product_date_end" >
                                            </div>
                                        </div>
                                    </div> <!-- card end// -->
                                </aside>
                            </div> <!-- row.// -->
                            <div id="collapseFive" class=" accordion-collapse collapse  border-0"
                                 aria-labelledby="headingFive"
                                 data-bs-parent="#accordionExample">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-end">
                                            <label for="create-image" class="btn btn-primary ml-auto  mt-3">
                                                <i class="material-icons md-plus"></i>
                                            </label>
                                            <input class="d-none" id="create-image" type="file" accept="image/*" multiple />
                                        </div>
                                        <div id="container-image" class="row gx-3 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 row-cols-xxl-5">
                                            <div class="col">
                                                <div class="card card-product-grid">
                                                    <label for="file-image-0">
                                                        <img src="../img/collection1_slide_product_1.jpg" class="card-img img-thumbnail" alt="...">
                                                    </label>
                                                    <input class="d-none" id="file-image-0" type="file" accept="image/*" />
                                                    <div class="info-wrap">
                                                        <a href="#" class="title text-truncate">/home/img1</a>
                                                        <a href="#" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-sm btn-outline-danger">
                                                            <i class="material-icons md-delete_forever"></i> Xóa
                                                        </a>
                                                    </div>
                                                </div> <!-- card-product  end// -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </form>

                    </section> <!-- content-body .// -->
                </div> <!-- col.// -->
            </div> <!-- row.// -->

        </div> <!-- card-body .//end -->
    </div> <!-- card .//end -->


</section> <!-- content-main end// -->

</body>
</html>
