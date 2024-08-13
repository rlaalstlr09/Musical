<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Movie Seat Booking</title>
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

.control-container {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	width: 80%;
}

.movie-container {
	margin-bottom: 20px;
}

.container {
	display: inline-block;
	perspective: 1000px;
	margin-bottom: 30px;
}

.seat {
	background-color: #444451;
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
	background-color: red;
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
	width: 100%;
	margin: 15px 0;
	border-radius: 5px;
	line-height: 50px;
	color: #333;
	font-weight: bold;
}

ul {
	padding: 0;
	list-style-type: none;
	margin-bottom: 20px;
}

ul li {
	display: inline-block;
	margin: 0 10px;
}

.seat-count {
	font-size: 16px;
	margin-left: 10px;
}

/* 버튼 스타일 */
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

.gap {
	height: 20px;
	width: 20px;
	margin: 5px;
	display: inline-block;
	background-color: transparent;
	border-radius: 3px;
}

#ExSeat {
	background-color: #444451;
	height: 20px;
	width: 20px;
	margin: 5px;
	border-radius: 3px;
	display: inline-block;
	transition: transform 0.2s ease, background-color 0.2s ease;
}

#ExSelected {
	height: 20px;
	width: 20px;
	margin: 5px;
	border-radius: 3px;
	display: inline-block;
	transition: transform 0.2s ease, background-color 0.2s ease;
	background-color: #6feaf6;
}

