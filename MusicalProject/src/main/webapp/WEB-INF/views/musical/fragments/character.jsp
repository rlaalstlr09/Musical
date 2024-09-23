<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style>
.character_list {
	display: inline-block;
	margin: 1px;
	margin-bottom: 15px;
	text-align: center;
	width: 100%;
	
	
}
.actor-img{
border-radius: 50%;
}

.character_container {
	width: 80%;
	display: grid;
	grid-template-columns: repeat(5, 1fr); /* 5개의 열 */
	text-align: center;
	gap:25px;
}

div {
	border: 1px solid white;
}

.all {
	display: flex;
	flex-direction: column; /* 자식 요소들을 세로로 배치 */
	align-items: center; /* 자식 요소들을 수평으로 가운데 정렬 */
	min-height: 100%; /* 전체 화면 높이 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

.head {
	margin-bottom: 20px; /* 제목과 character_container 사이의 여백 */
	font-size: 24px; /* 제목 크기 조정 */
	text-align: center; /* head 안의 텍스트 중앙 정렬 */
}
</style>

<script>
		$(document).ready(function() {
			// 버튼 클릭 시 모달에 JSP 콘텐츠를 로드
			$('.actor-img').off('click').on('click',function() {
				let actorId = $(this).data('actor');
				$.ajax({
					url : '/ex/character/readCharacter', // 로드할 JSP 페이지의 URL
					type : 'GET',
					data: {
						actor_id : actorId,
						musical_id : '${musical_id}'
					},
					success : function(response) {
						$('#actor-modal-body').html(response); // 모달의 콘텐츠를 업데이트
						$('#actor-modal').modal('show'); // 모달을 표시
					},
					error : function(xhr, status, error) {
						console.error('AJAX 요청 실패:', status, error);
					}
				});
			});
		});
	</script>
<title>등장인물</title>
</head>
<body>
	<div class="all">

		<h1 class="head">등장인물</h1>
		<br>

		<div class="character_container">
			<c:forEach items="${List }" var="acdto">
				<div class="character_list">
	
					<div class="character_head">
						
						<img alt="사진" class = "actor-img" data-toggle="modal" data-target="#actor-modal" src="/ex/resources/img/actor/${acdto.actor_img }" width="100" height="100" data-actor="${acdto.actor_id }">
					</div>
					<div class="character_info">
						<strong>${acdto.character_name}</strong><br>${acdto.actor_name}
					</div>

				</div>
			</c:forEach>

		</div>
	</div>

	<div id="actor-modal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">배우 정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="actor-modal-body">
					<!-- 동적으로 로드될 콘텐츠가 여기에 들어갑니다 -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>