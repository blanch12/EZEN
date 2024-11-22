let currentIndex = 0;
const slideWidth = 300 + 10;
const track = document.getElementById('sliderTrack');
const slides = Array.from(track.children);
const totalSlides = slides.length;

track.appendChild(slides[0].cloneNode(true));
track.insertBefore(slides[totalSlides - 1].cloneNode(true), slides[0]);

currentIndex = 1;
track.style.transform = `translateX(${-currentIndex * slideWidth}px)`;

function slideRight() {
    currentIndex++;
    track.style.transform = `translateX(${-currentIndex * slideWidth}px)`;

    if (currentIndex === totalSlides + 1) {
        setTimeout(() => {
            track.style.transition = 'none';
            currentIndex = 1;
            track.style.transform = `translateX(${-currentIndex * slideWidth}px)`;
            setTimeout(() => {
                track.style.transition = 'transform 0.5s ease';
            }, 50);
        }, 500);
    }
}

function slideLeft() {
    currentIndex--;
    track.style.transform = `translateX(${-currentIndex * slideWidth}px)`;

    if (currentIndex === 0) {
        setTimeout(() => {
            track.style.transition = 'none';
            currentIndex = totalSlides;
            track.style.transform = `translateX(${-currentIndex * slideWidth}px)`;
            setTimeout(() => {
                track.style.transition = 'transform 0.5s ease';
            }, 50);
        }, 500);
    }
}
