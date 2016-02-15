<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog" id="modifyDialog"></div>
<div class="modal fade" id="modifyInputModal">
	<div class="modal-dialog" id="modifyInputDialog">
		<div class="modal-content" id="modifyInputContent">
			<div id="inputWrap">
				<div id="Closeimg2">
					<a href=""><img style="width: 20px;"
						src="resources/images/close.png" /></a>
				</div>
				<div id="inputTitle">
					<div class="form-group">
						<label for="addtitle" class="col-sm-12 control-label"
							id="titlelabel">Please enter a Video url</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="modifyInputUrl"
								name="url" maxlength="80" />
						</div>
					</div>
					<div id="buttonGroup">
						<button type="button" class="btn btn-success addbtn"
							id="modifyInputBtn">
							<b>Enter</b>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div id="modifyKnowhowInfoModal" class="modal fade">
		<div class="modal-dialog" id="modifyKnowhowInfoDialog">
			<div id ="modifyInfoViewImg">
				<img src="resources/images/modifyKnowhow.png"/>
			</div>
		</div>
	</div>	