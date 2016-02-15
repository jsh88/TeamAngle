<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
	$("#Continuebtn").hide();
	$("#Priorbtn").hide();
	$("#hideList").hide();
	$("#middle").hide();
	$("#startModalInfoView").hide();
	
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
	
	$("#startModalInfoImg").mouseover(function(){
		
		$("#startPostingInfoModal").modal();
		
	});
	
	$("#InfoViewImg").mouseout(function(){
		
		$("#startPostingInfoModal").modal('hide');
		
	});

	$(".atitle").click(function() {

		var t = $(this).text();

		$("#addtitle").val(t);
		preventDefault();
	});
	
});
</script>
	<div class="modal-dialog" id="startModalDialog">
 	<div id="startModalInfo">
 		<div id="startModalBlankLine">&nbsp;</div>
 		<div id="startModalInfoImg">
 			<img style="width:55px;" src="resources/images/Info.png"/>
 		</div>
 	</div>
 <div class="modal-content" id="startModalContent">
	<div id="addCheckWrap">
		<div id="addForm">
			<form name="addTitleForm" action="addPost" method="post" onsubmit="return false;">
				<div id="startTitle">
							<div class="form-group">
								<label for="addtitle" class="col-sm-12 control-label" id="titlelabel">Please enter a post title!</label>
								<div class="col-sm-12">
							     	<input type="text" class="form-control" id="addtitle" name="title" maxlength="40"/> 
								</div>
							</div>
							<div id="startButtonGroup">
								<button type="button" class="btn btn-success startbtn" id="Createbtn" onclick="addKnowhow()"><b>Create Post</b></button>
								<button type="button" class="btn btn-success startbtn" id="Continuebtn"><b>Continue to Posting</b></button>
								<button type="button" class="btn btn-warning startbtn" id="Recallingbtn"> <b>Recalling Post</b></button>
								<button type="button" class="btn btn-warning startbtn" id="Priorbtn"> <b>Fold</b></button>
							</div>	
					</div>
			</form>
		</div>
	</div>
		</div>
		<div id="middle"></div> <!--  연결고리 -->
		<div class="modal-content" id="hideList" >
			<div id="hideListWrap" style="overflow:auto; overflow-x:hidden;">
				
			</div>
		</div>
	</div>
	<div id="startPostingInfoModal" class="modal fade">
		<div class="modal-dialog" id="startPostingInfoDialog">
			<div id ="InfoViewImg">
				<img src="resources/images/startposting.png"/>
			</div>
		</div>
	</div>	