<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<div class="container-fluid intro4_wrap">

		<div class="col-md-12 dama_wrap">
			<div class="col-md-offset-4 col-md-4">
				<div class="intro4_position1">
					<div class="intro4_t1">
						<div class="dama_cir1">
							<div class="pil_div">
								<div class="in_pil_margin1">
									<div id="in_container">
										<div class="in_stick"></div>
										<div class="in_stick"></div>
										<div class="in_stick"></div>
										<div class="in_stick"></div>
										<div class="in_stick"></div>
										<div class="in_stick"></div>
									</div>
								</div>
							</div>
							<div class="dama_cir3"></div>
						</div>
						<div class="dama_cir2 dama"></div>
						<div class="intro4_dama_nemo">
							<div class="intro4_dama_bolt intro4_dama_bolt1"></div>
							<div class="intro4_dama_bolt intro4_dama_bolt1"></div>
							<div class="intro4_dama_bolt intro4_dama_bolt1"></div>
							<div class="intro4_dama_bolt intro4_dama_bolt2"></div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- 점박이들 -->
		<div class="col-md-12 centered nemo_wrap intro4_position2">
			<div class="col-md-12 intro4_margin intro4_p">
			<div class="col-md-12 intro4_p">
				<%
					for (int i = 0; i <= 39; i++) {
				%>
				<div class="nemoForm n1 n2"></div>
				<%
					}
				%>
			</div>
			</div>
			<div class="col-md-12 intro4_margin intro4_p">
			<div class="col-md-12 intro4_p">
				<%
					for (int i = 0; i <= 39; i++) {
				%>
				<div class="nemoForm n1 n2"></div>
				<%
					}
				%>
			</div>
			</div>
			<div class="col-md-12 intro4_margin intro4_p">
			<div class="col-md-12 intro4_p">
				<%
					for (int i = 0; i <= 39; i++) {
				%>
				<div class="nemoForm n1 n2"></div>
				<%
					}
				%>
			</div>
			</div>
		</div>
		<div class="col-md-12">
		<div class="col-md-offset-2 col-md-8 intro4_t4 text-center">
			<h3><strong>서로 Knowhow 를 공유하고, 새로운 Knowhow 를 찾아보세요.</strong></h3>
			<div class="col-md-12">
			<button class="btn btn-lg btn_go_web btn_anim" 
				onclick="window.location.href='index';">Let's Start</button>
			</div>
		</div>
		</div>



	</div>
	<!-- 메인 큰 창 -->
</body>
</html>