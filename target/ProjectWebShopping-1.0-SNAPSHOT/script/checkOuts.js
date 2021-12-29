var array;
var valueTinhThanhPho = "Tỉnh/Thành Phố";
var arrayQuanHuyen;
var valueQuanHUyen = "Quận / Huyện";
var arrayPhuongXa;
$.getJSON("../data/local.json", function (json) {
  // console.log(json); // this will show the info it in firebug console
  array = json;
  console.log(array[0]);
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
