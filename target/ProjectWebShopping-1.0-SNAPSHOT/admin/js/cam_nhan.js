
$(document).ready(function(){
    $('#add-cam-nhan').click(function(){
        addNhanXet();
        clickChonAnh();

    });
    
});

function addNhanXet() {
    $("#box-them-cam-nhan").prepend(' <div class="row border-bottom pb-4 mt-4 box-parent">'+
    '<div class="col-md-5">'+

      '<div class="row" style="margin-top: 40px;">'+

        '<div class="col-xl-10">'+
          '<div class="col">'+
            '<div class="card card-product-grid">'+
              '<a style="height: 340px;" href="#" class="img-wrap"> <img id = "img-cam-nhan"'+
                  'src="../img/home_customer_img1.jpg" alt="Product"> </a>'+

            '</div> <!-- card-product  end// -->'+
          '</div> <!-- col.// -->'+
        '</div>'+

      '</div>'+
    '</div> <!-- col.// -->'+


    '<div class="col-md-7">'+

      '<div class="mb-3 pb-1">'+
        '<label class="form-label pb-2 col-xl-5 pb-4">Tên khách hàng</label>'+
        '<a class="btn btn-sm btn-light  btn-light-edit">'+
          '<i class="material-icons md-edit"></i> Chỉnh sửa'+
        '</a>'+
        '<a  data-toggle="modal" data-target="#exampleModalCenter" class="btn col-xl-3 btn-sm btn-outline-danger" style="margin-left: 10px;">'+
          '<i class="material-icons md-delete_forever"></i> xóa'+
        '</a>'+
        '<input class="form-control" type="text" name="" placeholder="Type here">'+
      '</div>'+

      '<div class="mb-3 ">'+
        '<label class="form-label pb-2">Nghề nghiệp</label>'+
        '<input class="form-control" type="text" name="" placeholder="Type here">'+
      '</div>'+

      '<div class="mb-3 pb-2">'+
        '<label class="form-label pb-2">Nhận xét khách hàng</label>'+
        '<textarea type="text" class="form-control pb-4"></textarea>'+
      '</div>'+

      '<div class="mb-3 ">'+
        '<input class="form-control file-upload" id="file-upload" accept=".jpg, .png" type="file">'+
      '</div>'+

    '</div> <!-- col.// -->'+

  '</div>');

}

$('.form-control').attr('disabled', true);

var button_edit = document.getElementsByClassName('btn-light-edit');
//click vào nút edit
for (var i = 0; i < button_edit.length; i++) {
    button_edit[i].addEventListener('click', function(){
         //closest form-control remove disabled 
        $(this).closest('.box-parent').find('.form-control').removeAttr('disabled');

    });
  }
       
  clickChonAnh();
function clickChonAnh() {
  var image_input1 = document.getElementsByClassName("file-upload");
  var uploaded_image1;
  //click vào nút upload
  console.log(image_input1.length);
  for (var i = 0; i < image_input1.length; i++) {
    image_input1[i].addEventListener('change', function(){
        //get the src of image
        var reader = new FileReader();      
          reader.addEventListener('load', () => {
            uploaded_image1 = reader.result;
        
            // $('#img-1').attr('src', uploaded_image1);
            $(this).closest('.box-parent').find('a img').attr('src', uploaded_image1);
             
          });
        if(this.files.length > 0) {
          reader.readAsDataURL(this.files[0]);
        }
      
    });
  }

}