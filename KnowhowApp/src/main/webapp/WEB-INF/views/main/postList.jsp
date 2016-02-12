<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${fn:indexOf(postView.media, 'https:') == -1}" var="isURL"></c:set>
<div class="bestListWrap col-sm-4 col-md-2">
	<div class="bestListHeader col-md-12">
		<a href="#">${postView.title }</a>
	</div>
	<div class="bestListDate col-md-6">${fn:substring(postView.wDate, 0, 10) }</div>
	<div class="bestListWriter col-md-6">
		<a href="#">${postView.nickName }</a>
	</div>
	<div class="bestListHeaderLine col-md-12"></div>
	<div class="bestListMedia col-md-12">
		<c:if test="${postView.media eq 'none' }">
			<img src="resources/images/nomedia.png"
				class="bestMediaImg img-responsive">
		</c:if>
		<c:if test="${fn:indexOf(postView.media, 'https:') != -1}">
			<iframe class="bestMediaIframe"
				src="${postView.media }?rel=0&showinfo=0&autoplay=1&controls=0&modestbranding=1"
				height="110px;" frameborder="0" allowfullscree></iframe>
		</c:if>
		<c:if test="${isURL && postView.media ne 'none'}">
			<img src="${postView.media }" class="bestMediaImg img-responsive">
		</c:if>

	</div>
	<div class="bestListContent col-md-12" style="overflow: hidden;">
		${postView.content }</div>
	<div class="bestListTags col-md-12">
		<c:if test="${postView.tList eq null }">
			<center>
				<h5>No tags.</h5>
			</center>
		</c:if>
		<c:if test="${postView.tList ne null }">
			<c:forEach var="tag" items="${postView.tList }">
			#${tag }&nbsp;
		</c:forEach>
		</c:if>
	</div>
	<div class="bestListHeaderLine col-md-12"></div>
	<div class="bestListFooter col-md-12">
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