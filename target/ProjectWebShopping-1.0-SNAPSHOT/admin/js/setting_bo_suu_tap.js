
const image_input1 = document.querySelector("#file-upload-1");
const image_input2 = document.querySelector("#file-upload-2");

var uploaded_image1;
var uploaded_image2;


image_input1.addEventListener('change', function() {
  const reader = new FileReader();
  reader.addEventListener('load', () => {
    uploaded_image1 = reader.result;

    $('#img-1').attr('src', uploaded_image1);

  });
if(this.files.length > 0) {
  reader.readAsDataURL(this.files[0]);
}

});


image_input2.addEventListener('change', function() {
    const reader = new FileReader();
    reader.addEventListener('load', () => {
      uploaded_image2 = reader.result;
  
      $('#img-2').attr('src', uploaded_image2);
  
    });
  if(this.files.length > 0) {
    reader.readAsDataURL(this.files[0]);
  }
  
  });

  function edit(number) {
      $('.clear-'+number).css('visibility', 'visible');
      $('#tilte-'+number).removeAttr('disabled');
      $('#dicription-'+number).removeAttr('disabled');
      $('#file-upload-'+number).css('visibility', 'visible');
  }

  function clear_all(number) {
    $('#tilte-'+number).attr('value', '');
    $('#dicription-'+number).html( '');
  }



