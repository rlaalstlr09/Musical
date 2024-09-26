<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
<style>
body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
}
.container{
	margin-left: 250px;
	width: calc(100% - 250px);
	padding: 20px;
	background-color: #f8f8f8;
	min-height: 100vh;
}
.profile-info{
	background-color: #f8f8f8;
	color: #333;
	padding: 15px;
	margin-top: 20px;
	font-size: 1.1em;
	border: 1px solid #ddd;
	border-radius: 4px;
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
	<div class="sidebar">
		<a href="${pageContext.request.contextPath }/" class="mainpage">메인 페이지</a>
		<a href="myPage" class="mypage">마이페이지</a>
		<a href="read" class="a">회원 정보</a>
		<a href="write" class="a">1:1문의</a>
		<a href="qa_list" class="a">1:1문의내역</a>
		<a href="myReview">내가 쓴 리뷰</a>
		<a href="#" class="a">장바구니</a>
		<a href="remove" class="a">회원탈퇴</a>
	</div>
	<div class="container">
		<h2>회원 정보수정</h2>
		<div class="profile-info">
			<form action="update" method="post">
				ID: <input type="text" name="customer_id" value="${customerDto.customer_id }" readonly><hr><br>
				전화번호: <input type="text" name="customer_phone" value="${customerDto.customer_phone }" ><hr><br>
				이메일: <input type="text" name="customer_email" value="${customerDto.customer_email }" ><hr><br>
				주소: <input type="text" name="customer_address" value="${customerDto.customer_address }" ><hr><br>
				생년월일: <input type="text"  id="customer_birth" value="${customerDto.customer_birth }" readonly>
				<input type="hidden" name="customer_birth" id="updateBirth" value="${customerDto.customer_birth }">
				<input type="date" id="birth" value="${customerDto.customer_birth }" ><hr><br>
				<input type="submit" value="전송">
			</form>
		</div>
	</div>
</body>
</html>
