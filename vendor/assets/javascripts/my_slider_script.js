$(document).ready(function() {

  var changeEvery = 5;
  var gap = setInterval(function(){autoAdvance()},changeEvery*1000);
  var totWidth=0;
  var positions = new Array();
  var current = 1;

  function autoAdvance() {
    $('#slide-nav li span').eq(current%$('#slide-nav li span').length).trigger('click',[true]);
    current++;
  }

  $('#slide-nav li.slide-item:first').addClass('active').siblings().addClass('nonactive');

  $('#slides .slide').each(function(i) {
    positions[i]= totWidth;
    totWidth += $(this).width();
  });

  $('#slides').width(totWidth);

  $('#slide-nav li span').click(function(e,keepScroll) {
    $('li.slide-item').removeClass('active').addClass('nonactive');
    $(this).parent().addClass('active').removeClass('nonactive');

    var pos = $(this).parent().prevAll('.slide-item').length;

    $('#slides').stop().animate({marginLeft:-positions[pos]+'px'},450);

    if(!keepScroll) {
      clearInterval(gap);
      current = parseInt($(this).attr('id'));
      gap = setInterval(function(){autoAdvance()},changeEvery*1000);
    }
  });

});