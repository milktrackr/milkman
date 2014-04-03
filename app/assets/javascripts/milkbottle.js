function milkBottle(percent){
  // $('#milk-fill').css.top(0);
  // resetBottle();
  // gon.current_measurement

  var offset = (percent*310)+20

  $('#milk-fill').animate({
    top: "-="+offset
  },700,function(){});
}

$(document).ready(function(){
  milkBottle(gon.current_measurement/2000);
});

//Mostly for testing
function resetBottle(){
  $('#milk-fill').css('top',0); 
}

//767 breakpoint ?
