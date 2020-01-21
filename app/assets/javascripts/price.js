function 　commition(){
  let result = Math.floor($('#in-price').val() * 0.1)
  $('#in-commition').text(result + "円")
}
function 　profit(){
  let result = Math.floor($('#in-price').val() * 0.9)
  $('#in-profit').text(result + "円") 
}

$(function() {
  $('#in-price').on('keyup change', function() {
    commition();
    profit();
  });
});