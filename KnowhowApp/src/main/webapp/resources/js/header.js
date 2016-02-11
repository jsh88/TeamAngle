
$(document).ready(function() {
	
	$('#navtag').css('width', $(window).width());
	
	$(window).resize(function() {
		$('#menu').css('height', $(window).height());
	});
	
	
	/* myPage JQuery Div 움직임 */
	
	$('#menu').hide();
	$('#menu').css('height', $(window).height() - 110);
	$(window).resize(function() {
		$('#menu').css('height', $(window).height() - 110);
	});

	$('#navbtn').click(function() {
		if ($('#menu').css('display') == 'none') {
			$('#menu').slideDown(1000);
		} else {
			$('#menu').slideUp(500);
		}
	});

	
/* header search */	

	var st = $("#search_txt").val();
	
	$("#search_txt").focus(function(){
		
		$("#search_txt").css("background-color" , "white").css("color","black");
		$("#search_btn").css("background-color", "white").css("color","black");
		
	});
		
	$("#search_txt").blur(function(){
		
		$("#search_txt").css("background-color" , "#535353").css("color","white");
		$("#search_btn").css("background-color", "#535353").css("color","white");
		
	});
	
	$(".recommenTag").click(function(){
		
		var recommen = $(this).text();
		var reTag = recommen.substring(1);
		
		$("#search_txt").val(reTag);
		
		
	});
	
	$("#search_txt").keypress(function(key){
	
		if(key.keyCode == 13) {
			
			if( st != "" || st != null) {
				alert("검색할 태그, 단어를 입력하세요.");
				return false;
			}
			
		}
		
	});
	
	
	
/* memModify JQuery */
	
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

/* 로그인 JQuery */
});
