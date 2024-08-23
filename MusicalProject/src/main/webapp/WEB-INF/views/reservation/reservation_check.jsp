<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
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

/* 좌석 정보가 표시될 열의 스타일링 */
.seat-info {
    max-height: 150px; /* 최대 높이 설정 */
    overflow-y: auto; /* 스크롤 추가 */
    background-color: #f1f1f1;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 10px;
    box-sizing: border-box;
    display: none; /* 기본적으로 숨김 */
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>예약내역</h1>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>예약인원수</th>
                    <th>금액</th>
                    <th>예약 일시</th>
                    <th>상세보기</th>
                    <th>좌석정보</th> <!-- 추가된 열 -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservationdtos}">
                    <tr>
                        <td>${reservation.reservation_id}</td>
                        <td>${reservation.booked_count}</td>
                        <td>${reservation.total_cost}</td>
                        <td>${reservation.reservation_time}</td>
                        <td>
                            <button class="view-details" data-id="${reservation.reservation_id}">좌석 정보 보기</button>
                            <button class="cancel-reservation" data-id="${reservation.reservation_id}">예약 취소</button>
                        </td>
                        <td class="seat-info">
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
<script>
$(document).ready(function() {
    $('.view-details').click(function() {
        var reservationId = $(this).data('id');
        var seatInfoCell = $(this).closest('tr').find('.seat-info');
        
        // 데이터가 로드되지 않았을 때만 AJAX 요청
        if (!seatInfoCell.data('loaded')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/reservation/seat_check', 
                type: 'GET',
                data: { reservation_id: reservationId },
                success: function(response) {
                    console.log('Received data:', response);
                    
                    var detailsHtml = '<ul>';
                    var hall_id = '';
                    
                    response.forEach(function(dto) {
                        detailsHtml += '<li>좌석명: ' + dto.seat_name + '</li>';
                        hall_id = dto.hall_id;
                    });
                    
                    detailsHtml += '</ul>';
                    detailsHtml = '공연장 번호: ' + hall_id + detailsHtml;
                    seatInfoCell.html(detailsHtml);
                    seatInfoCell.data('loaded', true);
                    
                    // 정보 표시
                    seatInfoCell.show();
                },
                error: function() {
                    seatInfoCell.html('Failed to load details.');
                }
            });
        } else {
            // 데이터가 이미 로드된 경우, 토글 기능
            seatInfoCell.toggle();
        }
    });
    
    $('.cancel-reservation').click(function() {
        var reservationId = $(this).data('id');
        
        $.ajax({
            url: '${pageContext.request.contextPath}/reservation/reservation_cancel', 
            type: 'POST',
            data: { reservation_id: reservationId },
            success: function(response) {
                alert('예약이 취소되었습니다.');
                location.reload(); // 페이지를 새로 고쳐서 변경사항을 반영합니다.
            },
            error: function() {
                alert('예약 취소에 실패했습니다.');
            }
        });
    });
    
});
</script>
</body>
</html>
