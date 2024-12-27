document.addEventListener("DOMContentLoaded", function () {
    const slider = document.getElementById('slider_1');
    const slides = slider.children;
    const totalSlides = slides.length;
    const prevButton = document.getElementById('prev');
    const nextButton = document.getElementById('next');
    const dotsContainer = document.getElementById('dots');

    let currentSlide = 0;

    function createDots() {
        for (let i = 0; i < totalSlides; i++) {
            const dot = document.createElement('div');
            dot.classList.add('dot');
            dot.dataset.index = i;
            dot.addEventListener('click', () => {
                currentSlide = i;
                updateSliderPosition();
                updateDots();
            });
            dotsContainer.appendChild(dot);
        }
    }

    function updateSliderPosition() {
        const translateValue = -currentSlide * 100; 
        slider.style.transform = `translateX(${translateValue}%)`;
    }

    function updateDots() {
        const dots = dotsContainer.children;
        Array.from(dots).forEach((dot, index) => {
            if (index === currentSlide) {
                dot.classList.add('active');
            } else {
                dot.classList.remove('active');
            }
        });
    }

    function showPrevSlide() {
        if (currentSlide > 0) {
            currentSlide--;
        } else {
            currentSlide = totalSlides - 1; 
        }
        updateSliderPosition();
        updateDots();
    }

    function showNextSlide() {
        if (currentSlide < totalSlides - 1) {
            currentSlide++;
        } else {
            currentSlide = 0; 
        }
        updateSliderPosition();
        updateDots();
    }

    prevButton.addEventListener('click', showPrevSlide);
    nextButton.addEventListener('click', showNextSlide);
    createDots();
    updateDots();
});
// 
document.addEventListener("DOMContentLoaded", function() {
    showMain(1);
});
function showMain(num) {
    var mains = document.querySelectorAll('.search_1_type_box');
    mains.forEach(function(main) {
        main.style.display = 'none';
    });
    var selectedMain = document.querySelector('.search_1_js_' + num);
    if (selectedMain) {
        selectedMain.style.display = 'flex';
        selectedMain.style.width = '100%'; 
        selectedMain.style.height = '100%';
    }

    var tags = document.querySelectorAll('.search_1_title > div');
    tags.forEach(function(tag) {
        tag.style.color = 'black';
    });

    var selectedTag = document.getElementById('search_1_title' + num);
    if (selectedTag) {
        selectedTag.style.color = '#fff';
    }
}