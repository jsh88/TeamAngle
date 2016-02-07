
$(document).ready(function() {
/* myPage Ajax Div 움직임 */
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
	
/* memModify Ajax */
	
	$('#show1, #show2, #lq1, #lq2, #lq3, #lq4').hide();
	
	$('#edit_MemModify').click(function() {
		$('#show').show();	
		$('#show1, #show2, #lq1, #lq2, #lq3, #lq4').hide();
	});
	$('#p1').click(function() {
		$('#show1').show('slow');
		$('#lq1').hide();
		$('#lq2').hide();
		$('#lq3').hide();
		$('#lq4').hide();

	});

	$('#l1').click(function() {
		$('#show').hide('slow');
		$('#show2').first().show('slow', function lq1() {
			$('#lq1').show('slow');
			$('#lq2').hide(1000);
			$('#lq3').hide(1000);
			$('#lq4').hide(1000);
		});
	});
	$('#l2').click(function() {
		$('#show').hide('slow');
		$('#show2').first().show('slow', function lq1() {
			$('#lq2').show('slow');
			$('#lq1').hide(1000);
			$('#lq3').hide(1000);
			$('#lq4').hide(1000);
		});
	});
	$('#l3').click(function() {
		$('#show').hide('slow');
		$('#show2').first().show('slow', function lq1() {
			$('#lq3').show('slow');
			$('.s1').show('slow');
			$('.s2').show('slow');

			$('#lq1').hide(1000);
			$('#lq2').hide(1000);
			$('#lq4').hide(1000);
		});
	});
	$('#l4').click(function() {
		$('#show').hide('slow');
		$('#show2').first().show('slow', function lq1() {
			$('#lq4').show('slow');
			$('#lq1').hide(1000);
			$('#lq2').hide(1000);
			$('#lq3').hide(1000);
		});
	});

/* 로그인 Ajax */
	$("#lg_findId").hide();
	$("#lg_findPass").hide();
	
	
		$("#find_id").click(function(){
			if($("#lg_findId").css("display")=='none') {
				$("#lg_findId").show();
			} else {
				$("#lg_findId").hide();
			}
		});
		$("#find_email").click(function(){
			if($("#lg_findPass").css("display")=='none') {
				$("#lg_findPass").show();
			} else {
				$("#lg_findPass").hide();
			}
		});
	
});
