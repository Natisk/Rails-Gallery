$(document).ready(function(){

    // The number of seconds that the slider will auto-advance in:
    var changeEvery = 2;
    var itvl = setInterval(function(){autoAdvance()},changeEvery*1000);
    var totWidth=0;
	var positions = new Array();
    var current = 1;

    function autoAdvance()
    {
        if(current == -1) return false;

        $('#menu ul li span').eq(current%5).trigger('click',[true]);	// [true] will be passed as the keepScroll parameter of the click function on line 28
        current++;
//        if(current > 5) {
//            current = 5;
//        }
    }

    $('#menu ul li.menuItem:first').addClass('act').siblings().addClass('inact');
	
	$('#slides .slide').each(function(i){
		
		/* Traverse through all the slides and store their accumulative widths in totWidth */
		
		positions[i]= totWidth;
		totWidth += $(this).width();
		
		/* The positions array contains each slide's commulutative offset from the left part of the container */

//      this fires alert if you didnt set images width and height
//		if(!$(this).width())
//		{
//			alert("Please, fill in width & height for all your images!");
//			return false;
//		}
		
	});
	
	$('#slides').width(totWidth);
	/* Change the cotnainer div's width to the exact width of all the slides combined */

	$('#menu ul li span').click(function(e,keepScroll) {

			$('li.menuItem').removeClass('act').addClass('inact');
			$(this).parent().addClass('act');
			
			var pos = $(this).parent().prevAll('.menuItem').length;
			
			$('#slides').stop().animate({marginLeft:-positions[pos]+'px'},450);
			/* Start the sliding animation */

//          if you are using tag a to wrap your images in div#menu
//			e.preventDefault();
			/* Prevent the default action of the link */
			
			
			// Stopping the auto-advance if an icon has been clicked:
			if(!keepScroll){
                clearInterval(itvl);
                current = parseInt($(this).attr('id'));
                itvl = setInterval(function(){autoAdvance()},changeEvery*1000);
            }


//            current = parseInt($(this).attr('id'));
//            current = 1
//            current ++;
//            alert(current);
//            clearInterval(itvl);
//            itvl = setInterval(function(){autoAdvance()},changeEvery*1000);
	});

	/* End of customizations */

});