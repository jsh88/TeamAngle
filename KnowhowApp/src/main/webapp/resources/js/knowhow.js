$(document).ready(function() {

	// startPosting
	$("#Continuebtn").hide();
	$("#Priorbtn").hide();
	$("#hideList").hide();
	$("#middle").hide();

	$("#Recallingbtn").click(function() {
		/* $("#ModalDialog").css('margin-top','300px'); */
		$("#Createbtn").hide();
		$("#Continuebtn").show();
		$("#Recallingbtn").hide();
		$("#Priorbtn").show();
		$("#middle").slideToggle(400);
		$("#hideList").slideToggle(400);
		$("#middle").show();
		$("#hideList").show();

	});

	$("#Priorbtn").click(function() {
		/* $("#ModalDialog").css('margin-top','350px'); */
		$("#Createbtn").show();
		$("#Recallingbtn").show();
		$("#Priorbtn").hide();
		$("#Continuebtn").hide();
		$("#middle").slideToggle(400);
		$("#hideList").slideToggle(400);
		$("#addtitle").val("");

	});

	$(".atitle").click(function() {

		var t = $(this).text();

		$("#addtitle").val(t);
		preventDefault();
	});

});
// end ready
