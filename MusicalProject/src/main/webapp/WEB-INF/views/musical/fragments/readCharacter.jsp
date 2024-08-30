<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		 $("#updateActor").click(function() {
             $("#updateForm").toggle();
         });
		 
		 $(".deleteActor").click(function() {
				var actor_id = $(this).data('actor-id');
				if (confirm('정말로 삭제하시겠습니까?')) {
					window.location.href = "deleteActor?actor_id=" + actor_id;
				}
			});
		
		 	
		 
	});
</script>
<style>
#updateForm{
display:none;
}
#updateActor #deleteActor{
display:none;
}
</style>

<title>배우 정보</title>
</head>
<body>
	<div class="all">
	<h1>배우 정보</h1>
		<div class="photo">
		<img src=${actor.actor_img }>
		</div>
		<div class="info">
			<div class="info_head">
				<p>이름: ${actor.actor_name }</p>
			</div>
			<div class="info_main">
				<p>생년월일: <fmt:formatDate pattern="yyyy-MM-dd"
						value="${actor.birthday}" /></p>
				<p>신장: ${actor.height}</p>
			</div>
		</div>
		<div id="updateForm">
			<form action="updateActor">
				<input type="number" value="${actor.actor_id}"name="actor_id" readonly>
				<input type="text" value="${actor.actor_name}"name="actor_name">
				<input type="date" value="<fmt:formatDate value='${actor.birthday}' pattern='yyyy-MM-dd'/>"name="birthday">
				<input type="number" value="${actor.height}"name="height">
				<input type="number" value="${actor.weight}"name="weight">
				<input type="text" value="${actor.actor_img}"name="actor_img"><br>
				<input type="submit" value="수정하기">
			</form>
		</div>
		<button id="updateActor" >수정하기</button> <button class="deleteActor" data-actor-id=${actor.actor_id }>삭제하기</button>
	</div>
</body>
</html>