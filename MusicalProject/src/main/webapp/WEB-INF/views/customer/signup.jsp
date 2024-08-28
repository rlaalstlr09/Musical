<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<style>
h4, div.main {
	width: 350px;
	margin: 0 auto;
}

div.main {
	position: relative;
	padding: 20px;
}

div.main input {
	width: 300px;
	height: 30px;
	background-color: white;
	color: black;
	text-indent: 10px;
	margin-bottom: 10px;
}

div.main .pw-group {
	position: relative;
}

div.main .material-symbols-outlined {
	position: absolute;
	left: 75%;
	top: 27px;
	color: gray;
}
.signup {
	display: inline-block;
	margin-top: 10px;
	padding: 10px 20px;
	font-size: 18px;
	text-decoration: none;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
	line-height: 15px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>
	window.onload = function() {
		$(document).ready(function() {
			function pwCheck() {
				console.log("pwCheck");
				if ($('input[name=customer_pw]').val() === $('#pw2').val()) {
					console.log("1");
					$('#pwConfirm').text('비밀번호 일치').css('color', 'green')
					return true;
				} else {
					console.log("0");
					$('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
					return false;
				}
			}

			$('form').on('submit', function(event) {
				console.log('form submit');
				if (!pwCheck()) {
					console.log("not form");
					event.preventDefault();
				}
			})

			$("#customer_id").on("focusout", function(){
				var customer_id = $("#customer_id").val();	
				if(customer_id == '' || customer_id.length == 0){
						$("#idCheck").css("color","red").text("공백은 ID로 사용할 수 없습니다.");
						return false;
					}
				$.ajax({
					url : './CheckId',
					data : {
						customer_id : customer_id
					},
					type : 'POST',
					dataType : 'json',
					success : function(result){
						if(result == true){
							$("#idCheck").css("color","green").text("사용 가능한 ID 입니다.");
						}else{
							$("#idCheck").css("color","red").text("사용 불가능한 ID 입니다.");
							$("#customer_id").val('');
						}
					}
				})
			})
			
			$('.material-symbols-outlined').on('click', function() {
				console.log("span clicked");
				var $input = $(this).siblings('input');
				$input.toggleClass('active');

				if ($input.hasClass('active')) {
					$(this).text('visibility_off');
					$input.prop('type', 'text');
				} else {
					$(this).text('visibility');
					$input.prop('type', 'password');
				}
			})
			
			var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			$("#email").on("focusout",function(){
				validateEmail();
			})
			
			$("#email_domain").on("change",function(){
				var selectedDomain = $(this).val();
				var email_id = $("#email").val().split("@")[0];
				var fullEmail = email_id + selectedDomain;
				
				$("#email").val(fullEmail);
				
				validateEmail();
			})
			
			function validateEmail(){
				var email = $("#email").val();
				var email_id = email.split('@')[0];
				var email_domain = email.split('@')[1] || "";
				var mail = email;
				
				if(!email_id){
					$("#emailCheck").css("color","red").text("이메일을 입력해주세요");
					$("#email").focus();
					return false;
				}
				if(!email_domain){
					$("#emailCheck").css("color","red").text("도메인을 입력해주세요");
					$("#email_domain").focus();
					return false;
				}
				if(!email_rule.test(mail)){
					$("#emailCheck").css("color","red").text("이메일을 형식에 맞게 입력해주세요");
					return false;
				}
				$("#emailCheck").text("");
				return true;
			}
		})
	}
</script>
</head>
<body>
	<a href="/ex/">메인화면</a>
	<h4>정보 입력</h4>
	<div class="main">
		<form action="/ex/customer/insert" method="post">
			아이디<input type="text" name="customer_id" id="customer_id" required
				placeholder="4~20자 영문,숫자" pattern="^[a-zA-Z0-9]+$"><br>
			<span id="idCheck"></span>
			<div class="pw-group">
				비밀번호<input type="password" name="customer_pw" required
					placeholder="8~16자 영문, 숫자, 특수문자"
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[~$@$!%*#?&])[A-Za-z\d~$@$!%*#?&]{8,16}$">
				<span class="material-symbols-outlined"> visibility </span>
			</div>
			<div class="pw-group">
				비밀번호 확인<input type="password" id="pw2"
					placeholder="8~16자 영문, 숫자, 특수문자"> <span
					class="material-symbols-outlined"> visibility </span><br>
					<span id="pwConfirm"></span>
			</div>
			휴대폰<input type="text" name="customer_phone"
				placeholder="010-1234-5678" pattern="(010)-\d{3,4}-\d{4}"><br> 
			이메일<input type="email" id="email" name="customer_email">
				<select class="select" id="email_domain">
					<option value="">직접입력</option>
					<option value="@naver.com">@naver.com</option>
					<option value="@hanmail.net">@hanmail.net</option>
					<option value="@gmail.com">@gmail.com</option>
					<option value="@nate.com">@nate.com</option>
					<option value="@hotmail.com">@hotmail.com</option>
				</select><br>
				<span id="emailCheck"></span><br>
			주소<br>
			 <input	type="text" name="customer_address"><br> 
			 생년월일<input type="date" name="customer_birth" required><br> 
			 <input class="signup" type="submit" value="가입완료">
		</form>
	</div>
</body>
</html>