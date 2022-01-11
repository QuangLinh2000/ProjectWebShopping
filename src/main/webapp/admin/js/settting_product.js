//click add-kg button jquery
$(document).ready(function () {
  $("#add-kg").click(function () {
      //get the value of the input field
        var kg = $(".gia-thap").val();
        var price = $(".gia-cao").val();
    //append box-kg
    $(".box-kg").append(
      ' <div class="row border-bottom mt-4">'+
      ' <label class="col-xl-4">Từ '+kg+'đ</label><label class="col-xl-1" style="text-align: center;">-</label>'+
      '<label class="col-xl-4">  '+price+'₫</label>        <label class="text-end col-xl-1">     <div class="dropdown pb-3">      <a href="#" data-bs-toggle="dropdown" class="border"> <i      class="material-icons md-more_horiz"></i> </a><div class="dropdown-menu"><a class="dropdown-item edit-gia" >Chỉnh sửa</a><a data-toggle="modal" data-target="#exampleModalCenter" class="dropdown-item text-danger" href="#">Xóa</a></div></div> </label> </div>'
    );
    clickEditPrice();
  });

    
});
clickEditPrice();
function clickEditPrice() {
    //click class edit-gia button js
var edit_gia = document.getElementsByClassName('edit-gia');
for (var i = 0; i < edit_gia.length; i++) {
    edit_gia[i].addEventListener('click', function () {
        //closet parent box-price

       var smallPrice =  getNumber($(this).closest('.box-price').find('.from-price').text());
       var bigPrice =  getNumber($(this).closest('.box-price').find('.to-price').text());
        //add attribute data-id

       $(".gia-thap").attr('value' ,smallPrice);
        $(".gia-cao").attr('value' , bigPrice);
         //display none 
        $("#add-kg").css('display', 'none');
        //display block
        $("#cancel-kg").css('display', 'inline');
        $("#thay-doi-kg").css('display', 'inline');
        
    });
}

}
//get number in string
function getNumber(str) {
    return str.replace(/[^0-9]/g, '');
}
