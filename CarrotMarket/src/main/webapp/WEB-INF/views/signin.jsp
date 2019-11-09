<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>당근마켓 - 로그인</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/css/bootstrap-slider.min.css" integrity="sha256-G3IAYJYIQvZgPksNQDbjvxd/Ca1SfCDFwu2s2lt0oGo=" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
<nav class="navbar nav-global nav-global-sign navbar-expand-sm">
    <div class="container d-flex justify-content-center">
        <a class="navbar-brand" href="index.html">
            <img class="img-brand" alt="당근마켓" width="132" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-00b7e471b721ce9db8b0758c05a84684413c8aef1ad54caa0f3fcbe7328c947f.svg">
        </a>
    </div>
</nav>

<div class="container container-sm container-sign">
    <form class="form-sign" action="signinAccount" id="signinForm" method="post">
        <h5 class="form-headline">🥕 로그인 🐰</h5>
        <div class="form-group">
            <input type="text" class="form-control" id="inputEmail" name="email" placeholder="이메일 입력"> 
            <font color="red">${message}</font>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="inputPassword" name="encrypted_password" placeholder="비밀번호 입력">
        </div>
        <button class="btn btn-block btn-primary" type="button" id="login">로그인 하기</button>
        <a href="signup" class="btn btn-block btn-light">계정 만들기</a>

        <h6 class="txt-terms">
            <a href="#">이용약관</a> 및 <a href="#">개인정보</a> 취급방침
        </h6>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.2/bootstrap-slider.js" integrity="sha256-59/apVFrosMLFX2dHZLGvb3nPpu7e0Yx1rsDr1dTRrk=" crossorigin="anonymous"></script>
<script>
$( document ).ready(function() {
   $("#login").on("click",function(){
	   
	  	var email=$("#inputEmail").val();
	  	var password=$("#inputPassword").val();
	  	
	  	/* 이메일칸공란유효성 */ 
	  	if(!$.trim(email).length){
	  		alert("이메일칸을 확인해주세요.");
	  		return;
	  	}else if(!validateEmail(email)){
	  		alert("이메일 형식을 확인해주세요.");
	  		return;
	  	}
	  	/* 비밀번호칸공란유효성 */
	  	if(!$.trim(password).length){
	  		alert("비밀번호칸을 확인해주세요.");
	  		return;
	  	}
	   
	  	$("#signinForm").submit();
   });
});

/* 이메일 형식 유효성 함수 */
function validateEmail($email) {
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  return emailReg.test( $email );
}

</script>
</body>

</html>



