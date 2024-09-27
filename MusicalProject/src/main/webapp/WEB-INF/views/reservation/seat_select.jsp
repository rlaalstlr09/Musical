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

.musical-info {
    position: relative; 
    top: 150px; 
    width: 100%; 
    max-width: 600px; 
    border: 1px solid #ccc; 
    padding: 20px; /* 패딩 약간 늘림 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 강화 */
    transition: border-color 0.3s;
    background-color: #ffffff; /* 배경 색 추가 */
}

.container {
    position: relative; 
    top: 200px; 
    padding: 20px; 
    width: 80%; 
    max-width: 850px;
    background-color: white; 
    border-radius: 10px; /* 모서리 라운드 강화 */
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2); /* 더 부드러운 그림자 */
    margin-bottom: 300px; 
    display: flex; 
    flex-direction: column; 
    align-items: center; 
}

.control-container {
    display: flex;
    justify-content: space-between;
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
    gap: 30px; /* 항목 간격을 넓혀줌 */
}

.showcase li {
    display: flex;
    align-items: center;
}

.showcase div {
    display: inline-block;
    height: 24px; /* 크기 약간 늘림 */
    width: 24px; /* 크기 약간 늘림 */
    border-radius: 3px;
    margin-right: 5px;
}

.seat {
    background-color: #444451;
    height: 24px; /* 크기 약간 늘림 */
    width: 24px; /* 크기 약간 늘림 */
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
    margin: 0;
}

ul li {
    display: inline-block;
    margin: 0 10px;
}
small{
	width : 55px;
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
}

#ExSelected {
    background-color: #6feaf6;
}

#ExOccupied {
    background-color: red;
    pointer-events: none;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

