<%@ page import="com.example.projectwebshopping.model.admin.Appreciate" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.dao.client.AppreciateDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     List<Appreciate> listComment=(List<Appreciate>) request.getAttribute("listComment");
%>
<html>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-reviews.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 07 Dec 2021 02:39:01 GMT -->
<head>
  <title>Nhận Xét</title>
</head>
<body>
   <section class="content-main">
        <div class="content-header">
             <h2 class="content-title">Nhận xét</h2>
        </div>
        <div class="card mb-4">
         <header class="card-header">
              <div class="row gx-3">
                   <div class="col-lg-4 col-md-6 me-auto">
                        <input type="text" placeholder="Tìm kiếm..." class="form-control" />
                   </div>
                   <div class="col-lg-2 col-md-3 col-6">
                        <select class="form-select">
                             <option>Trạng thái</option>
                             <option>Còn hàng</option>
                             <option>Hết hàng</option>
                             <option>Hiện tất cả</option>
                        </select>
                   </div>
                   <div class="col-lg-2 col-md-3 col-6">
                        <select class="form-select">
                             <option>Show 20</option>
                             <option>Show 30</option>
                             <option>Show 40</option>
                        </select>
                   </div>
              </div>
         </header>
         <!-- card-header end// -->
         <div class="card-body">

<div class="table-responsive">
<table class="table table-hover">
<thead>
     <tr>
          <th>
           <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" />
           </div>
          </th>
          <th class="col-lg-1 .col-md-1 .col-sm-1">#STT</th>
          <th class="col-lg-2 .col-md-2 .col-sm-2">Ảnh</th>
          <th class="col-lg-2 .col-md-2 .col-sm-2">Tên Khách Hàng</th>
          <th class="col-lg-1 .col-md-1 .col-sm-1">Công Việc</th>
          <th class="col-lg-3 .col-md-3 .col-sm-3">Nhận Xét</th>
          <th class="col-lg-1 .col-md-1 .col-sm-1">Trạng Thái</th>
          <th class="col-lg-1 .col-md-1 .col-sm-1">Ngày</th>
          <th class="text-end col-lg-1 .col-md-1 .col-sm-1">Hành động</th>
     </tr>
</thead>
<tbody>
<%
     for (int i = 0; i < listComment.size(); i++) {
     Appreciate appreciate=listComment.get(i);
%>
     <tr idComment="<%=appreciate.getId()%>">
          <td>
               <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" />
               </div>
          </td>
          <td><%=(i+1)%></td>
          <td style="width: 10%;"> <img src="<%=request.getContextPath()%><%=appreciate.getUserImg()%>" class="img-sm img-thumbnail" alt="Item"></td>
          <td><%=appreciate.getUserName()%></td>
          <td><%=appreciate.getJob()%></td>
          <td>
              <%=appreciate.getComment()%>
          </td>
          <td><%if(appreciate.getStatus()==1){%>
               Đã Duyệt
               <%}else{%>
               Chưa Duyệt
               <%}%>
          </td>
          <td><%=appreciate.getCommentDate()%></td>
          <td class="col-lg-1 col-sm-2 col-4 col-action">
               <div class="dropdown float-end">
                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                    <div class="dropdown-menu">
                         <%if(appreciate.getStatus()==0){%>
                         <div class="dropdown-item btn" id="confirm-button">Duyệt</div>
                         <%}%>
                         <div onclick="setIDComment(this)" class="delete-button dropdown-item text-danger btn" data-toggle="modal" data-target="#exampleModalCenter">Xoá</div>
                    </div>
               </div> <!-- dropdown // -->
          </td>
     </tr>
     <!--row 1-->
<%}%>
</tbody>
</table>

</div> <!-- table-responsive//end -->
         </div>
         <!-- card-body end// -->
        </div>
        <!-- card end// -->
   </section>
   <!-- content-main end// -->
   <script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
   <script>
        //duyet nhan xet
        $("#confirm-button").click(function (){
             var id=$(this).closest("tr").attr("idComment")
             $.ajax({
                  url: "<%=request.getContextPath()%>/admin-page-reviews",
                  type: "POST",
                  data: {
                       idComment:id,
                       action:"confirm"
                  },
                  success: function (data) {
                       //set attr
                       if(data=="success") {

                            pushNotify('success', 'Duyệt thành công.', 'Nhận Xét');
                            setTimeout(function(){
                                 window.location.reload();
                            }, 900);
                       }
                       else{
                            pushNotify('error', 'Duyệt thất bại.', 'Nhận Xét');
                       }
                  },
                  error: function(){
                       pushNotify('error', 'Duyệt thất bại.', 'Nhận Xét');
                  }
             });
        })
        //xoa nhan xet
        var idCommentTag;
        function setIDComment(e){
            idCommentTag=$(e).closest("tr")
        }
        $(".btn-accept").attr("data-dismiss","modal")
        $(".btn-accept").click(function (){
             var id=idCommentTag.attr("idComment")
             $.ajax({
                  url: "<%=request.getContextPath()%>/admin-page-reviews",
                  type: "POST",
                  data: {
                       idComment:id,
                       action:"delete"
                  },
                  success: function (data) {
                       //set attr
                       if(data=="success") {

                            pushNotify('success', 'Xóa thành công.', 'Nhận Xét');
                           setTimeout(function(){
                               window.location.reload();
                           }, 900);
                       }
                       else{
                            pushNotify('error', 'Xóa thất bại.', 'Nhận Xét');
                       }
                  },
                  error: function(){
                       pushNotify('error', 'Xóa thất bại.', 'Nhận Xét');
                  }
             });
        })
   </script>
</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-reviews.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 07 Dec 2021 02:39:02 GMT -->
</html>
