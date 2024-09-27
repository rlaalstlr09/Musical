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
    color: #333;
}

h1 {
    text-align: center;
    margin: 20px 0;
}

.table-container {
    max-width: 1200px;
    margin: 0 auto;
    overflow-x: auto;
    padding: 0 20px;
}

.form-container {
    max-width: 1200px;
    margin: 0 auto 20px auto;
    padding: 0 20px;
    display: flex;
    justify-content: flex-end;
}

.form-container form {
    display: flex;
    align-items: center;
}

.form-container label {
    margin-right: 10px;
    font-weight: bold;
}

.form-container select,
.form-container button {
    padding: 8px 12px;
    font-size: 14px;
}

.form-container button {
    margin-left: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.form-container button:hover {
    background-color: #45a049;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border: 1px solid #ddd;
}

th, td {
    padding: 16px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #f4f4f4;
    color: #333;
    white-space: nowrap;
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
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
    display: block;
    width: 100px;
    margin-bottom: 4px;
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
    line-height: 1.5;
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
<jsp:include page="../layout/admin_header.jsp"/>
    <h1>예약내역</h1>

    <!-- 필터 폼 -->
    <div class="form-container">
    	<form action="reservation_list_admin" method="get" onsubmit="return validateForm()">
    		<label for="startDate">시작 날짜:</label>
    		<input type="date" id="startDate" name="startDate" value="${param.startDate}">
   			<label for="endDate">종료 날짜:</label>
			<input type="date" id="endDate" name="endDate" value="${param.endDate}">
            <label for="status">예약 상태:</label>
            <select name="status" id="status">
                <option value="">모두</option>
                <option value="0" <c:if test="${param.status == '0'}">selected</c:if>>예매완료</option>
                <option value="1" <c:if test="${param.status == '1'}">selected</c:if>>예매취소</option>
            </select>
            <button type="submit">필터 적용</button>
        </form>
    </div>

    <!-- 예약 내역 테이블 -->
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>공연정보</th>
                    <th>고객명</th>
                    <th>예약 정보</th>
                    <th>예약 상태</th>
                    <th>상세보기</th>
                    <th>좌석정보</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservationdtos}">
                    <tr>
                        <td>${reservation.reservation_id}</td>
                        <td>
                        	뮤지컬 : ${reservation.musical_name}<br>
                        	공연장 : ${reservation.venue_name}<br>
                        	일자: ${reservation.mu_sch_dto.mu_sch_date}<br>
                      	      시작시간: ${reservation.mu_sch_dto.mu_sch_time}
                        </td>
                        <td>
                        	${reservation.customer_id}
                        </td>
                        <td>
                      	      인원: ${reservation.booked_count}<br>
                      	      금액: ${reservation.total_cost}<br>
                      	      예약한 시간: ${reservation.reservation_time}
						</td>
						<td>${reservation.reservation_cancel == 1 ? '취소' : '예매완료'}</td>
						<td>
						    <button class="view-details" data-id="${reservation.reservation_id}">좌석 정보</button>
						</td>
                        <td class="seat-info"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="reservation_list_admin?page=${startPage - 1}&status=${param.status}" class="pagination__item">Previous</a>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${startPage + 9}" step="1">
            <c:if test="${i <= totalendPage}">
                <a href="reservation_list_admin?page=${i}&status=${param.status}" class="pagination__item <c:if test="${i == page}">active</c:if>">${i}</a>
            </c:if>
        </c:forEach>

        <c:if test="${totalendPage > startPage + 9}">
            <a href="reservation_list_admin?page=${startPage + 10}&status=${param.status}" class="pagination__item">Next</a>
        </c:if>
    </div>

    <script>
        $(document).ready(function() {
            $('.view-details').click(function() {
                var reservationId = $(this).data('id');
                var seatInfoCell = $(this).closest('tr').find('.seat-info');
                
                if (!seatInfoCell.data('loaded')) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/reser_admin/seat_check',
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
                            detailsHtml = '공연장 번호: ' + hall_id + detailsHtml;
                            seatInfoCell.html(detailsHtml);
                            seatInfoCell.data('loaded', true);
                            
                            seatInfoCell.show();
                        },
                        error: function() {
                            seatInfoCell.html('Failed to load details.');
                        }
                    });
                } else {
                    seatInfoCell.toggle();
                }
            });
            
            $('.cancel-reservation').click(function() {
                var reservationId = $(this).data('id');
                
                $.ajax({
                    url: '${pageContext.request.contextPath}/reser_admin/reservation_cancel',
                    type: 'POST',
                    data: { reservation_id: reservationId },
                    success: function(response) {
                        alert('예약이 취소되었습니다.');
                        location.reload();
                    },
                    error: function() {
                        alert('예약 취소에 실패했습니다.');
                    }
                });
            });
        });
        
        
        <script>
        function validateForm() {
            const startDate = document.getElementById("startDate").value;
            const endDate = document.getElementById("endDate").value;
            
            if ((startDate && !endDate) || (!startDate && endDate)) {
                alert("둘 다 날짜를 선택하거나, 둘 다 비워 두십시오.");
                return false; 
            }
            
            if (startDate && endDate && new Date(startDate) > new Date(endDate)) {
                alert("시작 날짜는 종료 날짜보다 이후일 수 없습니다.");
                return false; 
            }
            
            return true;  
        }
        </script>  
        
        
        
        
        
        
        
    </script>
</body>
</html>