input[type="text"] {
    margin: 5px;
    padding: 10px; /* 패딩 약간 늘림 */
    border: 1px solid #ddd;
    border-radius: 4px;
    width: 100%; /* 입력란의 폭을 100%로 설정 */
    max-width: 300px; /* 최대 폭 설정 */
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
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>

	<div class="musical-info">
	    <div>뮤지컬 : ${musical.musical_title}</div>
	    <div>공연일자 : ${date }</div>
    	<div>공연시간 : ${time }</div>
	</div>
	
	<div class="container">
		<div class="control-container">
			<div class="showcase">
				<ul class="showcase">
					<li>
						<div id="ExSeat"></div> <small>선택가능</small>
					</li>
					<li>
						<div id="ExSelected"></div> <small>선택좌석</small>
					</li>
					<li>
						<div id="ExOccupied"></div> <small>예약불가</small>
					</li>
				</ul>
			</div>
			<div class="seat-count">
				<div class="seat-limit-buttons">
					<button data-limit="1">1 인</button>
					<button data-limit="2">2 인</button>
					<button data-limit="3">3 인</button>
					<button data-limit="4">4 인</button>
				</div>
			</div>
		</div>

		<div class="movie-container">
			<div class="stage">stage</div>

			<div class="row">
				<div class="seat" data-name="A-1" data-id="" data-price=""></div>
				<div class="seat" data-name="A-2" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="A-3" data-id="" data-price=""></div>
				<div class="seat" data-name="A-4" data-id="" data-price=""></div>
				<div class="seat" data-name="A-5" data-id="" data-price=""></div>
				<div class="seat" data-name="A-6" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="A-7" data-id="" data-price=""></div>
				<div class="seat" data-name="A-8" data-id="" data-price=""></div>
			</div>
			<div class="row">
				<div class="seat" data-name="B-1" data-id="" data-price=""></div>
				<div class="seat" data-name="B-2" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="B-3" data-id="" data-price=""></div>
				<div class="seat" data-name="B-4" data-id="" data-price=""></div>
				<div class="seat" data-name="B-5" data-id="" data-price=""></div>
				<div class="seat" data-name="B-6" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="B-7" data-id="" data-price=""></div>
				<div class="seat" data-name="B-8" data-id="" data-price=""></div>
			</div>
			<div class="row">
				<div class="seat" data-name="C-1" data-id="" data-price=""></div>
				<div class="seat" data-name="C-2" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="C-3" data-id="" data-price=""></div>
				<div class="seat" data-name="C-4" data-id="" data-price=""></div>
				<div class="seat" data-name="C-5" data-id="" data-price=""></div>
				<div class="seat" data-name="C-6" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="C-7" data-id="" data-price=""></div>
				<div class="seat" data-name="C-8" data-id="" data-price=""></div>
			</div>
			<div class="row">
				<div class="seat" data-name="D-1" data-id="" data-price=""></div>
				<div class="seat" data-name="D-2" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="D-3" data-id="" data-price=""></div>
				<div class="seat" data-name="D-4" data-id="" data-price=""></div>
				<div class="seat" data-name="D-5" data-id="" data-price=""></div>
				<div class="seat" data-name="D-6" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="D-7" data-id="" data-price=""></div>
				<div class="seat" data-name="D-8" data-id="" data-price=""></div>
			</div>
			<div class="row">
				<div class="seat" data-name="E-1" data-id="" data-price=""></div>
				<div class="seat" data-name="E-2" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="E-3" data-id="" data-price=""></div>
				<div class="seat" data-name="E-4" data-id="" data-price=""></div>
				<div class="seat" data-name="E-5" data-id="" data-price=""></div>
				<div class="seat" data-name="E-6" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="E-7" data-id="" data-price=""></div>
				<div class="seat" data-name="E-8" data-id="" data-price=""></div>
			</div>
			<div class="row">
				<div class="seat" data-name="F-1" data-id="" data-price=""></div>
				<div class="seat" data-name="F-2" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="F-3" data-id="" data-price=""></div>
				<div class="seat" data-name="F-4" data-id="" data-price=""></div>
				<div class="seat" data-name="F-5" data-id="" data-price=""></div>
				<div class="seat" data-name="F-6" data-id="" data-price=""></div>
				<div class="gap"></div>
				<div class="seat" data-name="F-7" data-id="" data-price=""></div>
				<div class="seat" data-name="F-8" data-id="" data-price=""></div>
			</div>
		</div>

		<div id="reservationContainer">
			<form id="reservationForm"				
				action="${pageContext.request.contextPath }/reservation/reservation_end"
				method="post" onsubmit="return handlePayment()">
				<input type="hidden" id="mu_sch_id" name="mu_sch_id" value="${mu_sch_id }" readonly>
				<input type="hidden" id="booked_count" name="booked_count" value="0" readonly>
				<input type="hidden" id="customer_id" name="customer_id" value="${customer}" readonly>
				<input type="hidden" id="customer_email" name="customer_email" value="customer@naver.com" readonly>
				<div id="inputContainer"></div>
				<div>
					결제 할 금액 <input type="text" id="total_cost" name="total_cost" value="0" readonly>
					<button type="submit">결제</button>
				
				</div>
				
			</form>
			
		</div>
	</div>
	

	
	<jsp:include page="../layout/footer.jsp"/>
	
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
	                newInput.type = 'hidden';
	                newInput.id ='insert_seat'+i;
	                newInput.name = 'insert_seat'+i;
	                newInput.placeholder = (i+1)+'번째 선택좌석';
	                newInput.readOnly = true; 
	                newInput.style.display = 'block'; 
	                newInput.required = true; 

	                document.getElementById('inputContainer').appendChild(newInput);
	            }
	            
				//바꾸면 금액 초기화
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

        var bookedCount = document.getElementById("booked_count").value;
        var selectedSeats = document.querySelectorAll('.seat.selected').length;
        if (parseInt(totalCost) === 0) {
            alert("좌석을 선택해주세요.");
            return false; 
        }
        if (selectedSeats !== parseInt(bookedCount, 10)) {
            alert(`좌석이 선택하신 인원에 맞게  선택되지 않았습니다.`);
            return false;
        }
        
        return true; 
    }
        
    
    
    
    function handlePayment() {
        console.log("handlePayment called");
        
        if (!validateForm()) {
            console.log("Form validation failed");
            return false;
        }

        var IMP = window.IMP; 
        IMP.init('imp27170120');

        var totalCost = document.getElementById("total_cost").value;
        var customer = document.getElementById("customer_id").value;
        var customerEmail = document.getElementById("customer_email").value;
        var merchant_uid = 'merchant_' + new Date().getTime();
        
        console.log("Starting payment request");

        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: merchant_uid,
            name: "뮤지컬예약",
            amount: totalCost,
            buyer_email: customerEmail,
            buyer_name: customer,
        }, function(rsp) {
            if (rsp.success) {
                alert('결제가 완료되었습니다.');

                // 결제 ID와 결제 방법 값을 폼에 추가
                var input_merchantUid = document.createElement('input');
                input_merchantUid.type = 'hidden';
                input_merchantUid.name = 'merchant_uid';
                input_merchantUid.value = merchant_uid;

                var payment_method = document.createElement('input');
                payment_method.type = 'hidden';
                payment_method.name = 'payment_method';
                payment_method.value = 'card';
                
                var form = document.querySelector('#reservationForm');
                form.appendChild(input_merchantUid);
                form.appendChild(payment_method);


                console.log("Submitting form");
                form.submit();
            } else {
                alert('결제에 실패하였습니다. 에러내용: ' + rsp.error_msg);
            }
        });

        return false; 
    }


</script>

    
    
    
    
    
    
    
</body>
</html>
