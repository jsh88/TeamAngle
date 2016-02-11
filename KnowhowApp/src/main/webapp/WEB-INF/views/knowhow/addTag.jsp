<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script>
	
	var oTags = [];
	var tags = [];
	
		$(document).ready(function(){
			
			$("#tagModal").modal();
			$("#s").hide();
			$("#k").hide();
			
			$(".tags").click(function(){			
				
				if($('.t').length == 20){
					
					alert('태그는 20개까지만 추가 가능합니다.');
					$("#tagtext").val("");
					
				}else{
				
				var t = $(this).text();
				var hidden  = $("#hiddentext").val();
				var subt = t.substring(1);
				
				tags.push(subt);
				
				$("#Tagbox").append("<a class='t'  href='#'>"+t+"</a>");
				$("#hiddentext").val(hidden+" "+subt);
				
				$(this).hide();
							
				$('.t').click(function(){
					
					$(this).remove();
					removeTag(($(this).text()).substr(1));
					
				});
				
				}
			});
				
			// 추가된 태그 클릭시 태그 삭제
			
			
			$("#tagtext").keypress(function(key){
						
				var re = /[~!@\#$%<>^&*\()\-=+_\']/;
				
				if(re){
					$("#tagtext").css("border", "3px solid #FF2727").css("border-radius", "6px");
					$("#s").show();
					$("#k").hide();
				} 
				
				if(key.keyCode == 13){
					
					if($(".t").length == 20){
						
						alert('태그는 20개까지만 추가 가능합니다');
						$("#tagtext").val("");
						
					}else{
					
					var n = $("#tagtext").val();
					var h = $("#hiddentext").val();
					
					if( n == ""){
					
						$("#tagtext").css("border", "3px solid #FF2727").css("border-radius", "6px");
						$("#k").show();
						$("#s").hide();
						
					}else{
					
						$("#Tagbox").append("<a class='t' href='#'>#"+n+"</a>");
						
						oTags.push(n);
						tags.push(n);
						
						$("#hiddentext").val(h+" "+n);
						$("#tagtext").val("");
						$("#tagtext").css("border", "none").css("border-radius", "0px");
						$("#k").hide();
						$("#s").hide();
					
						
						$('.t').click(function(){
	
							$(this).remove();
							removeTag(($(this).text()).substr(1));
							
						});
					}
					}
				}
				
			});
			
			$("#tagtext").keydown(function(key){
				
				if(key.keyCode == 8){
					
					$("#tagtext").css("border", "none").css("border-radius", "0px");
					$("#k").hide();
					$("#s").hide();
				}
			});
			
			
		});
		
		function removeTag(tag) {
			
			for(var i = 0; i < oTags.length; i++) {
				
				if(oTags[i] == tag) {
					
					oTags.splice(oTags[i], 1);
					
				}
				
			}
			
			for(var i = 0; i < tags.length; i++) {
				
				if(tags[i] == tag) {
					
					tags.splice(tags[i], 1);
					
				}
				
			}
			
		}
		
		function posting() {
			
			var value = 0;

			$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
			 // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			formData.append("tags", tags);
			formData.append("oTags", oTags);

			$.ajax({
				type : 'POST',
				url : 'completePosting',
				data : formData,
				processData : false,
				contentType : false,

				success : function(v) {
					
					// 성공처리(v는 서버로 받은 메시지, value)
					alert("성공이당");
					
				},
				beforeSend : function() {

					// 전송 전
					// 이미지 보여주기
					$('.wrap-loading').removeClass('display-none');
					
				},
				error : function(request, status, error) {

					// 에러 로직, 에러 로그 확인
					alert("code:" + request.status + "\n\n" + "message:"
							+ request.responseText + "\n\n" + "error:" + error);

				},
				complete : function() {

					// 이미지 감추기 처리
// 					$(location).attr('href', "이동할 페이지");
					$('.wrap-loading').addClass('display-none');
					$("#tagModal").modal("hide");

				}
				
			});
		}
		/* header랑 추후 연결작업하면서 수정 */
		function closeTagModal(){    
			$("#tagModal").modal('hide');  
		}
		
	</script>
	<style>
		
	/*화면 전체를 어둡게 합니다.*/
	.wrap-loading { 
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.2);
	}
	
	.wrap-loading div { 							/*로딩 이미지*/
		width: 1000; 								/*div의 전체 가로픽셀*/
		position: absolute; 						/*테이블의 영향을받지않는 div*/
		left: 50%; 									/*div 왼쪽 top 부분이 가로 전체의 중간으로 위치하게됨*/
		margin-left: -90px;						/* 왼쪽 top부분이 가운데로왔으니 좌측에서 전체가로픽셀의 반을 마이너스하여 좌측으로 옮겨줌 */										
		margin-top: 120px;						
	}
	
	.display-none { /*감추기*/
		display: none;
	}
	
		#tagDialog{
			width: 500px;
			height: 400px;

		}
		
		#tagContent{
			width: 500px;
			height: 400px;
			background-color: #376CBF;
		}
		
		#Tagimage{
			float:right;
			margin-right: 20px;
			margin-top: 10px;
		}
		
		#TagContent{
			/* background-color: white; */
			width: 480px;
			height: 380px;
			margin: 0px auto;
			margin-top: 10px;
			border-radius:6px;
		}
		
		#contentTitle{
			font-size: 19px;
			color:white;
			margin-left: 20px;
			padding-top: 20px;
			font-weight: bold;
		}
		
		#inputTag{
			margin-top: 15px;
			margin-left: 20px;
		}
		
		#userTitle{
			margin-left:20px;
			margin-top:10px;
			font-size:17px;
			color:white;
			font-weight: bold;
		}
		
		#ReTag{
			margin: 0px auto;
			width:435px;
			height: 70px;
		}
		
		#Line{
			width:450px;
			border-top: 1px solid white;
			margin: 0px auto;
		}
		
		.tags{
			color: white;
			font-style: italic;
			padding-right: 10px;
		}
		
		#Tagbox{
			margin: 0px auto;
			width:440px;
			height: 90px;
			margin-bottom: 20px;
			color: white;
			
		}
		
		#Tagbtn{
			margin: 0px auto;
			width:440px;
		}
		
		#tagsubmit{
			padding-top:10px;
			width:100%;
			font-weight: bold;
		}
		
		.t{
			color: white;
			padding-right: 10px;
			font-style: italic;
			cursor: pointer;
		}
		
		#w{
			height:25px;
			margin: 0px auto;
			width:440px;
			color: #FFDA00;
		}
	</style>
	</head>
