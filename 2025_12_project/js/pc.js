function scrollToElement1() {
  document.getElementById('targetElement1').scrollIntoView({
      behavior: 'smooth',
      block: 'center'
  });
}

function scrollToElement2() {
  document.getElementById('targetElement2').scrollIntoView({
      behavior: 'smooth',
      block: 'center'
  });
}

function scrollToElement3() {
  document.getElementById('targetElement3').scrollIntoView({
      behavior: 'smooth',
      block: 'center'
  });
}

function scrollToElement4() {
  document.getElementById('targetElement4').scrollIntoView({
      behavior: 'smooth',
      block: 'center'
  });
}

function changeImg() {
  document.getElementById("img1").src = "./images/1.jpg";
}

// img_box_1 div 효과 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
document.addEventListener("DOMContentLoaded", function() {
  showMain_1(1);
  var tag1 = document.getElementById('color_box_1_tag1');
  tag1.style.background = '#7f8c8d';
  tag1.style.color = '#fff';
});
function showMain_1(num) {
  var mains = document.querySelectorAll('.image_1_box');
  mains.forEach(function(main) {
      main.style.display = 'none';
  });
  var selectedMain = document.querySelector('.image_1_js_' + num);
  if (selectedMain) {
      selectedMain.style.display = 'block';
      selectedMain.style.width = '100%'; 
      selectedMain.style.height = '100%';
  }

  var tags = document.querySelectorAll('.image_1 > div');
  tags.forEach(function(tag) {
      tag.style.color = 'black';
  });

  var selectedTag = document.getElementById('color_box_1' + num);
  if (selectedTag) {
      selectedTag.style.color = '#fff';
  }
} 
// // img_box_2 div 효과 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
document.addEventListener("DOMContentLoaded", function() {
  showMain_2(1);
  var tag1 = document.getElementById('color_box_2_tag1');
  tag1.style.background = '#7f8c8d';
  tag1.style.color = '#fff';
});
function showMain_2(num) {
  var mains = document.querySelectorAll('.image_2_box');
  mains.forEach(function(main) {
      main.style.display = 'none';
  });
  var selectedMain = document.querySelector('.image_2_js_' + num);
  if (selectedMain) {
      selectedMain.style.display = 'block';
      selectedMain.style.width = '100%'; 
      selectedMain.style.height = '100%';
  }

  var tags = document.querySelectorAll('.image_2 > div');
  tags.forEach(function(tag) {
      tag.style.color = 'black';
  });

  var selectedTag = document.getElementById('color_box_2' + num);
  if (selectedTag) {
      selectedTag.style.color = '#fff';
  }
} 