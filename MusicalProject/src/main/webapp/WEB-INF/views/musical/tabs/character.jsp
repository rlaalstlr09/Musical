<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style>
.character_list{
display:inline-block;
margin:1px;
margin-bottom:15px;
text-align: center;
width:80%;
border:1px solid lightgray;
 
}
.character_container{
width:50%;
display: grid;
  grid-template-columns: repeat(5, 1fr); /* 5개의 열 */
 text-align: center;
}

div{
border:1px solid white;}
.all {
  display: flex;
  flex-direction: column; /* 자식 요소들을 세로로 배치 */
  align-items: center; /* 자식 요소들을 수평으로 가운데 정렬 */
  min-height: 100vh; /* 전체 화면 높이 */
  text-align: center; /* 텍스트 중앙 정렬 */
}

.head{
 margin-bottom: 20px; /* 제목과 character_container 사이의 여백 */
  font-size: 24px; /* 제목 크기 조정 */
  text-align: center; /* head 안의 텍스트 중앙 정렬 */}


</style>
<title>등장인물</title>	
</head>
<body>
<div class="all">

<h1 class="head">등장인물</h1><br>

<div class="character_container">
	<c:forEach items="${List }" var="acdto">
		<div class="character_list">
		
			<div class="character_head">
				<a href="readCharacter?actor_id=${acdto.actor_id }"><img alt="사진" src="${acdto.actor_url}" width="80" height="80"></a>
			</div>	
			<div class="character_info">
				<strong>${acdto.character_name}</strong><br	>${acdto.actor_name}
			</div>
		
		</div>
	</c:forEach>

</div>
</div>
</body>
</html>