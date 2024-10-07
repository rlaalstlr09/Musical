<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
<style>
body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
}

.container {
        margin-left: 250px;
        padding: 40px;
        background-color: white;
        text-align: center;
        min-height: 100vh;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      	margin-top: 100px;
      	border-radius: 8px;
    }
h2 {
    margin-bottom: 20px;
    color: #333;
}

.container form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.container form div {
    margin-bottom: 20px;
    width: 100%;
    max-width: 400px;
}

label {
    font-weight: bold;
    margin-bottom: 5px;
    display: block;
    text-align: left;
}

input[type="password"] {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

#pwConfirm {
    margin-top: 5px;
    font-size: 14px;
}

.container input[type="submit"] {
    padding: 12px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.container input[type="submit"]:hover {
    background-color: #0056d2;
    transform: translateY(-2px);
}

.container input[type="submit"]:active {
    background-color: #004bb5;
    transform: translateY(0);
}
#pwConfirm {
    margin-top: 5px;
    font-size: 16px; 
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
				alert('비밀번호 변경 성공');
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
	})
}
</script>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
	<div class="my_sidebar">
		<a href="read"><span class="material-symbols-outlined">id_card</span>회원 정보</a> 
		<a href="write"><span class="material-symbols-outlined">support_agent</span>1:1문의</a> 
		<a href="qa_list"><span class="material-symbols-outlined">forum</span>1:1문의내역</a> 
      	<a href="myReview"><span class="material-symbols-outlined">rate_review</span>내가 쓴 리뷰</a>
      	<a href="myQna"><img src="${pageContext.request.contextPath }/resources/img/qna.png" class="qna_icon">내가 쓴 Qna</a>
		<a href="cart"><span class="material-symbols-outlined">shopping_bag</span>장바구니</a>
		<a href="remove"><span class="material-symbols-outlined">person_remove</span>회원탈퇴</a>
	</div>
	<div class="container">
	<h2>비밀번호 변경</h2>
	<form action="pwUpdate" method="post">
		<input type="hidden" name="customer_id" value="${customerDto.customer_id }">
		<div>
			<label>새 비밀번호</label>
			<input type="password" name="customer_pw" id="newPw" placeholder="8~16자 영문, 숫자, 특수문자"
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[~$@$!%*#?&])[A-Za-z\d~$@$!%*#?&]{8,16}$">
		</div>
		<div>
			<label>새 비밀번호 확인</label>
			<input type="password" id="pw2" placeholder="8~16자 영문, 숫자, 특수문자"
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[~$@$!%*#?&])[A-Za-z\d~$@$!%*#?&]{8,16}$">
			<span id="pwConfirm"></span>
		</div>
		<input type="submit" value="변경하기">
	</form>
	</div>
</body>
</html>