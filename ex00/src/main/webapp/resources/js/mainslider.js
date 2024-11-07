let swiper = new Swiper('.mySwiper', {
    loop: true,
    slidesPerView: 6,
    freeMode: true,
    watchSlidesProgress: true,
    autoplay: {
        delay: 500000,
        disableOnInteraction: false,
    },
});

let swiper2 = new Swiper('.mySwiper2', {
    loop: true,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    thumbs: {
        swiper: swiper,
    },
    autoplay: {
        delay: 500000,
        disableOnInteraction: false,
    },
});
