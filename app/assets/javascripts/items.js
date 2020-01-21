$(document).ready(function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][source]"
                    id="item_images_attributes_${index}_source"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  function appendMessage(){
    const message = `<div>これ以上の投稿はできません</div>`
    $('#image-box').append(message)
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    if ($('.js-file').length < 10) {
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }else{
      appendMessage()
    }
     
    
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});