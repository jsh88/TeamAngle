<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			
			
			$("#tagModal").modal();
			$("#s").hide();
			$("#k").hide();
			
			$(".tags").click(function(){
				
				var t = $(this).text();
				var hidden  = $("#hiddentext").val();
				var subt = t.substring( 1, 20);
				
				$("#Tag").append("<span class='t'>"+t+"</span>");
				$("#hiddentext").val(hidden+" "+subt);
				
			});
			
			$("#tagtext").keypress(function(key){
						
				var re = /[~!@\#$%<>^&*\()\-=+_\']/;
				
				if(re){
					$("#tagtext").css("border", "3px solid #FF2727").css("border-radius", "6px");
					$("#s").show();
					$("#k").hide();
				} 
				
				
				if(key.keyCode == 13){
					
					var n = $("#tagtext").val();
					var h = $("#hiddentext").val();
					
					if( n === ""){
					
						$("#tagtext").css("border", "3px solid #FF2727").css("border-radius", "6px");
						$("#k").show();
						$("#s").hide();
						
					}else{
					
						$("#Tag").append("<span class='t'>#"+n+"</span>");
						$("#hiddentext").val(h+" "+n);
						$("#tagtext").val("");
						$("#tagtext").css("border", "none").css("border-radius", "0px");
						$("#k").hide();
						$("#s").hide();
					
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
	
	</script>
	<style>
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
			margin-top:30px;
			font-size:17px;
			color:white;
			font-weight: bold;
		}
		
		#ReTag{
			margin: 0px auto;
			width:435px;
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
		
		#Tag{
			margin: 0px auto;
			width:440px;
			height: 120px;
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
			padding-right: 10px;
			font-style: italic;
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
				<div class="modal-content" id="tagContent">
				<div id="addWrap">
						<div id="Tagimage"><a href=""><img style="width:20px;" src="close.png"/></a></div>
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
							<a class="tags" href="#">#히트</a>
							<a class="tags" href="#">#아니카</a>
						</div>
						<div id="userTag">
							<div id="userTitle">
								#Tags
							</div>
							<div id="Line"></div>
							<form name="tag" action="" method="post">
							<div id="Tag">
								<input type="hidden" id="hiddentext"  name="tags"/>
							</div>
							<div id="Tagbtn">
								<input type="submit" id="tagsubmit" class="btn btn-success addbtn"  value="Posted"/> 
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