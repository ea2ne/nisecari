$(function (){
  function buildHTML(comment){
    let html = `<div class = "comment-field"> 
                  <div class = "comment-user">
                    ${comment.user_name}
                  </div>
                  <div class = "comment-text">
                    ${comment.text}
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax ({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }) 
    .done(function(data){
      let html = buildHTML(data);
      if (data.text !== "") {
      $('.comment-area').append(html);
      $('.comment').val('');
      $('.commentbutton').prop('disabled', false);
      }else {
        $('.commentbutton').prop('disabled', false);
        alert("メッセージを入力してください")
      }
    })
    .fail(function(){
      alert('error');
    });
  })
});