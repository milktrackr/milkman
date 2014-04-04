function milkBottle(percent){
  // $('#milk-fill').css.top(0);
  // resetBottle();
  // gon.current_measurement

  var offset = (percent*310)+20

  $('#milk-fill').animate({
    top: "-="+offset
  },1000,loop);
}

$(".measurements.index").ready(function(){

  milkBottle(gon.current_measurement/2000);
});

//Mostly for testing
function resetBottle(){
  $('#milk-fill').css('top',0); 
}


function loop() {
    $("#milk-fill").animate({"top": "+=10px"},1000,function(){
        $("#milk-fill").animate({"top": "-=10px"},1000,function(){
            loop();
        });
    });
}