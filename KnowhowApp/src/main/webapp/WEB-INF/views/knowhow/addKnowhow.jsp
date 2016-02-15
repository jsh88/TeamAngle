<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog" id="addDialog"></div>
<div class="modal fade" id="addInputModal">
	<div class="modal-dialog" id="addInputDialog">
		<div class="modal-content" id="addInputContent">
			<div id="inputWrap">
				<div id="Closeimg2" onclick="$('#addInputModal').modal('hide')">
					<img style="width: 20px;" src="resources/images/close.png" />
				</div>
				<div id="inputTitle">
					<div class="form-group">
						<label for="addtitle" class="col-sm-12 control-label"
							id="titlelabel">Please enter a Video url</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="inputurl" name="url"
								maxlength="80" />
						</div>
					</div>
					<div id="buttonGroup">
						<button type="button" class="btn btn-success addbtn" id="inputBtn">
							<b>Enter</b>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div id="addKnowhowInfoModal" class="modal fade">
		<div class="modal-dialog" id="addKnowhowInfoDialog">
			<div id ="addInfoViewImg">
				<img src="resources/images/addKnowhow.png"/>
			</div>
		</div>
	</div>	