#ExOccupied {
	height: 20px;
	width: 20px;
	margin: 5px;
	border-radius: 3px;
	display: inline-block;
	transition: transform 0.2s ease, background-color 0.2s ease;
	background-color: red;
	pointer-events: none;
}
</style>
</head>
<body>

	<div class="control-container">
		<ul class="showcase">
			<li>
				<div id="ExSeat"></div> <small>선택가능좌석</small>
			</li>
			<li>
				<div id="ExSelected"></div> <small>선택좌석</small>
			</li>
			<li>
				<div id="ExOccupied"></div> <small>예약불가</small>
			</li>
		</ul>

		<div class="seat-count">
			<div class="seat-limit-buttons">
				<button data-limit="1">1 인</button>
				<button data-limit="2">2 인</button>
				<button data-limit="3">3 인</button>
				<button data-limit="4">4 인</button>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="stage">stage</div>

		<div class="row">
			<div class="seat" data-name="row_1_col_1" data-id="" data-price=""></div>
			<div class="seat" data-name="row_1_col_2" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_1_col_3" data-id="" data-price=""></div>
			<div class="seat" data-name="row_1_col_4" data-id="" data-price=""></div>
			<div class="seat" data-name="row_1_col_5" data-id="" data-price=""></div>
			<div class="seat" data-name="row_1_col_6" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_1_col_7" data-id="" data-price=""></div>
			<div class="seat" data-name="row_1_col_8" data-id="" data-price=""></div>
		</div>
		<div class="row">
			<div class="seat" data-name="row_2_col_1" data-id="" data-price=""></div>
			<div class="seat" data-name="row_2_col_2" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_2_col_3" data-id="" data-price=""></div>
			<div class="seat" data-name="row_2_col_4" data-id="" data-price=""></div>
			<div class="seat" data-name="row_2_col_5" data-id="" data-price=""></div>
			<div class="seat" data-name="row_2_col_6" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_2_col_7" data-id="" data-price=""></div>
			<div class="seat" data-name="row_2_col_8" data-id="" data-price=""></div>
		</div>
		<div class="row">
			<div class="seat" data-name="row_3_col_1" data-id="" data-price=""></div>
			<div class="seat" data-name="row_3_col_2" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_3_col_3" data-id="" data-price=""></div>
			<div class="seat" data-name="row_3_col_4" data-id="" data-price=""></div>
			<div class="seat" data-name="row_3_col_5" data-id="" data-price=""></div>
			<div class="seat" data-name="row_3_col_6" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_3_col_7" data-id="" data-price=""></div>
			<div class="seat" data-name="row_3_col_8" data-id="" data-price=""></div>
		</div>
		<div class="row">
			<div class="seat" data-name="row_4_col_1" data-id="" data-price=""></div>
			<div class="seat" data-name="row_4_col_2" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_4_col_3" data-id="" data-price=""></div>
			<div class="seat" data-name="row_4_col_4" data-id="" data-price=""></div>
			<div class="seat" data-name="row_4_col_5" data-id="" data-price=""></div>
			<div class="seat" data-name="row_4_col_6" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_4_col_7" data-id="" data-price=""></div>
			<div class="seat" data-name="row_4_col_8" data-id="" data-price=""></div>
		</div>
		<div class="row">
			<div class="seat" data-name="row_5_col_1" data-id="" data-price=""></div>
			<div class="seat" data-name="row_5_col_2" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_5_col_3" data-id="" data-price=""></div>
			<div class="seat" data-name="row_5_col_4" data-id="" data-price=""></div>
			<div class="seat" data-name="row_5_col_5" data-id="" data-price=""></div>
			<div class="seat" data-name="row_5_col_6" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_5_col_7" data-id="" data-price=""></div>
			<div class="seat" data-name="row_5_col_8" data-id="" data-price=""></div>
		</div>
		<div class="row">
			<div class="seat" data-name="row_6_col_1" data-id="" data-price=""></div>
			<div class="seat" data-name="row_6_col_2" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_6_col_3" data-id="" data-price=""></div>
			<div class="seat" data-name="row_6_col_4" data-id="" data-price=""></div>
			<div class="seat" data-name="row_6_col_5" data-id="" data-price=""></div>
			<div class="seat" data-name="row_6_col_6" data-id="" data-price=""></div>
			<div class="gap"></div>
			<div class="seat" data-name="row_6_col_7" data-id="" data-price=""></div>
			<div class="seat" data-name="row_6_col_8" data-id="" data-price=""></div>
		</div>
	</div>





	<form action="${pageContext.request.contextPath}/reservation/seat_select" method="post" onsubmit="return validateForm()">
		
		<input type="text" id="mu_sch_id" name="mu_sch_id" value="${mu_sch_id }" readonly>
		<input type="text" id="booked_count" name="booked_count" value="0" readonly>
		<input type="text" id="customer_id" name="customer_id" value="customer" readonly>
		<div id="inputContainer"></div>
		<input type="text" id="total_cost" name="total_cost" value="0" readonly>
		<button type="submit">예약</button>
	</form>
	<script>
	
	
	//db값 불러와서 저장하기
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
	    let seatLimit = 0;
		
	    //예매완료된 자리 설정 , 각 좌석마다 id 값 부여
	    seats.forEach(seatElement => {
	        const seatName = seatElement.getAttribute('data-name');
	        seatData.forEach(seatItem => {
	            if (seatName === seatItem.seat_name) {
	                if (parseInt(seatItem.seat_reservation, 10) !== 0) {
	                    seatElement.classList.add('occupied');
	                }
	                seatElement.setAttribute('data-id', seatItem.seat_id);
	                seatElement.setAttribute('data-price', seatItem.seat_price);
	            }
	        });
	    });

	    //인수 선택시 전체적인 초기화 , 활성 재배치 및 input 창 재설정
	    const seatLimitButtons = document.querySelectorAll('.seat-limit-buttons button');
	    seatLimitButtons.forEach(button => {
	        button.addEventListener('click', () => {
	            seatLimitButtons.forEach(btn => btn.classList.remove('active'));
	            button.classList.add('active');
	            seatLimit = +button.getAttribute('data-limit');
	            for(let i=0 ;i<seats.length ;i++){
	                seats[i].classList.remove('selected');
	            }

	        	document.getElementById('booked_count').value=seatLimit;
	            //인수 선택시 input 창 수에 맞게 추가
	            inputcount=0
	            document.getElementById('inputContainer').innerHTML = '';
	            for (let i = 0; i < seatLimit; i++) {
	                const newInput = document.createElement('input');
	                newInput.type = 'text';
	                newInput.id ='insert_seat'+i;
	                newInput.name = 'insert_seat'+i;
	                newInput.placeholder = (i+1)+'번째 선택좌석';
	                newInput.readOnly = true; 
	                newInput.style.display = 'block'; 
	                newInput.required = true; 

	                document.getElementById('inputContainer').appendChild(newInput);
	            }
	            
				//금액 초기화
	            document.getElementById('total_cost').value=0;
	            
	            
	        });
	    });

	    // 좌석 클릭시 색변경 및 선택된 좌석 id값 input에 보내기 , 가격 합산
	    seats.forEach(seat => {
	        seat.addEventListener('click', () => {
                let totalcost = parseInt(document.getElementById('total_cost').value, 10);
	            if (!seat.classList.contains('occupied')) {
	            	
	            	
	                const selectedSeats = document.querySelectorAll('.seat.selected');
	                if (seat.classList.contains('selected')) {
	                    seat.classList.remove('selected');
	                    for(let i=0;i< seatLimit;i++){
	                    	const checkseat = document.getElementById('insert_seat' + i);
	                    	if(checkseat.value=== seat.getAttribute('data-id')){
	                    		checkseat.value = '';
	                    		
	                    		totalcost-=parseInt(seat.getAttribute('data-price'),10);
	                    		break;
	                    	}
	                    }
	                    
	                } else if (selectedSeats.length < seatLimit) {
	                    seat.classList.add('selected');
	                    for(let i=0;i< seatLimit;i++){
	                    	const checkseat = document.getElementById('insert_seat' + i);
	                    	if(checkseat && checkseat.value===''){
	                    		checkseat.value = seat.getAttribute('data-id');
	                    		totalcost+=parseInt(seat.getAttribute('data-price'),10);
	                    		break;
	                    	}
	                    }   
	                } 
	            }
	            document.getElementById('total_cost').value=totalcost;
	        });
	    });
	


	});

    
    function validateForm() {
        var totalCost = document.getElementById("total_cost").value;
        
        if (parseInt(totalCost) === 0) {
            alert("좌석을 선택해주세요.");
            return false; 
        }
        
        return true; 
    }

    
       
    </script>
</body>
</html>
