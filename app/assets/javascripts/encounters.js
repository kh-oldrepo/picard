$(function() {
  $(".cloud_tag").on('click', function(event) {
    event.preventDefault();
    var txt = $.trim($(this).html());
    $(".text-box").append(txt);
    $(".text-box").append(", ");
  });
});