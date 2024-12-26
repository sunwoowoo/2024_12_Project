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
// Car_color_box __________________________________________________________
document.addEventListener("DOMContentLoaded", function() {
    showMain(1);
});
function showMain(num) {
    var mains = document.querySelectorAll('.Car_type_box');
    mains.forEach(function(main) {
        main.style.display = 'none';
    });
    var selectedMain = document.querySelector('.Car_type_js_' + num);
    if (selectedMain) {
        selectedMain.style.display = 'block';
        selectedMain.style.width = '100%'; 
        selectedMain.style.height = '100%';
    }

    var tags = document.querySelectorAll('.Car_color > div');
    tags.forEach(function(tag) {
        tag.style.background = '#C6E7FF';
        tag.style.color = 'black';
    });

    var selectedTag = document.getElementById('Car_color' + num);
    if (selectedTag) {
        selectedTag.style.background = '#C6E7FF'; 
        selectedTag.style.color = '#fff';
    }
}
//  car_type________________________________________________________________________________
$(document).ready(function(){
    let container = document.querySelector('.Car_type_box_scroll ');
    container.addEventListener('scroll', function() {
    })
    var div_1 = document.getElementById('Car_type_divA');
    let chk_1 = false;
    let m_posX_1 = 0;
    let m_posY_1 = 0;
    
    div_1.addEventListener('mousedown',function(e){
    chk_1 = true;
    m_posX_1 = e.pageX;
    m_posY_1 = e.pageY;
    })
    
    window.addEventListener('mouseup',function(e){
    chk_1 = false;
    m_posX_1 = e.pageX;
    m_posY_1 = e.pageY;
    })

    const scrollContainer = document.querySelector(".Car_type_box_scroll ");
    scrollContainer.addEventListener("wheel", (evt) => {
        evt.preventDefault();
        scrollContainer.scrollLeft += evt.deltaY;
    });
    })
////
$(document).ready(function(){
    let container = document.querySelector('.Car_type_box_scroll ');
    container.addEventListener('scroll', function() {
    })
    var div = document.getElementById('Car_type_divB');
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

    const scrollContainer = document.querySelector(".Car_type_box_scroll ");
    scrollContainer.addEventListener("wheel", (evt) => {
        evt.preventDefault();
        scrollContainer.scrollLeft += evt.deltaY;
    });
    })
    ////
$(document).ready(function(){
    let container = document.querySelector('.Car_type_box_scroll ');
    container.addEventListener('scroll', function() {
    })
    var div = document.getElementById('Car_type_divC');
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

    const scrollContainer = document.querySelector(".Car_type_box_scroll ");
    scrollContainer.addEventListener("wheel", (evt) => {
        evt.preventDefault();
        scrollContainer.scrollLeft += evt.deltaY;
    });
    })    
    ////
$(document).ready(function(){
    let container = document.querySelector('.Car_type_box_scroll ');
    container.addEventListener('scroll', function() {
    })
    var div = document.getElementById('Car_type_divD');
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

    const scrollContainer = document.querySelector(".Car_type_box_scroll ");
    scrollContainer.addEventListener("wheel", (evt) => {
        evt.preventDefault();
        scrollContainer.scrollLeft += evt.deltaY;
    });
    })        
// section_3_______________________________________________________________________
function changeBg(colorOrImage) {
    let result = document.querySelector('#section_3_onclick');
    
    // 배경 설정 로직
    if (colorOrImage === 'green') {
        result.style.background = "url('./photos/ap_sec4.jpg') no-repeat center / cover";
        result.style.backgroundAttachment = "fixed";
    } else if (colorOrImage === 'orange') {
        result.style.background = "url('./photos/ap_sec5.png') no-repeat center / cover";
        result.style.backgroundAttachment = "fixed";
    } else if (colorOrImage === 'purple') {
        result.style.background = "url('./photos/ap_sec6.jpg') no-repeat center / cover";
        result.style.backgroundAttachment = "fixed";
    }
}
