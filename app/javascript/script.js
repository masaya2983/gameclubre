// Swiperのオプションを定数化
const opt = {
  loop: true,
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  scrollbar: {
    el: '.swiper-scrollbar',
    draggable: true
  }
}

// Swiperを実行(初期化)
$(document).on('turbolinks:load', function() {
  let swiper = new Swiper('.swiper',opt);
});