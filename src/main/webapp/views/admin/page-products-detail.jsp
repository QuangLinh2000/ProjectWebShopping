<%@ page import="com.example.projectwebshopping.dto.client.DetailProduct" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DetailProduct detailProduct = (DetailProduct) request.getAttribute("detailProduct");
    Product product = detailProduct.getProduct();
    List<BoSuaTap> list = (List<BoSuaTap>) request.getAttribute("boSuaTaps");
    List<LoaiSP> listLoai = (List<LoaiSP>) request.getAttribute("loaiSPS");
%>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
</head>
<body>
    <section class="content-main">

        <div class="content-header">
            <h2 class="content-title">Sản phẩm</h2>
            <div>
                <a href="#" class="btn btn-light">Xuất file</a>
                <a href="#" class="btn btn-primary" onclick="enableAll()">
                    Chỉnh Sửa
                </a>

                <label  class="btn btn-primary" for="button_form">Lưu</label>
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
                            <!-- ----------------- end ------------------------->
                            <form id="form-update" method="post" action="<%=request.getContextPath()%>/admin-detail-product" enctype="multipart/form-data">
                                <div id="collapseOne" class=" row accordion-collapse collapse show border-0"
                                     aria-labelledby="headingOne"
                                     data-bs-parent="#accordionExample">
                                    <aside class="col-xl-8 col-lg-8 ">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row  mb-4">
                                                    <div class="col-md-12 form-group">
                                                        <label for="product_name" class="form-label">Tên sản phẩm</label>
                                                        <input type="text" name="product_name" placeholder="Tên sản phẩm" class="form-control"
                                                               id="product_name" value="<%=product.getTenSP()%>" required>
                                                    </div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-md-12 form-group">
                                                        <label for="product_id" class="form-label">Mã sản phẩm</label>
                                                        <input type="text" placeholder="Mã sản phẩm" class="form-control"
                                                               name="product_id"  value="<%=product.getMaSP()%>" id="product_id"  required>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_s" class="form-label">Số lượng S</label>
                                                        <input type="number" min="0" class="form-control" id="product_quantity_s"
                                                               name="product_quantity_s"  value="<%=product.getS()%>"  required>
                                                    </div>
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_l" class="form-label">Số lượng X</label>
                                                        <input type="number" min="0" class="form-control" id="product_quantity_l"
                                                               name="product_quantity_l" value="<%=product.getL()%>" required>
                                                    </div>
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_m" class="form-label">Số lượng M</label>
                                                        <input type="number" min="0" class="form-control" id="product_quantity_m"
                                                               name="product_quantity_m" value="<%=product.getM()%>" required>
                                                    </div>
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_xl" class="form-label">Số lượng XL</label>
                                                        <input type="number" min="0" class="form-control" id="product_quantity_xl"
                                                               name="product_quantity_xl"    value="<%=product.getXL()%>" required>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col-md-6 form-group  mb-4" data-bs-toggle="tooltip" data-bs-placement="top"
                                                         title="Các Loại quần áo">
                                                        <label class="form-label" for="product_type">Loại</label>
                                                        <select class="form-select" id="product_type" name="product_type">
                                                            // for listLoai java
                                                            <%for (int i = 0; i < listLoai.size(); i++) {%>
                                                            <option value="<%=listLoai.get(i).getMaLoai()%>"
                                                                    <%if (product.getLoaiSP() == listLoai.get(i).getMaLoai()) {%>
                                                                    selected
                                                                    <%}%>
                                                            ><%=listLoai.get(i).getTenLoai()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6 form-group  mb-4" data-bs-toggle="tooltip" data-bs-placement="top" title="Các Loại quần áo">
                                                        <label class="form-label" for="product_collection">Bộ sưu tập</label>
                                                        <select class="form-select" id="product_collection" name="product_collection">
                                                            // for boSuuTap java
                                                            <%for (int i = 0; i < list.size(); i++) {%>
                                                            <option value="<%=list.get(i).getId()%>"
                                                                    <%if (product.getIdBoST() == list.get(i).getId()) {%>
                                                                    selected
                                                                    <%}%>
                                                            ><%=list.get(i).getName()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 form-group  mb-4" data-bs-toggle="tooltip"
                                                         data-bs-placement="top"
                                                         title="Các màu ngăn cách bằng dấu ,">
                                                        <label for="product_color" class="form-label">Màu</label>
                                                        <input type="text" placeholder="Màu" class="form-control" id="product_color"
                                                               name="product_color" value="<%=product.getMau()%>">
                                                    </div>
                                                </div>
                                                <div class="row mb-4 ">
                                                    <div class="form-group ">
                                                        <label for="product_description" class="form-label">Mô tả</label>
                                                        <textarea id="product_description" placeholder="Mô tả" class="form-control"
                                                                  name="product_description"  rows="4" value="<%=product.getMoTa()%>"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </aside>

                                    <aside class="col-xl-4 col-lg-4">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="mb-4">
                                                    <label class="form-label" for="product_status">Trạng thái</label>
                                                    <select class="form-select" id="product_status" name="product_status">
                                                        // 0 het hang 1 con hang 2 tam ngung
                                                        <option value="0"
                                                                <%if (product.getTrangThai() == 0) {%>
                                                                selected
                                                                <%}%>
                                                        >Hết hàng</option>
                                                        <option value="1"
                                                                <%if (product.getTrangThai() == 1) {%>
                                                                selected
                                                                <%}%>
                                                        >Còn hàng</option>
                                                        <option value="2"
                                                                <%if (product.getTrangThai() == 2) {%>
                                                                selected
                                                                <%}%>
                                                        >Tạm ngưng</option>
                                                    </select>
                                                </div>
                                                <div class="mb-4">
                                                    <label for="product_price" class="form-label">Giá gốc</label>
                                                    <div class="input-group">
                                                        <input type="text" placeholder="Giá gốc" class="form-control" id="product_price"
                                                             name="product_price"  value="<%=product.getGia()%>">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">vnđ</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <h5 class="mb-3">Giảm giá</h5>
                                                <div class="mb-2">
                                                    <label for="product_price_sale" class="form-label">Giá sale</label>
                                                    <div class="input-group">
                                                        <input type="number" placeholder="Giá sale" class="form-control" id="product_price_sale"
                                                               name="product_price_sale" value="<%=product.getSell()*100%>" min="0"
                                                               max="100">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">%</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-2">
                                                    <label for="product_date_start" class="form-label">Ngày bắt đầu</label>
                                                    <input type="date" class="form-control" min="2010-02-01" id="product_date_start"
                                                           name="product_date_start"   value="<%=product.getNgayBatDausell()%>"
                                                    >
                                                </div>
                                                <div class="mb-4">
                                                    <label for="product_date_end" class="form-label">Ngày Kết thúc</label>
                                                    <input type="date" class="form-control" min="2010-02-01" id="product_date_end"
                                                           name="product_date_end"  value="<%=product.getNgayHetHansell()%>"
                                                    >
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
                                            <div class="d-flex justify-content-end mb-4">
                                                <label for="create-image" class="btn btn-primary ml-auto  mt-3">
                                                    Thêm ảnh
                                                    <i class="material-icons md-plus"></i>
                                                </label>
                                                <input class="d-none" id="create-image" name="file" type="file" accept="image/*" multiple />
                                            </div>
                                            <div id="container-image" class="row gx-3 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 row-cols-xxl-5">
                                                <% for (int i = 0; i < product.getListUrlImg().size(); i++) { %>
                                                <div class="col">
                                                    <div class="card card-product_grid">
                                                        <label for="file-image-<%=i%>">
                                                            <img src="<%=request.getContextPath()%><%=product.getListUrlImg().get(i)%>" class="card-img img-thumbnail" alt="<%=product.getTenSP()%>">
                                                        </label>
                                                        <input class="d-none" id="file-image-<%=i%>" type="file" accept="image/*" />
                                                        <div class="info-wrap">
                                                            <a href="#" class="title text-truncate"><%=product.getListUrlImg().get(i)%></a>
                                                            <a href="#" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-sm btn-outline-danger">
                                                                <i class="material-icons md-delete_forever"></i> Xóa
                                                            </a>
                                                        </div>
                                                    </div> <!-- card-product  end// -->
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <input  type="submit" value="Send Request" id="button_form">

                            </form>

                        </section> <!-- content-body .// -->
                    </div> <!-- col.// -->
                </div> <!-- row.// -->

            </div> <!-- card-body .//end -->
        </div> <!-- card .//end -->


    </section> <!-- content-main end// -->
    <script>
        //disable all input vs textarea vs select document
        // disableAll();
        function disableAll() {
            var input = document.getElementsByTagName("input");
            var textarea = document.getElementsByTagName("textarea");
            var select = document.getElementsByTagName("select");
            for (var i = 0; i < input.length; i++) {
                input[i].disabled = true;
            }
            for (var i = 0; i < textarea.length; i++) {
                textarea[i].disabled = true;
            }
            for (var i = 0; i < select.length; i++) {
                select[i].disabled = true;
            }
        }

        function enableAll() {
            var input = document.getElementsByTagName("input");
            var textarea = document.getElementsByTagName("textarea");
            var select = document.getElementsByTagName("select");
            for (var i = 0; i < input.length; i++) {
                if (input[i]!==document.getElementById("create-image")) {
                    input[i].disabled = false;
                }

            }
            for (var i = 0; i < textarea.length; i++) {
                textarea[i].disabled = false;
            }
            for (var i = 0; i < select.length; i++) {
                select[i].disabled = false;
            }
        }
        // upload file image form ajax document
        document.getElementById("form-update").addEventListener("submit", function (e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
            console.log("submit");

            var formData = new FormData(this);
            console.log(formData);

            //  enctype utf-8 vs file multipart/form-data
            $.ajax({
                url: '<%=request.getContextPath()%>/admin-detail-product',
                type: 'POST',
                data: formData,
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    // if(data == 'success'){
                    //     pushNotify('success', 'Thêm sản phẩm thành công','Thêm sản phẩm');
                    // }else{
                    //     pushNotify('danger', 'Thêm sản phẩm thất bại','Thêm sản phẩm');
                    // }
                }
            });



        });



    </script>
</body>

</html>
