document.addEventListener("DOMContentLoaded", function() {
    showMain(1);
    var tag1 = document.getElementById('nav_section_tag1');
    tag1.style.background = '#7f8c8d';
    tag1.style.color = '#fff';
});
function showMain(num) {
    var mains = document.querySelectorAll('.content-section_box');
    mains.forEach(function(main) {
        main.style.display = 'none';
    });
    var selectedMain = document.querySelector('.content_js_' + num);
    if (selectedMain) {
        selectedMain.style.display = 'block';
        selectedMain.style.width = '100%'; 
        selectedMain.style.height = '100%';
        selectedMain.style.background = '#fff'; 
    }

    var tags = document.querySelectorAll('.nav-section > ul > li');
    tags.forEach(function(tag) {
        tag.style.background = '#dfe6e9';
        tag.style.color = 'black';
    });

    var selectedTag = document.getElementById('nav-section' + num);
    if (selectedTag) {
        selectedTag.style.background = '#7f8c8d'; 
        selectedTag.style.color = '#fff';
    }
}