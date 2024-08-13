<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>달력</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .calendar-container {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            margin-bottom: 20px; /* 달력과 테이블 사이에 여백 추가 */
        }

        .calendar-controls {
            text-align: center;
            margin-bottom: 10px;
        }

        .calendar-controls button {
            padding: 8px 16px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            margin: 0 5px;
            transition: background-color 0.3s;
        }

        .calendar-controls button:hover {
            background-color: #0056b3;
        }

        .calendar-controls button:active {
            background-color: #004080;
        }

        .calendar-table-container {
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #f8f9fa;
            color: #343a40;
        }

        td:hover {
            background-color: #f1f1f1;
        }

        .sunday {
            color: red;
        }

        .saturday {
            color: blue;
        }

        .input-container {
            margin-left: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        input {
            padding: 10px;
            font-size: 16px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
        }

        #result {
            margin-top: 20px; /* 결과 테이블과 달력 사이에 여백 추가 */
        }

        .result-table {
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            width: 500px; /* 테이블의 가로 사이즈 조정 */
        }

        .result-table th {
            background-color: #007bff;
            color: white;
        }

        .result-table td {
            text-align: left;
        }

        .result-table a {
            color: #007bff;
            text-decoration: none;
        }

        .result-table a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
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
            <input type="hidden" id="selected-date" readonly placeholder="년월이 표시됩니다">
        </div>
    </div>

    <table id="result">
        <!-- 결과 테이블 내용은 JavaScript에서 동적으로 추가됩니다 -->
    </table>

    <script>
        let currentYear = new Date().getFullYear();
        let currentMonth = new Date().getMonth();

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


                
                cell.addEventListener('click', function() {
                    const selectedDate = year + '/' + (month + 1) + '/' + cell.id;
                    document.getElementById('selected-date').value = selectedDate;

                    $.ajax({
                        url: '${pageContext.request.contextPath}/reservation/select_date',
                        type: 'GET',
                        dataType: 'json',
                        data: {
                            date: selectedDate
                        },
                        success: function(data) {
                            console.log(data);
                            const resultContainer = document.getElementById('result');
                            resultContainer.innerHTML = ''; // 기존 내용 초기화

                            if (data.length === 0) {
                                resultContainer.innerHTML = '해당 날짜에 대한 일정이 없습니다.';
                            } else {
                                const table = document.createElement('table');
                                table.classList.add('result-table');
                                table.border = '1'; // 테이블 테두리 추가

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
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.error('Error:', textStatus, errorThrown);
                            alert('일정을 가져오는 중 오류가 발생했습니다.');
                        }
                    });
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
