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