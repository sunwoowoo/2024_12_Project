// section_1__________________________________________
$(document).ready(function(){
    const slider = document.getElementById('slider_1');
    const slides = slider.children;
    const totalSlides = slides.length;
    const prevButton = document.getElementById('prev');
    const nextButton = document.getElementById('next');
    const dotsContainer = document.getElementById('dots');

    let currentSlide = 0;

    // 동그라미 생성
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
    // 슬라이드 위치 업데이트
    function updateSliderPosition() {
        const translateValue = -currentSlide * 100; // 슬라이드 위치 계산
        slider.style.transform = `translateX(${translateValue}%)`;
    }

    // 동그라미 상태 업데이트
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

    // 이전 슬라이드
    function showPrevSlide() {
        if (currentSlide > 0) {
            currentSlide--;
        } else {
            currentSlide = totalSlides - 1; // 순환 이동
        }
        updateSliderPosition();
        updateDots();
    }

    // 다음 슬라이드
    function showNextSlide() {
        if (currentSlide < totalSlides - 1) {
            currentSlide++;
        } else {
            currentSlide = 0; // 순환 이동
        }
        updateSliderPosition();
        updateDots();
    }

    prevButton.addEventListener('click', showPrevSlide);
    nextButton.addEventListener('click', showNextSlide);

    // 초기화
    createDots();
    updateDots();  
}
)
//  car_type________________________________________________________________________________
$(document).ready(function(){
    let container = document.querySelector('car_type_box');
    container.addEventListener('scroll', function() {
    })
    var div = document.getElementById('Car_type_scroll');
    let chk = false;
    let m_posX = 0;
    let m_posY = 0;
    div.addEventListener('mousedown',function(e){
    chk = true;
    m_posX = e.pageX;
    m_posY = e.pageY;
    })
    
    window.addEventListener('mouseup',function(e){
    chk = false;
    m_posX = e.pageX;
    m_posY = e.pageY;
    })
    
    const scrollContainer = document.querySelector("car_type_box");
    scrollContainer.addEventListener("wheel", (evt) => {
        evt.preventDefault();
        scrollContainer.scrollLeft += evt.deltaY;
    });
    })