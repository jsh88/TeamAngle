<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
	$(".mainTags").click(
			function() {

				// 		var mainTag = $(this).text();
				// 		var mainTagSub = mainTag.substring(1);
				searchWord = $(this).text().substring(1);

				// 		$("#search_txt").val(mainTagSub);

				$("#bestTitle").html(
						"<div class='searchResultTitle'>'" + searchWord
								+ "' 에 대한 검색결과	</div>");
				$("#listTitle").remove();
				$("#listLine").remove();
				$("#newPost").remove();
				$("#bestPost").remove();
				$("#bestLine").after(
						"<div class='col-md-12' id='bestPost'></div>");

				for (var i = 0; i < 5; i++) {

					getSearchPostView();
					searchWord++;

				}
			});

	$(".listWriterId")
			.mouseover(
					function() {

						var writer = $(this).text();

						$(this)
								.popover(
										{
											html : true,
											title : '<div id="popoverWrap"><div id="popoverImg"><img id="popupImg" style="width:50px;" src="resources/images/test.gif"/></div><div id="popoverUserNick">Test</div></div>',
											content : '<div id="popoverList"></div>',
											trigger : 'manual'
										})
								.on(
										"mouseenter",
										function() {
											var _this = this;
											$(this).popover("show");
											
											$("#popupImg").attr("src", 'resources/images/' + '${postView.image}');
											
											var formData = new FormData();
											formData.append("id", '${postView.id}');

											$.ajax({
												type : 'POST',
												url : 'getMemberTag',
												data : formData,
												processData : false,
												contentType : false,
												success : function(responseData, statusText, xhr) {

													var result = responseData;
													
													$("#popoverList").html(result);

												},
												beforeSend : function() {

													// 이미지 보여주기
													$('.wrap-loading').removeClass('display-none');

												},
												error : function(request, status, error) {

													// alert("code:" + request.status + "\n\n" + "message:"
													// + request.responseText + "\n\n" + "error:" + error);

												},
												complete : function() {

													// 이미지 감추기 처리
													$('.wrap-loading').addClass('display-none');

												}
											});
											
											$(this)
													.siblings(".popover")
													.on(
															"mouseleave",
															function() {
																$(_this)
																		.popover(
																				'hide');
															});
										}).on("mouseleave", function() {
									var _this = this;
									setTimeout(function() {
										if (!$(".popover:hover").length) {
											$(_this).popover("hide");
										}
									}, 100);
								});
						;

						$(document).on("click", ".popoverTags", function() {

							var popoverTag = $(this).text();
							var popoverTagSub = popoverTag.substring(1);

							$("#search_txt").val(popoverTagSub);

						});
					});
</script>
<c:set value="${fn:indexOf(postView.media, 'https:') == -1}" var="isURL"></c:set>
<c:if test="${member eq null }">
	<div class="bestListWrap col-sm-4 col-md-3 col-lg-2"
		onclick="alert('로그인 하세요.')">
</c:if>
<c:if test="${member ne null }">
	<div class="bestListWrap col-sm-4 col-md-3 col-lg-2">
</c:if>
<div class="bestListHeader col-md-12"
	onclick="morePost('${postView.pNo}')">
	<a href="#">${postView.title }</a>
</div>
<div class="bestListDate col-md-7" onclick="morePost('${postView.pNo}')">${fn:substring(postView.wDate, 0, 10) }</div>
<div class="bestListWriter col-md-5">
	<a href="#" class="listWriterId">${postView.nickName }</a>
</div>
<div class="bestListHeaderLine col-md-12"
	onclick="morePost('${postView.pNo}')"></div>
<div class="bestListMedia col-md-12"
	onclick="morePost('${postView.pNo}')">
	<c:if test="${postView.media eq 'none' }">
		<img src="resources/images/nomedia.png"
			class="bestMediaImg img-responsive">
	</c:if>
	<c:if test="${fn:indexOf(postView.media, 'https:') != -1}">
		<iframe class="bestMediaIframe"
			src="${postView.media }?rel=0&showinfo=0&autoplay=1&controls=0&modestbranding=1"
			height="150px;" frameborder="0" allowfullscreen></iframe>
	</c:if>
	<c:if test="${isURL && postView.media ne 'none'}">
		<img src="${postView.media }" class="bestMediaImg img-responsive">
	</c:if>

</div>
<div class="bestListContent col-md-12" style="overflow: hidden;"
	onclick="morePost('${postView.pNo}')">${postView.content }</div>
<div class="bestListTags col-md-12">
	<c:if test="${postView.tList eq null }">
		<center>
			<h5>No tags.</h5>
		</center>
	</c:if>
	<c:if test="${postView.tList ne null }">
		<c:forEach var="tag" items="${postView.tList }">
			<a href="#" class="mainTags">#${tag }</a>&nbsp;
		</c:forEach>
	</c:if>
</div>
<div class="bestListHeaderLine col-md-12"
	onclick="morePost('${postView.pNo}')"></div>
<div class="bestListFooter col-md-12"
	onclick="morePost('${postView.pNo}')">
	<div class="col-md-12 bestFooterContent">
		<div class="col-md-4 reImg">
			<div class="col-md-12 reIn">
				<img class="img-responsive" src="resources/images/recomment.png" />${postView.good }
			</div>
		</div>
		<div class="col-md-4 vImg">
			<div class="col-md-12 vIn">
				<img class="img-responsive" src="resources/images/viewnumber.png" />&nbsp;${postView.count }
			</div>
		</div>
		<div class="col-md-4 cImg">
			<div class="col-md-12 cIn">
				<img class="img-responsive" src="resources/images/comment.png" />${postView.cCount }
			</div>
		</div>
	</div>
</div>
</div>