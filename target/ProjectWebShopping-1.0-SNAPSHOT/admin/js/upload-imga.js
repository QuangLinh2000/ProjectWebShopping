
var i = 0;
const image_input = document.querySelector("#file-upload");
var uploaded_image;

image_input.addEventListener('change', function() {
  const reader = new FileReader();
  reader.addEventListener('load', () => {
    uploaded_image = reader.result;

    
  $('.upload-imgae').prepend('<div class="row " id = "product'+i+'">'+
  '<div class="col-xl-1"></div>'+
  '<div class="col-xl-10">'+
   '<div class="col">'+
     '<div class="card card-product-grid">'+
       '<a href="#" class="img-wrap"> <img src="'+uploaded_image+'" alt="Product"> </a>'+
       '<div class="info-wrap row">'+
        '<div class="col-xl-4"></div>'+
         '<a  onclick = "delete_product(\'product'+i+'\')" href="#"  class="btn col-xl-4 btn-sm btn-outline-danger">'+
             '<i class="material-icons md-delete_forever"></i>  Delete'+
         '</a>'+
         '<div class="col-xl-4"></div>'+

       '</div>'+
     '</div> <!-- card-product  end// -->'+
   '</div> <!-- col.// -->'+
  '</div>'+

'</div>');

  });
if(this.files.length > 0) {
  reader.readAsDataURL(this.files[0]);
}
i++;

});
function delete_product(id){
    $('#'+id).remove();
}



