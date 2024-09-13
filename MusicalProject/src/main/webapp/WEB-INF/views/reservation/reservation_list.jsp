<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String todayDate = sdf.format(new Date());
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약내역</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
}

h1 {
    text-align: center;
    margin: 20px 0;
    color: #333;
}

.table-container {
    max-width: 1200px;
    margin: 0 auto;
    overflow-x: auto;
    padding: 0 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border: 1px solid #ddd;
}

th, td {
    padding: 20px; 
    text-align: left;
    border: 1px solid #ddd;
    line-height: 2;
}
th {
    background-color: #f4f4f4;
    color: #333;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #45a049;
}


.seat-info {
    max-height: 150px; 
    overflow-y: auto; 
    background-color: #f1f1f1;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 10px;
    box-sizing: border-box;
    line-height: 1;
    display: none; 
}



.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination__item {
    color: #4CAF50;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    margin: 0 4px;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.pagination__item:hover {
    background-color: #f1f1f1;
}

.pagination__item.active {
    background-color: #4CAF50;
    color: white;
    pointer-events: none;
    border: 1px solid #4CAF50;
}




</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>예약내역</h1>
	<form action="reservation_list" method="get">
    	<label for="startDate">시작 날짜:</label>
    	<input type="date" id="startDate" name="startDate" value="${param.startDate}">
   		<label for="endDate">종료 날짜:</label>
		<input type="date" id="endDate" name="endDate" value="${param.endDate}">
		<button type="submit">필터 적용</button>
	</form>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>뮤지컬 이름</th>
                    <th>공연장</th>
                    <th>공연</th>
                    <th>예약</th>
                    <th>좌석정보</th> 
                    <th>예매 취소</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservationdtos}">
                    <tr>
                        <td>${reservation.reservation_id}</td>
                        <td>${reservation.musical_name }</td>
                        <td>${reservation.venue_name }</td>
                        <td>일자: ${reservation.mu_sch_dto.mu_sch_date }<br>
                        	시작시간 : ${reservation.mu_sch_dto.mu_sch_time }
                        </td>
                        <td>인원 : ${reservation.booked_count}<br>
                        	금액 : ${reservation.total_cost}<br>
                        	예약한 시간 :${reservation.reservation_time}
                        </td>
                        <td class="seat-info">
                        </td>
                    
                        <td>
                        <button class="change-reservation"
                            	data-date="${reservation.mu_sch_dto.mu_sch_date }" 
                            	data-id="${reservation.reservation_id}"
                            	data-merchant_uid = "${reservation.merchant_uid }">
                            	좌석 변경
                       	</button>   
                        
                        <button class="cancel-reservation"
                         	data-date="${reservation.mu_sch_dto.mu_sch_date }" 
                           	data-id="${reservation.reservation_id}"
                           	data-merchant_uid = "${reservation.merchant_uid }">
                           	예매 취소
						</button>     
						</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </div>
        <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="reservation_list?page=${startPage - 1}" class="pagination__item">Previous</a>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${startPage + 9}" step="1">
            <c:if test="${i <= totalendPage}">
                <a href="reservation_list?page=${i}" class="pagination__item <c:if test="${i == page}">active</c:if>">${i}</a>
            </c:if>
        </c:forEach>

        <c:if test="${totalendPage > startPage + 9}">
            <a href="reservation_list?page=${startPage + 10}" class="pagination__item">Next</a>
        </c:if>
    </div>
    
    
    
    
    
    
    
<script>
$(document).ready(function() {
	

	
	$('tr').each(function() {
		var reservationId = $(this).find('td:first').text().trim();
        var seatInfoCell = $(this).find('.seat-info');
        
        if (reservationId) { 
            $.ajax({
                url: '${pageContext.request.contextPath}/reservation/seat_check',
                type: 'GET',
                data: { reservation_id: reservationId },
                success: function(response) {
                    console.log('Received data:', response);

                    var detailsHtml = '<ul>';
                    var hall_id = '';

                    response.forEach(function(dto) {
                        detailsHtml += '<li>' + dto.seat_name + '</li>';
                        hall_id = dto.hall_id;
                    });

                    detailsHtml += '</ul>';
                    detailsHtml = '공연홀 번호: ' + hall_id + detailsHtml;
                    seatInfoCell.html(detailsHtml);
                    seatInfoCell.show();
                },
                error: function() {
                    seatInfoCell.html('Failed to load details.');
                }
            });
        }
    });
    
	$('.change-reservation').click(function() {
	    var reservationId = $(this).data('id');
	    
	    // 좌석 변경 페이지로 이동 (예: change_reservation 페이지)
	    var changeUrl = '${pageContext.request.contextPath}/reservation/seat_update?reservation_id=' + reservationId;
	    
	    // 페이지 이동
	    window.location.href = changeUrl;
	});


    
    //예매 취소의 경우 전날까지만 가능하게 버튼 보이는거 수정
    var todayDate = '<%= todayDate %>';
    $('.cancel-reservation').each(function() {
        var button = $(this);
        var reservationDate = button.data('date');
        
       
        if (reservationDate <= todayDate) {
            button.hide(); 
        } else {
            button.show(); 
        }
    });
    
    $('.cancel-reservation').click(function() {
        var reservationId = $(this).data('id');
        var merchant_uid = $(this).data('merchant_uid');
        var confirmCancel = confirm("정말로 예매를 취소하시겠습니까?");
        if (confirmCancel) {
            $.ajax({
                url: '${pageContext.request.contextPath}/reservation/reservation_cancel',
                type: 'POST',
                data: {
                    reservation_id: reservationId,
                    merchant_uid: merchant_uid
                },
                success: function(response) {
                    alert('예매가 취소되었습니다.');
                    location.reload();
                },
                error: function() {
                    alert('예매 취소에 실패했습니다.');
                }
            });
        } else {
            alert('예매 취소가 취소되었습니다.');
        }
    });
    
});
</script>
</body>
</html>
