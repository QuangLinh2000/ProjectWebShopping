$(document).ready(function(){
    $(".right-contain-item-image-small-item").hover(function(){
        var url = $(this).attr("urlImage");
       var parent =  $(this).parent();
      var parents =  $(parent).parent();
      var parentImage =  $(parents).find(".right-contain-item-box-image");
      $(parentImage).find(".right-contain-item-image").attr("src",url);
    //   $(".right-contain-item-image").attr("src",url);



    });
  });