$(function () {
  console.log("test1")
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][src]"
                    id="item_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="120px" height="90px" class="image-index">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $(".pic-up").on('click', function() {
    const file_field = $(".js-file:last"); // 一番最後のfile_field（新規でアップロードする箇所）を取得
    file_field.trigger("click"); // file_fieldをクリックさせる。

  })

  $(document).on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('url', blobUrl);
    } else {
      // メンターさんによるコード
      // const dataIndex = $(this).data("index");

      if ($(".image-index").length < 2) {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('.js-file_group').append(buildFileField(fileIndex[0]));
      } else {
        console.log("投稿できる画像は10枚までです。")
        alert("投稿できる画像は10枚までです。消したい画像をクリックしてください。");

        // return false;
      }


      // メンターさんによるコード
      // $('#sell__main__content__file__box').append(dataIndex + 1);
      fileIndex.shift();
      console.log("test2")

      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      console.log("test3")
    }
  });
      // メンターさんによるコード
  // $('.new_item').on('click', function() {
  //   const fileField = $('.js-file:last');
  //   fileField.trigger("click");
  // });

  $('.js').on('click', 'img', function() {
    console.log("test4")
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    if ($('.js-file').length == 0) $('js').append(buildFileField(fileIndex[0]));
    console.log("test5")
      $(`img[data-index="${targetIndex}"]`).remove();
  });
});