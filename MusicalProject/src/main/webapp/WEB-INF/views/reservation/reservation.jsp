<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	// 현재 날짜 가져오기
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	String todayDate = sdf.format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>달력</title>
<link rel="stylesheet" href="reservation.css">
<style>
footer {
	margin-top: 100px; /* 푸터를 아래로 내리기 위해 간격 조정 */
}

.subject-line {
	color: #333;
	font-size: 28px;
	font-weight: bold;
	margin-top: -45px;
	margin-bottom: 30px;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	display: flex;
	flex-direction: column;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.container {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 200px 0 20px 0;
}

.musical-info {
	position: absolute;
	top: 200px;
	right: 50px;
	border: 1px solid #ddd;
	padding: 10px;
	background-color: white; /
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

@media ( max-width : 768px) {
	.musical-info {
		position: relative;
		top: auto;
		right: auto;
		margin-top: 20px;
	}
}

.calendar-container {
	margin-top: 20px;
}

.calendar-controls {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10px;
}

.calendar-controls button {
	cursor: pointer;
	font-size: 24px;
	color: #7c7c7c;
	background: none;
	border: none;
	margin: 0 20px;
}

.calendar-controls #thismonth {
	font-size: 24px; /* 글자 크기 증가 */
	font-weight: bold;
	color: #333;
	margin: 5px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px; /* 여백 추가 */
}

th {
	color: #7c7c7c;
	font-weight: normal;
	padding: 12px; /* 패딩 증가 */
}

td {
	padding: 12px; /* 패딩 증가 */
	text-align: center;
	font-size: 18px; /* 글자 크기 증가 */
	cursor: pointer;
}

td:hover {
	background-color: #f0f0f0;
}

.selected {
	background-color: #A084DC;
	color: white;
	border-radius: 50%;
}

.sunday {
	color: red;
}

.saturday {
	color: blue;
}

.btn-secondary {
	background-color: #A084DC; /* 버튼 배경색 수정 */
	color: white; /* 글자색 수정 */
	padding: 12px;
	margin-top: 20px; /* 여백 증가 */
	text-align: center;
	font-size: 16px; /* 글자 크기 증가 */
	border-radius: 8px;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-secondary:hover {
	background-color: #7c5cb5; /* 호버 색상 조정 */
}

.result-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px; /* 여백 추가 */
}

.result-table th, .result-table td {
	padding: 12px;
	text-align: center;
	font-size: 16px;
	border: 1px solid #ddd;
}

.result-table th {
	background-color: #f5f5f5;
	color: #333;
	font-weight: bold;
}

.result-table td {
	background-color: white;
	color: #555;
}

.result-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.result-table tr:hover {
	background-color: #e0e0e0;
	transition: background-color 0.3s ease;
}

.result-table a {
	color: #A084DC;
	text-decoration: none;
	font-weight: bold;
}

.result-table a:hover {
	color: #7c5cb5;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div class="container">
		<div class="calendar-container">
			<div class="calendar-table-container">
				<div class="calendar-controls">
					<button id="prev-month">◀</button>
					<span id="thismonth"></span>
					<button id="next-month">▶</button>
				</div>
				<table>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
					<tbody id="calendar-body">
					</tbody>
				</table>
			</div>
			<div class="input-container">
				<input type="hidden" id="venue_id" value="${venue_id}" readonly>
				<input type="hidden" id="musical_id" value="${musical_id}" readonly>
				<input type="hidden" id="selected-date" readonly>
			</div>
		</div>
		<h1>회차정보</h1>
		<div id="result"></div>


		<div class="btn-secondary"
			onclick="location.href='${pageContext.request.contextPath}/musical/detail/${musical_id}'">뒤로</div>
		
	</div>
	<div class="musical-info">
		<div>
			<img src="/ex/resources/img/musical/${musical.musical_poster}"
				alt="poster" class="img-fluid">
		</div>

		<div>뮤지컬 : ${musical.musical_title}</div>
		<div>공연기간 : ${start} ~ ${end}</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />

	<script>
    let currentYear = new Date().getFullYear();
    let currentMonth = new Date().getMonth();
    var todayDate = '<%=todayDate%>';

    function renderCalendar(year, month) {
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);

        document.getElementById('thismonth').textContent = year + '년 ' + (month + 1) + '월';

        const calendarBody = document.getElementById('calendar-body');
        calendarBody.innerHTML = '';

        let row = document.createElement('tr');
        for (let i = 0; i < firstDay.getDay(); i++) {
            row.appendChild(document.createElement('td'));
        }

        let date = 1;
        while (date <= lastDay.getDate()) {
            if (row.children.length === 7) {
                calendarBody.appendChild(row);
                row = document.createElement('tr');
            }
            const cell = document.createElement('td');
            cell.textContent = date;
            cell.id = date;
            cell.classList.add('select_date');

            let dayPosition = (date + firstDay.getDay() - 1) % 7;

            if (dayPosition === 0) {
                cell.classList.add('sunday');
            } else if (dayPosition === 6) {
                cell.classList.add('saturday');
            }

            cell.addEventListener('click', function () {
                let formattedMonth = month + 1;  // month는 0부터 시작하므로 1을 더해줍니다.
                if (formattedMonth < 10) {
                    formattedMonth = '0' + formattedMonth;  // 두 자리 수로 맞춥니다.
                }

                let day = cell.id;
                if (day.length < 2) {
                    day = '0' + day;  // 두 자리 수로 맞춥니다.
                }

                const selectedDate = year + '/' + formattedMonth + '/' + day;
                document.getElementById('selected-date').value = selectedDate;
                let venue_id = parseInt(document.getElementById('venue_id').value);
                let musical_id = parseInt(document.getElementById('musical_id').value);

                if (todayDate <= selectedDate) {
                    // 일반 사용자일 경우 오늘 이전 날짜 클릭 불가, 관리자인 경우 클릭 가능
                    $.ajax({
                        url: '${pageContext.request.contextPath}/reservation/select_date',
                        type: 'GET',
                        dataType: 'json',
                        data: {
                            date: selectedDate,
                            venue_id: venue_id,
                            musical_id: musical_id
                        },
                        success: function (data) {
                            console.log("Received data from server:", data);
                            const resultContainer = document.getElementById('result');
                            resultContainer.innerHTML = '';

                            if (data.length === 0) {
                                resultContainer.innerHTML = '해당 날짜에 대한 일정이 없습니다.';
                            } else {
                                const table = document.createElement('table');
                                table.classList.add('result-table');
                                table.border = '1';

                                // 헤더 생성
                                const thead = document.createElement('thead');
                                const headerRow = document.createElement('tr');
                                const headers = ['날짜', '시간', '홀 ID', '예약가능좌석 / 전체좌석', '예약'];
                                headers.forEach(header => {
                                    const th = document.createElement('th');
                                    th.textContent = header;
                                    headerRow.appendChild(th);
                                });

                                thead.appendChild(headerRow);
                                table.appendChild(thead);

                                const tbody = document.createElement('tbody');
                                data.forEach(dto => {
                                    const row = document.createElement('tr');

                                    const td1 = document.createElement('td');
                                    const onlydate = dto.mu_sch_date.substring(0, 10);

                                    td1.textContent = onlydate;
                                    row.appendChild(td1);

                                    const td2 = document.createElement('td');
                                    td2.textContent = dto.mu_sch_time;
                                    row.appendChild(td2);

                                    const td3 = document.createElement('td');
                                    td3.textContent = dto.hall_id;
                                    row.appendChild(td3);

                                    const td4 = document.createElement('td');
                                    td4.textContent = dto.seat_count;
                                    row.appendChild(td4);

                                    const td5 = document.createElement('td');
                                    const link = document.createElement('a');
                                    link.href = `${pageContext.request.contextPath}/reservation/seat_select?mu_sch_id=` + dto.mu_sch_id;
                                    link.textContent = '예약';
                                    td5.appendChild(link);
                                    row.appendChild(td5);

                                    tbody.appendChild(row);
                                });
                                table.appendChild(tbody);

                                resultContainer.appendChild(table);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error('Error:', textStatus, errorThrown);
                            alert('일정을 가져오는 중 오류가 발생했습니다.');
                        }
                    });
                }
            });

            row.appendChild(cell);
            date++;
        }

        while (row.children.length < 7) {
            row.appendChild(document.createElement('td'));
        }
        calendarBody.appendChild(row);
    }

    function prevMonth() {
        if (currentMonth === 0) {
            currentMonth = 11;
            currentYear--;
        } else {
            currentMonth--;
        }
        renderCalendar(currentYear, currentMonth);
    }

    function nextMonth() {
        if (currentMonth === 11) {
            currentMonth = 0;
            currentYear++;
        } else {
            currentMonth++;
        }
        renderCalendar(currentYear, currentMonth);
    }

    // 초기 달력 렌더링
    renderCalendar(currentYear, currentMonth);

    document.getElementById('prev-month').addEventListener('click', prevMonth);
    document.getElementById('next-month').addEventListener('click', nextMonth);
</script>

</body>
</html>
