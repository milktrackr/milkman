function milkBottle(percent){
  // $('#milk-fill').css.top(0);
  // resetBottle();
  // gon.current_measurement

  var offset = (percent*310)+20

  $('#milk-fill').animate({
    top: "-="+offset
  },1000,function(){});
}

$(document).ready(function(){
  milkBottle(gon.current_measurement/2000);
});

//Mostly for testing
function resetBottle(){
  $('#milk-fill').css('top',0); 
}

// 20 = 0%
// 175 = 50%
// 370 = 100%

// 20 = 0%
// 155 = 50
// 330 = 100%