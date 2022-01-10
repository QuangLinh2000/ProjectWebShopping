<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.dto.client.CartProduct" %>
<%@ page import="com.example.projectwebshopping.model.client.CartJson" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.model.client.User" %>
<%@ page import="com.example.projectwebshopping.model.client.KhachHang" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkOuts.css">
<%
  List<CartJson> carts= (List<CartJson>) request.getAttribute("list_cart");
    KhachHang khachHang= (KhachHang) request.getAttribute("khachHang");
  if (carts==null) {
    carts=new ArrayList<>();
  }
  double total=0;
  for(CartJson cart: carts){
    total+=cart.getPrice()*cart.getQuantity();
  }
%>

<div class="container">
  <div class="top">
    <div class="top-title-container">
      <p class="title-top title-top-start">Giỏ hàng</p>
      <p class="title-top title-top-betwent ">Thông tin vận chuyển</p>
      <p class="title-top title-top-end">Thanh toán</p>

    </div>
    <div class="top-container">
      <div class="icon-top-container">
        <div class="item-top-icon">
          <div class="icon-top">
            <i class="fa fa-shopping-cart"></i>
          </div>

        </div>

        <div class="bar-top bar-top-1"></div>
      </div>

      <div class="icon-top-container">
        <div class="item-top-icon">
          <div class="icon-top">
            <i class="fa-solid fa-truck-fast"></i>
          </div>
        </div>
        <div class="bar-top"></div>

      </div>
      <div class="icon-top-container end">
        <div class="item-top-icon">

          <div class="icon-top">
            <i class="fa fa-credit-card"></i>
          </div>
        </div>

      </div>
    </div>
  </div>
  <%if (carts.size() > 0){%>
    <div class="end-container-bottom">
        <div class="content-left">
            <p class="title-content-left">Thông tin thanh toán</p>
            <div class="box-content-left">
                <div class="input-item-content-box">
                    <input  class="input-item" placeholder="Họ và Nhập tại đây" type="text">
                </div>
                <div class="input-item-content-box">
                    <input  class="input-item" placeholder="Email" type="email">
                </div>
                <div class="input-item-content-box">
                    <input  class="input-item" placeholder="Điện Thoại" type="number">
                </div>
                <div class="input-item-content-box">
                    <input  class="input-item" placeholder="Địa chỉ" type="text">
                </div>

                <div class="dia-diem">
                    <select class="diem-diem-item" onChange="clickTinhThanhPho(this)" id="tinh-thanh-pho" >
                        <option value="">Tỉnh/Thành Phố</option>
                    </select>
                    <select class="diem-diem-item" onchange="clickQuanHuyen(this)"   id="quan-huyen" >
                        <option value="">Quận/Huyện</option>
                    </select>

                    <select class="diem-diem-item" id="phuong-xa" >
                        <option value="">Phường/xã</option>
                    </select>
                </div>
                <div class="button-click">
                    <a href="<%=request.getContextPath()%>/cart"><input class="billing_address billing_address_1" type="button" value="Giỏ hàng"></a>
                    <input class="billing_address billing_address_2" type="button" value="Đặt Hàng">
                </div>


            </div>
        </div>
        <div class="bettwent-content"></div>
        <div class="content-right-box">
            <p class="title-content-right">Sản Phẩm</p>
            <div class="box-item-content-right">
                <%for (int i = 0; i < carts.size();i++){
                    CartJson cart=carts.get(i);
                %>
                <div class="item-content-right">
                    <img class="img-item-content-right" src="<%=request.getContextPath()%><%=cart.getImg()%>" alt="">
                    <p class="name-product-item"><%=cart.getName()%><br>
                        size: <%=cart.getSize()%> </p>
                    <input disabled min="1" class="so-luong" value="<%=cart.getQuantity()%>" type="number">
                    <p class="price-product-item"><%=ProductManager.getInstance().formatPrice(cart.getPrice()*cart.getQuantity())%>đ</p>
                </div>
                <%}%>
            </div>
            <div class="bar-content-right-box"></div>
            <div class="box-check-out-mony">
                <p class="title-left-check-out">Tạm tính</p>
                <p class="title-right-check-out"><%=ProductManager.getInstance().formatPrice(total)%>đ</p>

            </div>
            <div class="box-check-out-mony">
                <p class="title-left-check-out">Phí ship</p>
                <p class="title-right-check-out">0 đ</p>
            </div>
            <div class="bar-content-right-box"></div>
            <div class="box-check-out-mony">
                <p class="title-left-check-out title-left-check-out-sum">Tổng tiền</p>
                <p class="title-right-check-out"><%=ProductManager.getInstance().formatPrice(total)%>đ</p>

            </div>
        </div>


    </div>
    <%}else{%>
     <div class="list-cart-zero">
         <h1>Vui lòng chọn sản Phẩm để thanh toán</h1>

     </div>
     <%}%>
</div>

<script >
  var array;
  var valueTinhThanhPho = "Tỉnh/Thành Phố";
  var arrayQuanHuyen;
  var valueQuanHUyen = "Quận / Huyện";
  var arrayPhuongXa;
  $.getJSON("<%=request.getContextPath()%>/data/local.json", function (json) {
    // console.log(json); // this will show the info it in firebug console
    array = json;
    // console.log(array[0]);
    $("#tinh-thanh-pho").html('<option value="">Tỉnh/Thành Phố</option>');
    array.forEach((element) => {
      $("#tinh-thanh-pho").append(
              '<option value="' + element.name + '">' + element.name + "</option>"
      );
    });
  });
  function clickTinhThanhPho(sel) {
    valueTinhThanhPho = sel.options[sel.selectedIndex].text;

    array.forEach((element) => {
      if (element.name === valueTinhThanhPho) {
        arrayQuanHuyen = element.districts;
      }
    });

    $("#quan-huyen").html("");
    $("#quan-huyen").append('<option value="">Quận/Huyện</option>');
    $("#phuong-xa").html('<option value="">Phường/xã</option>');

    arrayQuanHuyen.forEach((element) => {
      $("#quan-huyen").append('<option value="">' + element.name + "</option>");
    });
  }



  function clickQuanHuyen(el) {
    valueQuanHUyen = el.options[el.selectedIndex].text;

    arrayQuanHuyen.forEach((element) => {
      if (element.name === valueQuanHUyen) {
        arrayPhuongXa = element.wards;
      }
    });

    $("#phuong-xa").html('<option value="">Phường/xã</option>');
    arrayPhuongXa.forEach((element) => {
      $("#phuong-xa").append('<option value="">' + element.name + "</option>");
    });
  }

  //add thong tin khach hang
  <%if(khachHang!=null){%>
  $("#name-customer").val("<%=khachHang.getTenKH()%>");
  $("#phone-customer").val("<%=khachHang.getSdt()%>");
  $("#email-customer").val("<%=khachHang.getEmail()%>");
  $("#address-customer").val("<%=khachHang.getDiaChi()%>");
  $("#tinh-thanh-pho").val("<%=khachHang.getTinhTP()%>");
  $("#quan-huyen").val("<%=khachHang.getQuanHuyen()%>");
  $("#phuong-xa").val("<%=khachHang.getPhuongXa()%>");
  <%}%>

</script>
</html>