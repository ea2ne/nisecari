$(function(){
  const buildFileField = (num)=> {
    const html =  `<label class="js-file_group" data-index="${num}">
                    <i class="far fa-image Form__icon"></i>
                    <input class="js-file" style="visibility: hidden" 
                    type="file"
                    name="item[item_images_attributes][${num}][url]"
                    id="item_images_attributes_${num}_src">
                  </label>
                  <span class="js-remove">削除</span>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" id='prv_${index}' src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
  
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    console.log('OK')
    const targetIndex = $(this).prev().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    console.log(targetIndex);
    console.log(hiddenCheck);
    
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(`#prv_${targetIndex}`).remove();
    $(this).prev().remove();
    $(this).remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

$(window).on("load resize", function(){
  let width = $(".user_body_image").width();
  $(".user_body_image").css({"height": width});
});