$(function() {
  $(".cloud_tag").on('click', function(event) {
    event.preventDefault();
    var txt = $.trim($(this).html());

     if ($(".text-box").html() != '') {
       $(".text-box").append(", ");
     }

    $(".text-box").append(txt);
  });
});


$('.nav-tabs li').each(function(index, li) {
    var element = $(li);
     if (element.attr("class") == "active"){
          elementAlreadyActive = true;
     }

});
if (!elementAlreadyActive){
    $('.nav-tabs li:first').addClass('active');
    $('.tab-content div:first').addClass('active');
} });