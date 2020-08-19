$(function(){
  $("#price-result").on('keyup', function(){
    var price = $("#price-result").val();
    if( 300 <= price && price <= 9999999) {
    var fee = Math.floor(price / 10);
    var profit = (price - fee);
    $(".sell__main__content__form__box__price__fee__right").text(fee);
    $(".sell__main__content__form__box__price__profit__right").text(profit);
    }else{
    $(".sell__main__content__form__box__price__fee__right").text('');
    $(".sell__main__content__form__box__price__profit__right").text('');
    }
  })
});