<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

   $(document).ready(function() {
      // 슬라이드 해제
      $("#myCarousel").carousel({
         interval : false
      });

      $('#ch1').hide();
      $('#ch2').hide();
      $('#btn1').hide();
      $('#btn3').hide();
      $(function() {
         $('#id').keyup(function() {
         });
         $('#nickname').keyup(function() {
            $('#btn1').show();
            if (!$('#nickname').val()) {
               alert('warning');
               $('#nickname').text("");
            }
         });
         $('#pass2').keyup(function() {
            $('#btn2').hide();
            if ($('#pass1').val() != $('#pass2').val()) {

               $('#ch1').show();

            } else {
               $('#btn3').show(1000);
               $('#ch1').hide(1000);
               $('#ch2').show(1000);
            }
         });
         $('#btn1').click(function() {
            $('#btn2').show();
         });

      });
   });
</script>
<style>
b {
   color: #376cbf;
   font-weight: 600;
}

#head {
   margin-left: 30px;
}

#btn1 {
   color: navy;
   font-size: 20px;
}

#btn2 {
   color: navy;
   font-size: 20px;
}

#dialog {
   border: 10px solid #376cbf;
}

#mdf {
   margin-top: 30px;
}
</style>
</head>
<body>
   <div class="container">
      <button type="button" class="btn btn-primary btn-lg"
         data-toggle="modal" data-target="#lightbox">Modal</button>

      <div class="modal fade and carousel slide modal-lg" id="lightbox"
         role="dialog">
         <div class="modal-dialog">
            <div class="modal-content" id="dialog">
               <div class="modal-header">
                  <div id="head" class="col-sm-6">
                     <h3>
                        <b>P</b>lease. <b>S</b>ign <b>i</b>n.
                     </h3>
                  </div>

               </div>
               <hr>
               <div class="modal-body">

                  <div id="myCarousel" class="carousel slide">
                     <!-- Indicators -->


                     <form name="mjoin" action="memberJoinProc" method="post">

                        <!-- email = id
                           nickname = nickname
                           password = pass1 / pass2(check)
                           각 name과 id를 db 컬럼명과 맞춤
                      -->
                        <!-- Carousel items -->
                        <div class="carousel-inner">

                           <!-- 아이디 -->
                           <div class="item active">
                              <div class="col-sm-12">
                                 <div class="form-group" id="fg1">
                                    <label for="id"
                                       class="col-sm-offset-1 col-sm-11 control-label">Please.
                                       E-mail</label>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-8">
                                       <input type="email" class="form-control " id="id" name="id">
                                    </div>
                                    <div class="col-sm-3"></div>
                                 </div>
                              </div>
                           </div>

                           <!-- 닉네임 -->
                           <div class="item">
                              <div class="col-sm-12">
                                 <div class="form-group" id="fg2">
                                    <label for="nickname"
                                       class="col-sm-offset-1 col-sm-11 control-label">Please.
                                       Nickname</label>
                                    <div class="col-sm-1"></div>

                                    <div class="col-sm-8">
                                       <input type="text" class="form-control " id="nickname"
                                          name="nickname">
                                    </div>
                                    <div class="col-sm-3"></div>
                                 </div>
                              </div>
                           </div>

                           <!-- 패스워드 1 -->
                           <div class="item">
                              <div class="col-sm-12">
                                 <div class="form-group" id="fg3">
                                    <label for="pass1"
                                       class="col-sm-offset-1 col-sm-11 control-label">Please.
                                       Pass</label>
                                    <div class="col-sm-1"></div>

                                    <div class="col-sm-8">
                                       <input type="password" class="form-control " id="pass1">
                                    </div>
                                    <div class="col-sm-3"></div>
                                 </div>
                              </div>
                           </div>

                           <!-- 패스워드 2 -->
                           <div class="item">
                              <div class="col-sm-12">
                                 <div class="form-group" id="fg4">
                                    <label for="pass2"
                                       class="col-sm-offset-1 col-sm-11 control-label">Please.
                                       Pass again</label>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-8">
                                       <input type="password" class="form-control " id="pass2"
                                          name="pw"> <input type="submit" id="btn3"
                                          class="btn btn-success" value="등록하기"> <img
                                          src="http://placehold.it/30x30" id="ch1"> <img
                                          src="http://placehold.it/30x30" id="ch2">
                                    </div>
                                    <div class="col-sm-3"></div>
                                 </div>
                              </div>
                           </div>

                        </div>
                     </form>
                     <!-- Controls -->


                     <!-- Controls buttons -->
                  </div>
               </div>

               <div id="mdf" class="modal-footer">
                  <div class="col-sm-12" style="height: 30px;">
                     <div class="col-sm-1">
                        <a id="btn1" class="carousel-control" href="#myCarousel"
                           data-slide="prev"><span
                           class="ic glyphicon glyphicon-circle-arrow-left"
                           aria-hidden="true"></span></a>
                     </div>
                     <div class="col-sm-10"></div>
                     <div class="col-sm-1">
                        <a id="btn2" class="carousel-control" href="#myCarousel"
                           data-slide="next"><span
                           class="ic glyphicon glyphicon-circle-arrow-right"
                           aria-hidden="true"></span></a>


                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
   <script src="../resources/js/member.js"></script>
   <script
      src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</body>
</html>