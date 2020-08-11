window.addEventListener('DOMContentLoaded', function(){
  
  let submit = $("#payment_card_submit_button");
  Payjp.setPublicKey('pk_test_563a06f9327b476340f0aa79');

    submit.on('click', function(e){
    e.preventDefault();

    let card = {
        number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_card_month").val(),
        exp_year: $("#payment_card_year").val()
    };
    console.log(card);
    Payjp.createToken(card, function(status, response) { 
      if (status === 200) { 
        $("#payment_card_no").removeAttr("name");
        $("#payment_card_cvc").removeAttr("name");
        $("#payment_card_month").removeAttr("name");
        $("#payment_card_year").removeAttr("name"); 
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        ); 
        document.inputForm.submit();
        alert("登録が完了しました"); 
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});
