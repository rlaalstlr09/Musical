<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>관리자권한 스케줄 관리</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #f8f9fa;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 400px;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
	text-align: center;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-size: 14px;
	margin-bottom: 5px;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 8px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.form-group button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px;
	font-size: 16px;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	margin-top: 10px;
}

.form-group button:hover {
	background-color: #0056b3;
}
</style>




</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
	<div class="container">
		<h1>Musical Schedule 입력</h1>
		<form action="${pageContext.request.contextPath}/reser_admin/mu_sch_admin" method="post">
			<div class="form-group">
				<label for="venue_id">공연장:</label> 
				<select id="venue_id" name="venue_id" required>
					<option value="" disabled selected>공연장을 선택해주세요</option>
					<c:forEach var="venue" items="${venuedtos}">
						<option value="${venue.venue_id}">${venue.venue_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="hall_id">공연홀:</label>
				<select id="hall_id" name="hall_id" required>
					<option value="" disabled selected>공연홀을 선택해주세요</option>
				</select>
			</div>
			<div class="form-group">
				<label for="musical_id">뮤지컬:</label> 
				<select id="musical_id" name="musical_id" required>
					<c:forEach var="musical" items="${musicaldtos}">
						<option value="${musical.musical_id}">${musical.musical_title}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="mu_sch_date">일정 날짜:</label>
				 <input type="date" id="mu_sch_date" name="mu_sch_date" required>
			</div>
			<div class="form-group">
				<label for="mu_sch_time">일정 시간:</label>
				 <input type="time" id="mu_sch_time" name="mu_sch_time" required>
			</div>
				<input type="hidden" id="seat_count" name="seat_count"  value="48/48"required>
			<div class="form-group">
				<button type="submit">제출</button>
			</div>
		</form>
	</div>
</body>







<script>
$(document).ready(function() {
    $("#venue_id").change(function() {
        var venue_id = $(this).val();
        $.ajax({
            url: '${pageContext.request.contextPath}/reser_admin/venue_select',
            type: "GET",
            data: { venue_id: venue_id  },
            success: function(halls) {
                var hallSelect = $("#hall_id");
                hallSelect.empty(); 
                hallSelect.off("change");
                $.each(halls, function(index, hall) {
                    hallSelect.append($("<option></option>")
                        .attr("value", hall.hall_id).text(hall.hall_name));
                });
            },
            error: function(xhr, status, error) {
                console.error("AJAX 오류: " + error);
            }
        });
    });
});
</script>




</html>



