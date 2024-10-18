<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 70vh;
	margin: 0;
}

.container {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
	text-align: center;
}

h2 {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
	text-align: left;
}

input[type="email"], input[type="text"], input[type="hidden"] {
	width: 100%;
	height: 40px;
	padding: 0 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	font-size: 16px;
	box-sizing: border-box;
}

input[type="email"]:focus, input[type="text"]:focus {
	border-color: #0D72FF;
	outline: none;
	box-shadow: 0 0 5px rgba(13, 114, 255, 0.5);
}

#customer_email{
	margin-bottom: 10px;
}

.send_auth, #id-find{
	width: 100%;
	height: 40px;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px;
}

.send_auth {
	background-color: #0D72FF;
}

.send_auth:hover{
	background-color: #0056d2;
}

#id-find {
	background-color: #28a745;
}

#id-find:hover {
	background-color: #218838;
}

.hidden{
	display: none;
}
.show{
	display: block;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
	$("input[name='method']").change(function(){
		
		$("input[name='method']").not(this).prop('checked',false);
		console.log('메서드 선택');
		if ($(".box1").is(':checked')) {
			console.log("문자인증");
			$('#customer_phone').prop('type', 'text');   
			$('#customer_email').prop('type', 'hidden'); 
		} else {
			$('#customer_phone').prop('type', 'hidden'); 
		}

		if ($(".box2").is(':checked')) {
			$('#customer_email').prop('type', 'text');   
			$('#customer_phone').prop('type', 'hidden'); 
		} else {
			$('#customer_email').prop('type', 'hidden'); 
		}
	});
	
	
	// 이메일 인증 코드 발송 함수
	window.sendAuthCode = function() {
		var method = $("input[name='method']:checked").val();
		var email = $("#customer_email").val();
		var phone = $("#customer_phone").val();
		if(method === "email"){
			if (!email) {
				alert("이메일을 입력해주세요.");
				return;
			}		
			// 이메일로 인증 코드 발송 요청
			$.post("sendMail.do", {
				customer_email: email
			}, function(result) {
				alert("인증 코드가 발송되었습니다.");
				$("#auth_code2").prop('type', 'text'); // 숨겨진 인증 코드 필드 활성화
			}).fail(function() {
				alert("이메일 발송 오류");
			});
		} else if(method === "sms"){
			if(!phone){
				alert("전화번호를 입력해주세요.");
				return;
			}
			// 문자로 인증 코드 발송 요청
			$.post("sendSms.do",{customer_phone: phone}, function(result){
				alert("인증 코드가 발송되었습니다.");
				$("#auth_code1").prop('type','text');
			}).fail(function(){
				alert("문자 발송 오류");
			})
		}else{
			alert("방법을 선택해주세요.");
		}
		
	}
	
	window.submitForm = function(){
		var method = $("input[name='method']:checked").val();
		if(!method){
			alert("인증 방법을 선택해주세요.");
			return;
		}
		
		var authCode;
		
		if(method === "sms"){
			authCode = $("#auth_code1").val();
		}else if(method === "email"){
			authCode = $("#auth_code2").val();
		}
		
		if(!authCode){
			alert("인증 코드를 입력해주세요.");
			return;
		}
		var formId = method === "sms" ? "smsForm" : "findForm";
		$("#" + formId).submit();
	}
	
	// 인증 코드 확인 함수
	window.checkAuthCode = function(event) {
		event.preventDefault();  // 기본 폼 제출 동작을 막음

		var authCode = $(".auth_code").val();
		if (!authCode) {
			alert("인증 코드를 입력해주세요.");
			return;
		}
		
	}
});

</script>
</head>
<body>
	<div class="container">
		<h2>아이디 찾기</h2>
		<form id="smsForm" action="findIdSmsCheck" method="post" >
			<div class="form-group">
				<label><input type="checkbox" name="method" value="sms" id="box" class="box1">
				<span class="text">문자 인증</span></label>
				<input type="hidden" name="customer_phone" id="customer_phone"
					placeholder="전화번호">
				<input type="hidden" name="auth_code" id="auth_code1" class="auth_code"
					placeholder="인증 코드입력">
			</div>
		</form>
		<form id="findForm" action="findIdCheck" method="post">
			<div class="form-group">
				<label><input type="checkbox" name="method" value="email" id="box" class="box2">
				<span class="text">이메일 인증</span></label>
				<input type="hidden" name="customer_email" id="customer_email"
					placeholder="이메일">
				<input type="hidden" name="auth_code" id="auth_code2" class="auth_code"
				placeholder="인증 코드입력">
			
			</div>	
			<input type="button" class="send_auth"
					onclick="sendAuthCode();" value="인증 코드발송">	
		</form>
		<input type="button" id="id-find" onclick="submitForm()" value="아이디 찾기">
	</div>
</body>
</html>