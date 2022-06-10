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
    List<BoSuaTap> listBST = (List<BoSuaTap>) request.getAttribute("boSuaTaps");
    List<LoaiSP> listLoai = (List<LoaiSP>) request.getAttribute("loaiSPS");
%>
<html>
<head>
    <title>Thêm sản phẩm</title>
</head>
<body>
<section class="content-main">
    <form id="form-send-data" action="<%=request.getContextPath()%>/admin-add-product" method="post" enctype="multipart/form-data">
        <div class="content-header">
            <h2 class="content-title">Thêm Sản phẩm</h2>
            <div>
                <input  type="submit" class="btn btn-primary" value="Thêm">
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

                            <div>
                                <div id="collapseOne" class=" row accordion-collapse collapse show border-0"
                                     aria-labelledby="headingOne"
                                     data-bs-parent="#accordionExample">
                                    <aside class="col-xl-8 col-lg-8 ">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row  mb-4">
                                                    <div class="col-md-12 form-group">
                                                        <label for="product_name" class="form-label">Tên sản phẩm</label>
                                                        <input name="product_name" type="text" placeholder="Tên sản phẩm" class="form-control"
                                                               id="product_name" required>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_s" class="form-label">Số lượng S</label>
                                                        <input name="product_quantity_s" type="number" min="0" class="form-control" id="product_quantity_s"
                                                               value="0" >
                                                    </div>
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_l" class="form-label">Số lượng X</label>
                                                        <input name = "product_quantity_l" type="number" min="0" class="form-control" id="product_quantity_l"
                                                               value="0" >
                                                    </div>
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_m" class="form-label">Số lượng M</label>
                                                        <input name = "product_quantity_m" type="number" min="0" class="form-control" id="product_quantity_m"
                                                               value="0" >
                                                    </div>
                                                    <div class="col-md-3 form-group mb-4">
                                                        <label for="product_quantity_xl" class="form-label">Số lượng XL</label>
                                                        <input name="product_quantity_xl" type="number" min="0" class="form-control" id="product_quantity_xl" value="0" >
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col-md-6 form-group  mb-4" data-bs-toggle="tooltip" data-bs-placement="top"
                                                         title="Các Loại quần áo">
                                                        <label class="form-label" for="product-type">Loại</label>
                                                        <select class="form-select" id="product-type" name="product_type">
                                                            <%
                                                                for (int i = 0; i < listLoai.size(); i++) {
                                                                    LoaiSP loaiSP = listLoai.get(i);
                                                            %>
                                                            <option value="<%=loaiSP.getMaLoai()%>"><%=loaiSP.getTenLoai()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6 form-group  mb-4" data-bs-toggle="tooltip" data-bs-placement="top" title="Các Loại quần áo">
                                                        <label class="form-label" for="product-colection">Bộ sưu tập</label>
                                                        <select class="form-select" id="product-colection" name="product_colection">
                                                            <%
                                                                for (int i = 0; i < listBST.size(); i++) {
                                                                    BoSuaTap bst = listBST.get(i);
                                                            %>
                                                            <option value="<%=bst.getId()%>"><%=bst.getName()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 form-group  mb-4" data-bs-toggle="tooltip"
                                                         data-bs-placement="top"
                                                         title="Các màu ngăn cách bằng dấu ,">
                                                        <label for="product_color" class="form-label">Màu</label>
                                                        <input name="product_color" type="text" placeholder="Màu" class="form-control" id="product_color"
                                                               value="">
                                                    </div>
                                                </div>
                                                <div class="row mb-4 ">
                                                    <div class="form-group ">
                                                        <label for="product_description" class="form-label">Mô tả</label>
                                                        <textarea name="product_description" id="product_description" placeholder="Mô tả" class="form-control"
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
                                                    <select class="form-select" id="product-status" name="product_status">
                                                        <option value="1">Còn hàng</option>
                                                        <option value="0">Hết hàng</option>
                                                        <option value="2">Tạm ngưng</option>
                                                    </select>
                                                </div>
                                                <div class="mb-4">
                                                    <label for="product_price" class="form-label">Giá gốc</label>
                                                    <div class="input-group">
                                                        <input name="product_price" min="0" type="text" placeholder="Giá gốc" class="form-control" id="product_price" value="0">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">vnđ</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <h5 class="mb-3">Giảm giá</h5>
                                                <div class="mb-2">
                                                    <label for="product_price_sale" class="form-label">Giá sale</label>
                                                    <div class="input-group">
                                                        <input name="product_price_sale" type="number" placeholder="Giá sale" class="form-control" id="product_price_sale" value="0" min="0"
                                                               max="100">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">%</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-2">
                                                    <label for="product_date_start" class="form-label">Ngày bắt đầu</label>
                                                    <input name="product_date_start" type="date" class="form-control" min="2010-02-01" id="product_date_start">
                                                </div>
                                                <div class="mb-4">
                                                    <label for="product_date_end" class="form-label">Ngày Kết thúc</label>
                                                    <input name="product_date_end" type="date" class="form-control" min="2010-02-01" id="product_date_end" >
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
                                                <input  name="create-image" class="d-none" id="create-image" type="file" accept="image/*" multiple />
                                            </div>
                                            <div id="container-image" class="row gx-3 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 row-cols-xxl-5">

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </section> <!-- content-body .// -->
                    </div> <!-- col.// -->
                </div> <!-- row.// -->

            </div> <!-- card-body .//end -->
        </div> <!-- card .//end -->
    </form>




</section> <!-- content-main end// -->
<script>

    var arr_image = [];


    //click input file create-image

    document.querySelector("#create-image").addEventListener("change", function() {
        var files = this.files;
        var filesArr = Array.prototype.slice.call(files);
        arr_image = files;
        filesArr.forEach(function(f) {
            if (!f.type.match("image.*")) {
                alert("Không phải file ảnh");
                return;
            }
            var reader = new FileReader();
            reader.onload = function(e) {
                var html = "<div class='col'>" +
                    "<div class='card card-product-grid'>" +
                    "<img src='" + e.target.result + "' class='card-img img-thumbnail' alt='...'>" +
                    "<input class='d-none' id='file-image-" + files.length + "' type='file' accept='image/*' />" +
                    "<div class='info-wrap'>" +
                    "<a href='#' class='title text-truncate'>" + f.name + "</a>" +
                    "<a href='#' data-toggle='modal' data-target='#exampleModalCenter' class='btn btn-sm btn-outline-danger'>" +
                    "<i class='material-icons md-delete_forever'></i> Xóa" +
                    "</a>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
                $('#container-image').append(html);

            }
            reader.readAsDataURL(f);

        });
    });

    document.querySelector('#form-send-data').addEventListener('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            url: '<%=request.getContextPath()%>/admin-add-product',
            type: 'POST',
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if(data == 'success'){
                 pushNotify('success', 'Thêm sản phẩm thành công','Thêm sản phẩm');
                }else{
                    pushNotify('danger', 'Thêm sản phẩm thất bại','Thêm sản phẩm');
                }
            }
        });
    });


</script>
</body>
</html>
