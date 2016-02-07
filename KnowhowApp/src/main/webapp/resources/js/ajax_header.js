/*
 * myPage Ajax 
 * Div 움직임
 * 
 */
$(document).ready(function() {
	$('#menu').hide();

	$('#menu').css('height', $(window).height() - 80);

	$(window).resize(function() {
		$('#menu').css('height', $(window).height() - 80);
	});

	$('#navbtn').click(function() {
		if ($('#menu').css('display') == 'none') {
			$('#menu').slideDown(1000);
		} else {
			$('#menu').slideUp(500);
		}
	});
});
