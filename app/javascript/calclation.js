$( document ).on( 'change', '.sell__main__content__form__box__price__entire__right__input', function(){
  var s = $( this ).val();
  var result = s / 10;
  $('.sell__main__content__form__box__price__fee__left').html(result);
});