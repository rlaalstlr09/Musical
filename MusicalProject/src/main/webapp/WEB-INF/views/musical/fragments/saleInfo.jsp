<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.tab-container{
		display : flex;
		flex-direction: column;
		text-align :left;
		gap : 50px;
		padding : 50px 0;	
		font-size : 15px;
	}
	.tab-container div{
		display : flex;
		flex-direction : column;
		gap : 20px;
		margin : 0 50px;
	}
	
	.product-info table{
		min-width : 90%;
		min-height : 400px;
		padding : 10px;
		text-align : center;
		border : 0.5px solid black;
	}
	.product-info table td:nth-of-type(odd) {
	    background-color: #f0f0f0; /* 예시 배경색 */
	    color: #333; /* 예시 글자색 */
	    
	}
	.product-info table tr{
		border : 0.5px solid lightgray;
	}
	
	li{
		margin-bottom : 10px;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "tab-container">
	<div class = "product-info">
		<h4>상품 관련 정보</h4>
		<table class = "product-info-table">
			<tr>
				<td>공연 시간</td>
				<td>${musical.musical_runningtime}</td>
				<td>관람 등급</td>
				<td>${musical.musical_agelimit }세 이상</td>
			</tr>
			
			<tr>
				<td>주연</td>
				<td>
					<c:forEach var = "actor" items = "${actors }">
						${actor.actor_name }
					</c:forEach>
				</td>
				<td>공연 장소</td>
				<td>${musical.venue_name }&nbsp;${musical.hall_name }</td>
			</tr>
			
			<tr>
				<td>예매 수수료</td>
				<td>장당 0원</td>
				<td>배송료</td>
				<td>현장수령 무료(배송료 없음)</td>
			</tr>
			<tr>
				<td>유효기간 / 이용조건</td>
				<td colspan = 3>
					<fmt:formatDate value="${musical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ 
					<fmt:formatDate value="${musical.musical_period_end}" pattern="yyyy-MM-dd" />
					예매한 공연 날짜, 회차에 한해 이용가능
				</td>
			</tr>
			<tr>
				<td>예매 취소 조건</td>
				<td colspan = 3>취소 조건 있으면 넣기</td>
			</tr>
			<tr>
				<td>취소 환불 방법</td>
				<td colspan =  3>진짜 취소 환불 방법 적기 (결제api)</td>
			</tr>
		</table>
	</div>
	<div class = "notice">
		<h4>예매 유의사항</h4>
		<ul>
			<li>다른 이용자의 원활한 예매 및 취소에 지장을 초래할 정도로 반복적인 행위를 지속하는 경우 회원의 서비스 이용을 제한할 수 있습니다.</li>
			<li>예약 변경 및 취소는 특정 기한 내에만 가능하며, 기한을 초과할 경우 환불이 불가능할 수 있습니다. 변경 및 취소 정책을 확인하시기 바랍니다.</li>
			<li>티켓 발권은 공연 시작 전 지정된 시간 내에만 가능합니다. 공연 시작 후에는 입장이 제한될 수 있으니, 시간을 엄수해 주시기 바랍니다.</li>
			<li>특정 공연에는 연령 제한이 있을 수 있으며, 신분증 제시가 필요할 수 있습니다. 공연 관련 정보를 사전에 확인해 주시기 바랍니다.</li>
			<li>공연이 취소되거나 일정이 변경될 경우, 환불 정책에 따라 처리됩니다. 비상 상황 발생 시에는 안내에 따라 조치를 취해 주시기 바랍니다.</li>
		</ul>
	</div>
	<div class = "ticket">
		<h4>티켓 수령 안내</h4>
		<ul>
			<li>공연 당일 현장 교부처에서 예약번호 및 본인 확인 후 티켓을 수령하실 수 있습니다.</li>
			<li>티켓 수령 시, 예약 시 사용한 신분증 및 예매 확인 이메일/문자 메시지(또는 예약 번호)를 지참해 주시기 바랍니다.</li>
			<li>티켓 수령 후, 티켓에 기재된 공연 시간 및 좌석 정보를 다시 한 번 확인해 주시기 바랍니다.</li>
			
		</ul>
	</div>
	
	<div class = "cancle">
		<h4>예매 취소 안내</h4>
		<ul>
			<li>있으면 쓰고</li>
			<li>없으면 지우고</li>
			<li></li>
			
		</ul>
	</div>
	
	<div class = "refund">
		<h4>환불 안내</h4>
		<ul>
			<li>있으면 쓰고</li>
			<li>없으면 지우고</li>
			<li></li>
			
		</ul>
	</div>
</div>
</body>
</html>