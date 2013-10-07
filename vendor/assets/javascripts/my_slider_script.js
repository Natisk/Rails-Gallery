$(document).ready(function() {

    var changeEvery = 5;
    var itvl = setInterval(function(){autoAdvance()},changeEvery*1000);
    var totWidth=0;
	var positions = new Array();
    var current = 1;

    function autoAdvance() {
        $('#menu li span').eq(current%$('#menu li span').length).trigger('click',[true]);
        current++;
    }

    $('#menu li.menuItem:first').addClass('act').siblings().addClass('inact');
	
	$('#slides .slide').each(function(i) {
		
		positions[i]= totWidth;
		totWidth += $(this).width();

	});
	
	$('#slides').width(totWidth);

	$('#menu li span').click(function(e,keepScroll) {
        $('li.menuItem').removeClass('act').addClass('inact');
        $(this).parent().addClass('act').removeClass('inact');

        var pos = $(this).parent().prevAll('.menuItem').length;

        $('#slides').stop().animate({marginLeft:-positions[pos]+'px'},450);

        if(!keepScroll) {
            clearInterval(itvl);
            current = parseInt($(this).attr('id'));
            itvl = setInterval(function(){autoAdvance()},changeEvery*1000);
        }
	});

});