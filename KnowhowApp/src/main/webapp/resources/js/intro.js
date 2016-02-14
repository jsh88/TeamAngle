/* intro btn 제이쿼리문 */
	$(document).ready(function (){
		$("#introMode").carousel({ interval: 11000 });
		
		$("#clickBtn1").click(function(){
			$("#introMode").carousel(0);
		});
		$("#clickBtn2").click(function(){
			$("#introMode").carousel(1);
		});
		$("#clickBtn3").click(function(){
			$("#introMode").carousel(2);
		});
		$("#clickBtn4").click(function(){
			$("#introMode").carousel(3);
		});

	});
/* 각 intro 1, 2, 3, 4 */
	$(document).ready(function() {
		$('.intro1_wrap').css('height', $(window).height());
		$(window).resize(function() {
			$('.intro1_wrap').css('height', $(window).height());
		});
	});
	$(document).ready(function() {
		$('.intro2_wrap').css('height', $(window).height());
		$(window).resize(function() {
			$('.intro2_wrap').css('height', $(window).height());
		});
	});
	$(document).ready(function() {
		$('.intro3_wrap').css('height', $(window).height());
		$(window).resize(function() {
			$('.intro3_wrap').css('height', $(window).height());
		});
	});
	$(document).ready(function() {
		$('.intro4_wrap').css('height', $(window).height());
		$(window).resize(function() {
			$('.intro4_wrap').css('height', $(window).height());
		});
	});
	