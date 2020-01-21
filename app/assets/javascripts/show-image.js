$(function(){
  // 「imageList」内の「img」をマウスオーバーした場合
  $('#is__photo__place__dots img').hover(function(){
      // マウスオーバーしている画像をメインの画像に反映
      $('.is__photo__place__sample__stage__in__img img').attr('src', $(this).attr('src'));
  });
});