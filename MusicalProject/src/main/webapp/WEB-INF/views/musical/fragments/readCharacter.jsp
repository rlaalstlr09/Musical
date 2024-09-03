<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<script>
	$(document).ready(function() {
		
		$("#updateActor").click(function() {
			$("#updateForm").toggle();
		});
 
		 $(".deleteActor").click(function() {
			var actor_id = $(this).data('actor-id');
			var musical_id = $(this).data('musical-id');
			if (confirm('정말로 삭제하시겠습니까?')) {
				window.location.href = "/ex/character/deleteActor?actor_id=" + actor_id + "&musical_id=" + musical_id;
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
.worksAll {
    display: flex;         /* 자식 요소들을 수평으로 정렬 */
    align-items: center;   /* 자식 요소들을 수직으로 중앙 정렬 */
   
    padding: 10px;         /* 컨테이너에 패딩 추가 (선택 사항) */
}
.worksPoster {
    margin-right: 20px; /* 포스터와 정보 간의 간격 */
}

.worksPoster p {
    margin: 0; /* 포스터 텍스트의 기본 마진 제거 */
}

/* 정보 스타일링 */
.worksInfo {
    flex: 1; /* 정보 영역이 가능한 모든 공간을 차지하게 설정 */
}
</style>

<title>배우 정보</title>
</head>
<body>
	<div class="all">
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
				<input type="submit" value="수정" >
			</form>
		</div>
		<button id="updateActor" >수정하기</button> 
    <button class="deleteActor" data-actor-id=${actor.actor_id } data-musical-id = ${musical_id }>삭제하기</button><br><br>
		  <div id="works">
		<p><strong>출연작품</strong></p>
		<c:forEach items="${worksList}" var="works">
			<div class="worksAll">
				<div class="worksPoster">
					<p>${works.musical_poster}</p>
				</div>
				<div class="worksInfo">
					<p><strong>${works.musical_title}</strong></p>
					${works.musical_period_start} ~ ${works.musical_period_end}<br><br>
					${works.character_name }역
				
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</body>
</html>