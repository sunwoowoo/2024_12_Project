document.querySelectorAll('.pagination a').forEach((link) => {
  link.addEventListener('click', (event) => {
    event.preventDefault(); // 기본 동작 방지
    link.classList.toggle('checked'); // 체크 상태 토글
  });
});
//  버튼 클릭 이벤트 _______________________________________________________________________________
function showMain(num) {
    // 가격과 주행 거리 박스를 모두 숨김
    var priceBoxes = document.querySelectorAll('.section1_list_2 .section1_box');
    var mileageBoxes = document.querySelectorAll('.section1_list_3 .section1_box');
    
    priceBoxes.forEach(function(box) {
        box.classList.remove('show');
    });
    mileageBoxes.forEach(function(box) {
        box.classList.remove('show');
    });
    
    // 선택된 차 종류에 맞는 가격 및 주행거리 박스를 표시
    var selectedPrice = document.querySelector('.section1_list_2 .type_js_' + num);
    var selectedMileage = document.querySelector('.section1_list_3 .type_js_' + num);

    if (selectedPrice) {
        selectedPrice.classList.add('show');
    }
    if (selectedMileage) {
        selectedMileage.classList.add('show');
    }

    // 차 종류 버튼의 색 변경
    var tags = document.querySelectorAll('.section1_box_list > div');
    tags.forEach(function(tag) {
        tag.style.background = '#dfe6e9';
        tag.style.color = 'black';
    });

    var selectedTag = document.getElementById('section1_box_list' + num);
    if (selectedTag) {
        selectedTag.style.background = '#7f8c8d';
        selectedTag.style.color = '#fff';
    }
}
//  가격 이벤트 _______________________________________________________________________________
function highlight(element) {
    const allSpans = document.querySelectorAll('.price_range');
    allSpans.forEach(span => span.classList.remove('highlight'));

    element.classList.add('highlight');
}
//  주행 거리 이벤트 _______________________________________________________________________________
function mileagelist(element) {
    const allSpans = document.querySelectorAll('.mileage');
    allSpans.forEach(span => span.classList.remove('mileagelist'));

    element.classList.add('mileagelist');
}
