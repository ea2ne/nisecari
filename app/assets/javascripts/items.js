$(function () {
  console.log("test1")
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[item_images_attributes][${index}][src]"
                    id="product_item_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#new_item').on('change', '.js-file', function(e) {
    // const dataIndex = $(this).data("index");
    $('.new_item').append(buildFileField(fileIndex[0]));
    // $('#sell__main__content__file__box').append(dataIndex + 1);
    fileIndex.shift();
    console.log("test2")

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    console.log("test3")

  });

  // $('.new_item').on('click', function() {
  //   const fileField = $('.js-file:last');
  //   fileField.trigger("click");
  // });

  $('.js').on('click', '.js-remove', function() {
    console.log("test4")
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    if ($('.js-file').length == 0) $('js').append(buildFileField(fileIndex[0]));
    console.log("test5")
  });
});