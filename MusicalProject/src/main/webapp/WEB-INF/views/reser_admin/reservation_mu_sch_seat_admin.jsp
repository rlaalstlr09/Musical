<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Movie Seat Booking</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	background-color: #f4f4f4;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.flex-container {
	display: flex;
	justify-content: flex-start;
	align-items: flex-start;
	width: 1000px; /* 조정 가능한 최대 너비 */
	gap: 20px;
	margin-left: 0;
	margin-right: auto;
}

.container {
	flex: 1;

	width: 400px;
	height:540px;
	background-color: white;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}
.musical-info {
	            background-color: white;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 560px;
            height: 400px;
            text-align: left;
}

.customer-info {
	background-color: white;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	width: 300px;
	height: 100px;
	text-align: left;
	margain-top: 20px;
}

.control-container {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	margin-bottom: 20px;
}

.control-container .showcase {
	margin: 0;
	flex: 1;
}

.control-container .seat-count {
	text-align: right;
	flex: 1;
}

.movie-container {
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.seat-limit-buttons {
	display: flex;
	gap: 10px;
}

.seat-limit-buttons button {
	padding: 10px 20px;
	font-size: 14px;
	background-color: #444451;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.seat-limit-buttons button:hover {
	background-color: #6feaf6;
}

.seat-limit-buttons button.active {
	background-color: #6feaf6;
}

.showcase {
	padding: 0;
	list-style-type: none;
	margin-bottom: 20px;
	display: flex;
	justify-content: center;
	gap: 20px;
}

.showcase li {
	display: flex;
	align-items: center;
}

.showcase div {
	display: inline-block;
	height: 20px;
	width: 20px;
	border-radius: 3px;
	margin-right: 5px;
}

.seat {
	background-color: green;
	height: 20px;
	width: 20px;
	margin: 5px;
	border-radius: 3px;
	display: inline-block;
	transition: transform 0.2s ease, background-color 0.2s ease;
}

.seat:hover {
	transform: scale(1.2);
	cursor: pointer;
}

.seat.selected {
	background-color: #6feaf6;
}

.seat.occupied {
	background-color: black;
	pointer-events: none;
}

.row {
	display: flex;
	justify-content: center;
	margin-bottom: 5px;
}

.stage {
	background-color: #ccc;
	height: 50px;
	width: 200px;
	margin: 15px 0;
	border-radius: 5px;
	line-height: 50px;
	color: #333;
	font-weight: bold;
}

ul {
	padding: 0;
	list-style-type: none;
	margin: 0;
}

ul li {
	display: inline-block;
	margin: 0 10px;
}

.gap {
	height: 20px;
	width: 20px;
	margin: 5px;
	display: inline-block;
	background-color: transparent;
	border-radius: 3px;
}

#ExSeat {
	background-color: green;
}

#ExSelected {
	background-color: #6feaf6;
}

#ExOccupied {
	background-color: black;
	pointer-events: none;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

input[type="text"] {
	margin: 5px;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

button {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}

#reservationContainer {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}
        .right-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }



.customer-info h3 {
	margin-top: 0;
}

