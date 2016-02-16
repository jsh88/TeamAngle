<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover({
			container : "body",
			trigger : "hover"
		});
	});
</script>
</head>
<body>
	<div class="container-fluid intro2_wrap">

		<%-- 팝오버 쓰는 방식 !
		<a href="#" data-toggle="popover" 
		data-html="true" 
		title="Popover title" 
		data-content="<h1>Default </h1>">you probably</a> 
		<a href="#" data-toggle="popover" 
		data-html="true" 
		title="태그!" 
		data-content="">팝오버</a>
		
		HTML도 넣을 수 있음 --%>

		<!-- 시작 -->
		<div class="container intro2_d_margin_auto intro2_d_margin_top4">
			<div class="col-md-3">
				<!-- 배경 -->
				<div
					class="intro2_circle intro2_c_color_1 intro2_bor_1 intro2_c_size1"></div>
			</div>
			<div class="col-md-6" style="height: 225px;">
				<div
					class="intro2_f_height intro2_text intro2_f_w intro2_size1 col-md-2">태</div>
				<div class="col-md-10">
					<span
						class="glyphicon glyphicon-tags intro2_size4 g_color_red intro2_d_margin_top3 intro2_stick"></span>
				</div>
				<div class="col-md-12">
					<div
						class="intro2_f_height intro2_text intro2_tb intro2_f_w intro2_size1 col-md-2">그</div>
					<div class="intro2_d_margin_top3 col-md-10">
						<div class="intro2_tb intro2_f_w intro2_size2 intro2_d_margin1">
							를 통해 <b>포스트</b>를 찾고
						</div>
						<div class="intro2_tb intro2_f_w intro2_size2 intro2_d_margin1">
							내 글에 추가해 보세요&nbsp;&nbsp;<span
								class="glyphicon glyphicon-paperclip intro2_size4"
								aria-hidden="true"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>

			<div class="col-md-12"></div>
			<div class="col-md-3 intro2_tb"></div>
			<div
				class="col-md-7 intro2_size3 intro2_text intro2_t_left intro2_f_w">
				<span class="glyphicon glyphicon-pencil "></span>&nbsp;&nbsp;연관태그가
				많을 수록 나의 포스팅을 많은 사람들에게 정확하고 빠르게 공유할 수 있어요!
			</div>
			<div class="col-md-2 intro2_tb">
				<!-- 배경 -->
				<div
					class="intro2_circle intro2_c_color_1 intro2_bor_1 intro2_c_size1"></div>
			</div>
			<div class="col-md-12"></div>
			<div class="col-md-3 intro2_tb"></div>
			<div
				class="col-md-7 intro2_size3 intro2_text intro2_t_left intro2_f_w">
				<span class="glyphicon glyphicon-pencil "></span>&nbsp;&nbsp;포스팅의
				이미지와 영상을 올려 더욱 멋진 포스팅을 만들 수 있습니다!
			</div>
			<div class="col-md-2 intro2_tb"></div>

			<div class="col-md-12"></div>
			<div class="col-md-2 intro2_tb"></div>
			<div class="col-md-1"></div>
			<div class="col-md-6 intro2_tb intro2_d_margin_top3"></div>
			<div class="col-md-3 intro2_tb"></div>
		</div>


		<hr>


		<!--  tag를 뿌려주세요  -->
		<div class="container">
			<div class="col-md-12 intro2_text intro2_tag">
				<c:forEach begin="0" end="10" var="tag" varStatus="status">
					<a href="#" data-toggle="popover" data-placement="top"
						data-html="true" title="tagging! 검색을 쉽게!"
						data-content="<h4>빠른 검색을 위해 태그는 필수!</h4>">#${iTagList.get(status.index).tag }</a>
				</c:forEach>
			</div>
			<div class="col-md-12 intro2_text intro2_tag">
				<c:forEach begin="10" end="18" var="tag" varStatus="status">
					<a href="#" data-toggle="popover" data-placement="right"
						data-html="true" title="명사만 뽑아가는 태깅시스템"
						data-content="<h4>우리만의 독특한 시스템입니다</h4>">#${iTagList.get(status.index).tag }</a>
				</c:forEach>
			</div>
			<div class="col-md-12 intro2_text intro2_tag">
				<c:forEach items="${iTagList }" begin="18" end="25" var="tag"
					varStatus="status">
					<a href="#" data-toggle="popover" data-placement="bottom"
						data-html="true" title="Posting's"
						data-content="<h4>태그와 포스트를 함께 올리세요~</h4>">#${iTagList.get(status.index).tag }</a>
				</c:forEach>
			</div>
		</div>

		<div class="col-md-12">
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<div class="intro2_semo"></div>
			</div>
		</div>
	</div>
</body>
</html>