<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
		<div class="modal-dialog" id="startModalDialog">
    	<div class="modal-content" id="startModalContent">
	<div id="addCheckWrap">
		<div id="addForm">
			<form name="addTitleForm" action="addPost" method="post">
				<div id="startTitle">
							<div class="form-group">
								<label for="addtitle" class="col-sm-12 control-label" id="titlelabel">Please enter a post title!</label>
								<div class="col-sm-12">
							     	<input type="text" class="form-control" id="addtitle" name="title" maxlength="40"/> 
								</div>
							</div>
							<div id="startButtonGroup">
								<button type="submit" class="btn btn-success startbtn" id="Createbtn"><b>Create Post</b></button>
								<button type="submit" class="btn btn-success startbtn" id="Continuebtn"><b>Continue to Posting</b></button>
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