.customer-info p {
	margin: 5px 0;
}
</style>
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
	<div class="flex-container">
		<div class="container">
			<div class="control-container">
				<div class="showcase">
					<ul class="showcase">
						<li>
							<div id="ExSeat"></div> <small>예약된 좌석</small>
						</li>
						<li>
							<div id="ExSelected"></div> <small>선택좌석</small>
						</li>
						<li>
							<div id="ExOccupied"></div> <small>미예약 좌석</small>
						</li>
					</ul>
				</div>
			</div>

			<div class="movie-container">
				<div class="stage">stage</div>

				<div class="row">
					<div class="seat" data-name="A-1" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="A-2" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="A-3" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="A-4" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="A-5" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="A-6" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="A-7" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="A-8" data-id=""
						data-seat_reservation=""></div>
				</div>
				<div class="row">
					<div class="seat" data-name="B-1" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="B-2" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="B-3" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="B-4" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="B-5" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="B-6" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="B-7" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="B-8" data-id=""
						data-seat_reservation=""></div>
				</div>
				<div class="row">
					<div class="seat" data-name="C-1" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="C-2" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="C-3" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="C-4" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="C-5" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="C-6" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="C-7" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="C-8" data-id=""
						data-seat_reservation=""></div>
				</div>
				<div class="row">
					<div class="seat" data-name="D-1" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="D-2" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="D-3" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="D-4" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="D-5" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="D-6" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="D-7" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="D-8" data-id=""
						data-seat_reservation=""></div>
				</div>
				<div class="row">
					<div class="seat" data-name="E-1" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="E-2" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="E-3" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="E-4" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="E-5" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="E-6" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="E-7" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="E-8" data-id=""
						data-seat_reservation=""></div>
				</div>
				<div class="row">
					<div class="seat" data-name="F-1" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="F-2" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="F-3" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="F-4" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="F-5" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="F-6" data-id=""
						data-seat_reservation=""></div>
					<div class="gap"></div>
					<div class="seat" data-name="F-7" data-id=""
						data-seat_reservation=""></div>
					<div class="seat" data-name="F-8" data-id=""
						data-seat_reservation=""></div>
				</div>
			</div>
			<div id="reservationContainer">
				<h3>선택된 좌석:</h3>
				<div id="selectedseat"></div>
			</div>


		</div>

		<div class="right-container">
			<div class="musical-info">
			</div>
		
		
			<div class="customer-info">
				<h3>고객 정보</h3>
				<p>
					<strong>고객 ID:</strong> <span id="customer_id"></span>
				</p>
				<p>
					<strong>예약시간 :</strong> <span id="reservation_time"></span>
				</p>
			</div>
		</div>



	</div>
	
	
	
	
	       <table>
            <thead>
                <tr>
                    <th>예약번호</th>
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
	
	
	
	
	
	
	
	
	
	
	<script>
    // DB에서 불러온 좌석 데이터
    const seatData = [
        <c:forEach var="seat" items="${seatdtos}" varStatus="status">
            {
                "seat_id": "<c:out value='${seat.seat_id}' escapeXml='false' />",
                "seat_name": "<c:out value='${seat.seat_name}' escapeXml='false' />",
                "seat_price": "<c:out value='${seat.seat_price}' escapeXml='false' />",
                "seat_reservation": <c:out value='${seat.seat_reservation}' />
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    document.addEventListener('DOMContentLoaded', () => {
        const seats = document.querySelectorAll('.seat');
        let selectedseat= null;
      

        // 예매완료된 좌석 설정 및 각 좌석에 ID와 가격 부여
        seats.forEach(seatElement => {
            const seatName = seatElement.getAttribute('data-name');
            seatData.forEach(seatItem => {
                if (seatName === seatItem.seat_name) {
                    if (parseInt(seatItem.seat_reservation, 10) !== 0) {
                        
                    }else{
                    	seatElement.classList.add('occupied');
                    }
                    seatElement.setAttribute('data-id', seatItem.seat_id);
                    seatElement.setAttribute('data-seat_reservation', seatItem.seat_reservation);
                }
            });
        });

        // 좌석 클릭 시 선택 상태 관리 및 선택된 좌석 번호 표시
        seats.forEach(seat => {
            seat.addEventListener('click', () => {

                const reservation_id = seat.getAttribute('data-seat_reservation');
                if (!seat.classList.contains('occupied')) {
                    
                    if (seat.classList.contains('selected')) {
                       
                        seat.classList.remove('selected');
                        document.getElementById('selectedseat').textContent = "";
                        selectedseat = null;
                    } else {
                    	 if (selectedseat !== null) {
                    		 
                    		 selectedseat.classList.remove('selected');
                         }

                         seat.classList.add('selected');
                         document.getElementById('selectedseat').textContent = seat.getAttribute('data-name');
                         selectedseat = seat;
                         
                         $.ajax({
                             url: '${pageContext.request.contextPath}/reservation/admin_check_seat',
                             type: 'GET',
                             dataType: 'json',
                             data: {
                                 reservation_id: reservation_id
                             },
                             success: function(data) {
                            	 
                            	 console.log(data)
                                 
                                 $('#customer_id').text(data.customer_id);
                                 $('#reservation_time').text(data.reservation_time);
                                 $('#total_cost').text(data.total_cost);
                                 
                                 
                                 
                             },
                             error: function(jqXHR, textStatus, errorThrown) {
                                 console.error('Error:', textStatus, errorThrown);
                             }
                         });  
                    }
                }               
            });
        });        
    });
    $(document).ready(function() {
        $('.view-details').click(function() {
            var reservationId = $(this).data('id');
            var seatInfoCell = $(this).closest('tr').find('.seat-info');
            
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
    });
    
</script>

</body>
</html>
