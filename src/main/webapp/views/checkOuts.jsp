<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkOuts.css">


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

  <div class="end-container-bottom">
    <div class="content-left">
      <p class="title-content-left">Thông tin thanh toán</p>

      <div class="login-box">
        <p class="introduce-sign">Bạn đã có tài khoản?</p>
        <a href="" class="sign-content-left">Đăng nhập</a>

      </div>
      <div class="box-content-left">
        <div class="input-item-content-box">
          <input class="input-item" placeholder="Họ và tên" type="text">
          <div class="error-box">
            <p class="error-text">Họ và tên không được để trống</p>
          </div>
        </div>
        <div class="input-item-content-box">
          <input class="input-item" placeholder="Email" type="email">
        </div>
        <div class="input-item-content-box">
          <input class="input-item" placeholder="Điện Thoại" type="number">
          <div class="error-box">
            <p class="error-text">Số điện thoại không được để trống</p>
          </div>
        </div>
        <div class="input-item-content-box">
          <input class="input-item" placeholder="Địa chỉ" type="text">
          <div class="error-box">
            <p class="error-text">Địa chỉ không được để trống</p>
          </div>
        </div>

        <div class="dia-diem">
          <div class="input-item-content-box">
            <select class="diem-diem-item" onChange="clickTinhThanhPho(this)" id="tinh-thanh-pho">
              <option value="">Tỉnh/Thành Phố</option>
            </select>
            <div class="error-box">
              <p class="error-text">Không được để trống</p>
            </div>
          </div>
          <div class="input-item-content-box">
            <select class="diem-diem-item" onchange="clickQuanHuyen(this)" id="quan-huyen">
              <option value="">Quận/Huyện</option>
            </select>
            <div class="error-box">
              <p class="error-text">Không được để trống</p>
            </div>
          </div>
          <div class="input-item-content-box">
            <select class="diem-diem-item" id="phuong-xa">
              <option value="">Phường/xã</option>
            </select>
            <div class="error-box">
              <p class="error-text">Không được để trống</p>
            </div>
          </div>



        </div>
        <div class="button-click">
          <input class="billing_address billing_address_1" type="button" value="Giỏ hàng">
          <input class="billing_address billing_address_2" type="button" value="Thanh toán">
        </div>


      </div>
    </div>
    <div class="bettwent-content"></div>
    <div class="content-right-box">
      <p class="title-content-right">Sản Phẩm</p>
      <div class="box-item-content-right">

        <div class="item-content-right">
          <i class="fa-solid fa-xmark"></i>
          <img class="img-item-content-right" src="../img/Dam-hoa-xanh-D00869/1.jpg" alt="">
          <p class="name-product-item">Quần Âu Dài Seven.AM Chất Thô Màu Đỏ Gạch Mã V301010D</p>
          <input min="1" class="so-luong" value="5" type="number">
          <p class="price-product-item">994.987 đ</p>
        </div>
        <div class="item-content-right">
          <i class="fa-solid fa-xmark"></i>

          <img class="img-item-content-right" src="../img/Dam-hoa-xanh-D00869/1.jpg" alt="">
          <p class="name-product-item">Quần Âu Dài Seven.AM Chất Thô Màu Đỏ Gạch Mã V301010D</p>
          <input min="1" class="so-luong" value="6" type="number">
          <p class="price-product-item">994.987 đ</p>
        </div>
        <div class="item-content-right">
          <i class="fa-solid fa-xmark"></i>

          <img class="img-item-content-right" src="../img/Dam-hoa-xanh-D00869/1.jpg" alt="">
          <p class="name-product-item">Quần Âu Dài Seven.AM Chất Thô Màu Đỏ Gạch Mã V301010D</p>
          <input min="1" class="so-luong" value="7" type="number">
          <p class="price-product-item">994.987 đ</p>
        </div>
        <div class="item-content-right">
          <i class="fa-solid fa-xmark"></i>

          <img class="img-item-content-right" src="../img/Dam-hoa-xanh-D00869/1.jpg" alt="">
          <p class="name-product-item">Quần Âu Dài Seven.AM Chất Thô Màu Đỏ Gạch Mã V301010D</p>
          <input min="1" class="so-luong" value="2" type="number">
          <p class="price-product-item">994.987 đ</p>
        </div>
        <div class="item-content-right">
          <i class="fa-solid fa-xmark"></i>

          <img class="img-item-content-right" src="../img/Dam-hoa-xanh-D00869/1.jpg" alt="">
          <p class="name-product-item">Quần Âu Dài Seven.AM Chất Thô Màu Đỏ Gạch Mã V301010D</p>
          <input min="1" class="so-luong" value="2" type="number">
          <p class="price-product-item">994.987 đ</p>
        </div>
      </div>
      <div class="bar-content-right-box"></div>
      <div class="box-check-out-mony">
        <p class="title-left-check-out">Tạm tính</p>
        <p class="title-right-check-out">343.566 đ</p>

      </div>
      <div class="box-check-out-mony">
        <p class="title-left-check-out">Phí ship</p>
        <p class="title-right-check-out">343.566 đ</p>
      </div>
      <div class="bar-content-right-box"></div>
      <div class="box-check-out-mony">
        <p class="title-left-check-out title-left-check-out-sum">Tổng tiền</p>
        <p class="title-right-check-out">343.566 đ</p>

      </div>
    </div>


  </div>
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
  //get element class name billing_address_2 envent click
  document.querySelectorAll('.input-item-content-box .input-item').forEach(function (item) {
    item.addEventListener('keyup', function () {
      let err = item.closest('.input-item-content-box').querySelector('.error-box')

      if (err) {
        if (item.value.trim() === '') {
          err.classList.add('active');
        } else {
          err.classList.remove('active');
        }
      }
    });

  });

  document.getElementsByClassName('billing_address_2')[0].addEventListener('click', function () {
    document.querySelectorAll('.input-item-content-box .input-item').forEach(function (item) {
      let err = item.closest('.input-item-content-box').querySelector('.error-box')
      if(err) {
        if (item.value.trim() === '') {
          err.classList.add('active');
        } else {
          err.classList.remove('active');
        }
      }
    });
    document.querySelectorAll('.dia-diem .diem-diem-item').forEach(function (item) {
      select_event(item);
    });
  });
  //fuction event select != index 1
  function select_event(select) {
    let index = select.selectedIndex;
    let err = select.closest('.input-item-content-box').querySelector('.error-box')
    // get index select
    if (index===0) {
      err.classList.add('active');
    }else {
      err.classList.remove('active');
    }
  }
  document.querySelectorAll('.dia-diem .diem-diem-item').forEach(function (item) {
    item.addEventListener('change', function () {
      select_event(item);
    });
  });
</script>
</html>