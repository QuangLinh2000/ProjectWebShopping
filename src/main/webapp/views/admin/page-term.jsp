<%--
  Created by IntelliJ IDEA.
  User: NGUYEN VAN HAU
  Date: 24/02/2022
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String content= (String) request.getAttribute("content");
%>
<html>
<head>
    <title>Chính Sách</title>
    <script src="<%=request.getContextPath()%>/script/ckeditor/ckeditor.js"></script>
</head>
<body>
<section class="content-main">
    <div class="content-header">
        <h2 class="content-title">Site settings </h2>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row gx-5">
                <aside class="col-md-5 col-lg-4 col-sm-6" style="
      top: 10px; ">

                    <nav class="nav nav-pills flex-lg-column mb-4">
                        <ul class="menu-aside">
                            <li class="menu-item  active">
                                <a class="menu-link" href="page-settings-2.html">
                                    <span class="text">Tổng quan</span>
                                </a>
                            </li>
                            <li class="menu-item has-submenu">
                                <a class="menu-link" style="cursor: pointer;">
                                    <span class="text">Cài đặt Trang chủ</span>
                                </a>
                                <div class="submenu">
                                    <a href="page-settings-slide-qc.html">Silde quảng cáo</a>
                                    <a href="page-settings-bo-suu-tap.html">Bộ sưu tập</a>
                                    <a href="page-settings-cam-nhan.html">Nhận xét</a>
                                    <a href="page-settings-tin-tuc.html">Tin tức</a>
                                </div>
                            </li>

                            <li class="menu-item ">
                                <a class="menu-link" href="page-settings-product.html">
                                    <span class="text">Cài đặt trang sản phẩm</span>
                                </a>
                            </li>
                            <li class="menu-item ">
                                <a class="menu-link" href="page-settings-footer.html">
                                    <span class="text">Cài đặt footer</span>
                                </a>
                            </li>
                            <li class="menu-item ">
                                <a class="menu-link" href="page-settings-chekcOuts.html">
                                    <span class="text">Cài đặt thanh toán</span>
                                </a>
                            </li>
                            <li class="menu-item has-submenu">
                                <a class="menu-link" style="cursor: pointer;">
                                    <span class="text">Cài đặt Điều Khoản</span>
                                </a>
                                <div class="submenu">
                                    <a href="<%=request.getContextPath()%>/admin-term?index=1">Điều Khoản Sử Dụng</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=2">Hướng Dẫn Thanh Toán</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=3">Hướng Dẫn Mua Hàng</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=4">Vận Chuyển</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=5">Đổi Trả</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=6">Bán Hàng Và Bảo Hành</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=7">Bảo Vệ Thông Tin Khách Hàng</a>
                                    <a href="<%=request.getContextPath()%>/admin-term?index=8">Quyền Lợi Sinh Nhật</a>

                                </div>
                            </li>
                        </ul>

                    </nav>

                </aside>
                <div class="col-lg-8">
                    <section class="content-body p-xl-4">

                        <!-- ------------dialog remove   start------------------   -->
                        <!-- * modal delete -->
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Xoá sản phẩm</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc chắn muốn xoá không?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                                        <button type="button" class="btn btn-primary bg-danger">Đồng ý</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ----------------- end ------------------------->
                        <!--Modal confirm-->
                        <div class="modal fade" tabindex="-1" role="dialog" id="modal-comfirm" >
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Xác Nhận</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Bạn có chắc chắn muốn lưu thay đổi không ?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary confirm-save" data-dismiss="modal">Xác Nhận</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End-->
                        <div class="edit-button d-flex justify-content-end mb-3">
                            <a class="btn btn-primary" data-toggle="modal" data-target="#modal-comfirm">
                                <i class="icon icon-plus"></i>
                                Lưu Thay Đổi
                            </a>
                            <a data-toggle="modal" data-target="#exampleModalCenter"  class="btn btn-outline-danger" style="margin-left: 5px;">
                                <i class="material-icons md-delete_forever"></i>  xóa
                            </a>
                        </div>
                        <div style="border: 2px solid #ccc;" class="p-4">
  <textarea name="term_area" id="term_area">
<%=content%>
  </textarea>
                        </div>

                    </section> <!-- content-body .// -->
                </div> <!-- col.// -->
            </div> <!-- row.// -->

        </div> <!-- card-body .//end -->
    </div> <!-- card .//end -->
</section> <!-- content-main end// -->
<script>
    CKEDITOR.config.extraPlugins = 'stylesheetparser';
    CKEDITOR.config.entities_latin = true;
    CKEDITOR.inline( 'term_area' );

</script>
<script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
<script>
    console.log("all"+CKEDITOR.instances.term_area.getData());
        $(".confirm-save").click(function (){
            var content=CKEDITOR.instances.term_area.getData()
            $.ajax({
                url: "<%=request.getContextPath()%>/admin-term",
                type: "POST",
                data: {
                    index:<%=request.getAttribute("index")%>,
                    content:content
                },
                success: function (data) {
                    //set attr
                    if(data=="success") {

                        pushNotify('success', 'Sửa thành công.', 'Điều Khoản');
                        setTimeout(function(){
                            window.location.reload();
                        }, 900);
                    }
                    else{
                        pushNotify('error', 'Sửa thất bại.', 'Điều Khoản');
                    }
                },
                error: function(){
                    pushNotify('error', 'Duyệt thất bại.', 'Nhận Xét');
                }
            });
        })

</script>
</body>
</html>
