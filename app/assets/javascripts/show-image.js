$(function(){
  $('#is__photo__place__dots img').hover(function(){
      $('.is__photo__place__sample__stage__in__img img').attr('src', $(this).attr('src'));
  });
});