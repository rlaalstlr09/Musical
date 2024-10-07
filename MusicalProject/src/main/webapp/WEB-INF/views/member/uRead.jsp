<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    color: #333;
}
.container {
    margin-left: 250px;
    padding: 40px;
    background-color: #fff;
    min-height: 100vh;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
    margin-top: 100px;
    border-radius: 10px;
}
.container h2 {
    font-size: 2em;
    margin-bottom: 20px;
    color: #333;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
}
.profile-info {
    background-color: #fff;
    color: #333;
    padding: 20px 30px;
    margin-top: 20px;
    font-size: 1.1em;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.profile-info label {
    font-weight: bold;
    display: inline-block;
    width: 100px;
}
.profile-info span {
    display: inline-block;
    margin-left: 10px;
}
.profile-info hr {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ddd;
}
.button input[type="submit"] {
    padding: 12px 20px;
    background-color: #007BFF; 
    color: white;
    border: none; 
    border-radius: 5px;
    font-size: 16px; 
    cursor: pointer; 
    transition: background-color 0.3s ease, transform 0.2s ease; 
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2); 
}

.button input[type="submit"]:hover {
    background-color: #0056d2; 
    transform: translateY(-2px);
}

.button input[type="submit"]:active {
    background-color: #004bb5; 
    transform: translateY(0); 
}
.info{
	display: flex;
	padding-bottom: 40px;
}
.info p{
	width: 100px;
	margin: 0;
	padding: 5px;
	color: #666;
}
.info input[type="text"],
.info input[type="date"] {
    width: 70%; 
    height: 40px;
    padding: 10px;
    margin-left: 10px; 
    font-size: 16px;
    color: #333;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    background-color: #fff; 
}
.info input[type="date"]{
	width: 20%;	
}

.info input[type="text"]::placeholder,
.info input[type="date"]::placeholder {
    color: #aaa; 
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>    	
window.onload = function() {
    $(document).ready(function() {
        var customerData = {
            birth: "${formattedDate}"
        };

        console.log(customerData);
        var firstDateInput = customerData.birth;
        console.log("Original Date Value from JSON:", firstDateInput);

        // Date 객체로 변환
        var firstDate = new Date(firstDateInput);

        if (isNaN(firstDate.getTime())) {
            console.error("Invalid date:", firstDateInput);
            return;
        }

        var y = firstDate.getFullYear();
        var m = ("0" + (firstDate.getMonth() + 1)).slice(-2);
        var d = ("0" + firstDate.getDate()).slice(-2);

        // 날짜 형식 변환
        var formatDate = y + "년" + m + "월" + d + "일";
        console.log("Formatted Date:", formatDate);
        
        // updateBirth에 yyyy-MM-dd 형식으로 값 설정
        document.getElementById("updateBirth").value = y + "-" + m + "-" + d;

        // birth 입력 필드에 값 설정
        document.getElementById("customer_birth").value = formatDate;

        $("#birth").on("change", function() {
            console.log("ok..");
            var dateInput = document.getElementById("birth").value;
            console.log("Date input value:" + dateInput);
            var date = new Date(dateInput);

            if (isNaN(date.getTime())) {
                console.error("Invalid date:" + dateInput);
                return;
            }

            var year = date.getFullYear();
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);

            var formattedDateI = year + '년' + month + '월' + day + '일';
            console.log(formattedDateI);
            document.getElementById('customer_birth').value = formattedDateI;
            document.getElementById('updateBirth').value = dateInput; // yyyy-MM-dd 형식
        });
    });
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
		<h2>회원정보 수정</h2>
		<div class="profile-info">
			<form action="update" method="post">
				<div class="info"><p>ID</p> <input type="text" name="customer_id" value="${customerDto.customer_id }" readonly></div><br>
				<div class="info"><p>전화번호</p> <input type="text" name="customer_phone" value="${customerDto.customer_phone }" ></div><br>
				<div class="info"><p>이메일</p> <input type="text" name="customer_email" value="${customerDto.customer_email }" ></div><br>
				<div class="info"><p>주소</p> <input type="text" name="customer_address" value="${customerDto.customer_address }" ></div><br>
				<div class="info"><p>생년월일</p> <input type="text"  id="customer_birth" value="${customerDto.customer_birth }" readonly>
				<input type="hidden" name="customer_birth" id="updateBirth" value="${customerDto.customer_birth }">
				<input type="date" id="birth" value="${customerDto.customer_birth }" ></div><br>
				<div class="button"><input type="submit" value="전송"></div>
			</form>
		</div>
	</div>
</body>
</html>