<body>
<div class="modal fade" id="tagModal" data-backdrop="static"> 
		<div class="modal-dialog" id="tagDialog">
		
			<div class="wrap-loading display-none">
		  		<div><img src="resources/images/loading2.gif" /></div>
			</div>
		
				<div class="modal-content" id="tagContent">
				<div id="TagWrap">
						<div id="Tagimage"><a href=""><img style="width:20px;" src="resources/images/close.png"/></a></div>
					<div id="TagContent">
						<div id="contentTitle">
							Recommendation Tag
						</div>
						<div id="inputTag">
							<input type="text" name="tag" id="tagtext" size="57"/>
						</div>
						<div id="w">
							<span id="s">&nbsp; - 특수문자나 영어는 사용할 수 없습니다.</span>
							<span id="k">&nbsp; - 태그를 입력해 주세요.</span>
						</div>
						<div id="ReTag">		
						<c:set var="isDoing" value="true"/> 					
							<c:forEach var="tags" items="${pTagList }" varStatus="status">
								<c:if test="${isDoing}">
									<a class="tags" href="#">#${tags.tag }</a>
									<c:if test="${status.index eq 19}"><c:set var="isDoing" value="false"/></c:if>
								</c:if>
							</c:forEach>
						</div>
						<div id="userTag">
							<div id="userTitle">
								#Tags
							</div>
							<div id="Line"></div>
							<form name="tag" action="completePosting" method="post">
							<div id="Tagbox">
								<input type="hidden" id="hiddentext"  name="tags"/>
							</div>
							<div id="Tagbtn">
								<input type="button" id="tagsubmit" onclick="posting()" class="btn btn-success addbtn"  value="Posting!"/>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
</body>
</html>