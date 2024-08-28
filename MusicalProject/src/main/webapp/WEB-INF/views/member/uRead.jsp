<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>    	
	window.onload = function() {
		$(document).ready(function() {

			 var customerData = {
	                    birth: "${formattedDate}"
	                };

	                // 데이터가 날짜 형식으로 파싱될 수 있는지 확인
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
	                var formatDate2 = y + "-" + m + "-" + d;
	                console.log("formatted Date:", formatDate2);

	                // 입력 필드에 값 설정
	                document.getElementById("customer_birth").value = formatDate;
					document.getElementById("updateBirth").value = formatDate2;
	                
				$("#birth").on("change",function(){
				console.log("ok..");
				var dateInput = document.getElementById("birth").value;
				console.log("Date input value:"+ dateInput);
				var date = new Date(dateInput);
				
				if(isNaN(date.getTime())){
					console.error("IInvalid date:"+ dateInput);
					return;
				}
				
				var year = date.getFullYear();
				var month = ("0" + (date.getMonth() + 1)).slice(-2);
				var day = ("0" + date.getDate()).slice(-2);
				
				console.log(year+month+day);
				
				var formattedDateI = year+'년'+month+'월'+day+'일';
				console.log(formattedDateI);
				document.getElementById('customer_birth').value = formattedDateI;
				
				document.getElementById('updateBirth').value = dateInput;
			}) 
		})
	}
</script>
</head>
<body>
	<h2>회원 정보수정</h2>
	<form action="/ex/member/update" method="post">
	ID:<input type="text" name="customer_id" value="${customerDto.customer_id }" readonly><br>
	전화번호:<input type="text" name="customer_phone" value="${customerDto.customer_phone }" ><br>
	이메일:<input type="text" name="customer_email" value="${customerDto.customer_email }" ><br>
	주소:<input type="text" name="customer_address" value="${customerDto.customer_address }" ><br>
	생년월일: <input type="text"  id="customer_birth" value="${customerDto.customer_birth }" readonly>
	<input type="hidden" name="customer_birth" id="updateBirth" value="${customerDto.customer_birth }">
	<input type="date" id="birth" value="${customerDto.customer_birth }" ><br>
	<input type="submit" value="전송">
	</form>
</body>
</html>
