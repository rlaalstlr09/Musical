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
body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
}
.container {
    margin-left: 270px; 
    padding: 40px;
    background-color: #fff;
    min-height: 100vh;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    margin-top: 100px;
    border-radius: 8px;
}

.container h2 {
    color: #d9534f; 
    font-weight: bold;
}

.container h4 {
    color: #555;
    margin-top: 30px;
    margin-bottom: 15px;
}

.container span {
    color: #777;
    line-height: 1.6;
}

.container li {
    color: #777;
    line-height: 1.6;
    margin-left: 20px;
}

.container input[type="submit"] {
    background-color: #d9534f;
    color: white;
    border: none;
    padding: 10px 20px;
    margin-top: 30px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}

.container input[type="submit"]:hover {
    background-color: #c9302c;
}
.warning {
	color: #d9534f;
}
</style>
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
	<h2>회원 탈퇴</h2><hr>
	<h4>회원 정보 및 구매 내역 삭제</h4>
	<span>회원 탈퇴 즉시, 회원 정보는 모두 삭제되고 재가입시에도 복원되지 않습니다. 이점 꼭 인지해 주시기 바랍니다.</span><hr>
	<h4>탈퇴 후 정보보관에 대한 안내</h4>
	<span>전자상거래 등에서 소비자보호에 관한 법률 제6조에 의거 성명,주소 등 거래의 주체를 식별할 수 있는 정보에 한하여 서비스
	이용에 관한 동의를 철회한 경우에도 이를 보전할 수 있으며, 동법 시행령 제 6조에 의거 다음과 같이 거래기록을 보관합니다.</span>
	<li> 표시, 광고에 관한 기록: 6개월</li>
	<li> 계약 또는 청약철회 등에 관한 기록</li>
	<li> 대금결제 및 재화 등의 공급에 관한 기록</li>
	<li> 소비자의 불만 또는 분쟁처리에 관한 기록</li>
		<form action="delete" method="post">
			<input type="hidden" name="customer_id" value="${pageContext.request.userPrincipal.name }">
			<input type="submit" value="확인">
		</form>
	<p class="warning">* 탈퇴된 계정은 복구되지 않습니다</p>
	</div>
</body>
</html>
