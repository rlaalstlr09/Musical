<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
        width: 40px;
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
</style>
</head>
<body>

    <div class="calendar-container">
        <div class="calendar-table-container">
            <div class="calendar-controls">
                <button id="prev-month">◀ 이전 달</button>
                <span id="thismonth"></span>
                <button id="next-month">다음 달 ▶</button>
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
            <input type="text" id="selected-date" readonly placeholder="년월이 표시됩니다">
        </div>
    </div>

<script>
    let currentYear = new Date().getFullYear();
    let currentMonth = new Date().getMonth();

    function renderCalendar(year, month) {
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);

        document.getElementById('thismonth').textContent = year+'년'+ (month + 1)+'월';
        
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
            cell.id = date;  //
            cell.addEventListener('click', () => {
                document.getElementById('selected-date').value =year+'년'+ (month + 1)+'월'+cell.id+'일' ;
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


  //year+'년'+ (month + 1)+'월'+date+'일' ;

    
    document.getElementById('prev-month').addEventListener('click', prevMonth);
    document.getElementById('next-month').addEventListener('click', nextMonth);
</script>
</body>
</html>
