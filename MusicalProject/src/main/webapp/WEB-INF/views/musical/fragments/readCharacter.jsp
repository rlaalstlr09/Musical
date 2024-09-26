<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>배우 정보</title>
<link rel="stylesheet" href="styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var auth = $(this).data('auth');  // Note: This will not work correctly unless data-auth is set on an element
        $('#updateActor').show();
        $('.deleteActor').show();
        
        if (auth === 'admin') {
            $('#updateActor').show();
            $('.deleteActor').show();
        } else {
            $('#updateActor').hide();
            $('.deleteActor').hide();
        }

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
    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        background-color: #fff;
    }
    #updateForm{
	display:none;
	}	
	#updateActor #deleteActor{
	display:none;
	}
    .all {
        max-width: 900px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .photo img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
    }
    .info {
        margin-top: 20px;
    }
    .info_head, .info_main {
        margin-bottom: 20px;
    }
    .info_head p {
        font-size: 1.2em;
        font-weight: bold;
    }
    .info_main p {
        margin: 5px 0;
    }
    #updateForm {
        margin-top: 20px;
    }
    #updateForm input {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    #updateForm input[type="submit"] {
        background-color: #28a745;
        color: white;
        border: none;
        cursor: pointer;
    }
    #updateForm input[type="submit"]:hover {
        background-color: #218838;
    }
    button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        color: white;
        background-color: #007bff;
        cursor: pointer;
        font-size: 1em;
        margin: 5px;
    }
    button:hover {
        background-color: #0056b3;
    }
    .deleteActor {
        background-color: #dc3545;
    }
    .deleteActor:hover {
        background-color: #c82333;
    }
    .worksAll {
        display: flex;
        align-items: center;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    .worksPoster {
        margin-right: 20px;
        flex-shrink: 0;
    }
    .worksPoster img {
        max-width: 200px;
        max-height: 150px;
        border-radius: 8px;
    }
    .worksInfo {
        flex: 1;
    }
    .worksInfo p {
        margin: 5px 0;
    }
    .worksInfo strong {
        font-size: 1.2em;
    }
</style>
</head>
<body>
    <div class="all">
        <div class="photo">
            <img src="/ex/resources/img/actor/${actor.actor_img }" alt="${actor.actor_name}">
        </div>
        <div class="info">
            <div class="info_head">
                <p>이름: ${actor.actor_name}</p>
            </div>
            <div class="info_main">
                <p>생년월일: <fmt:formatDate pattern="yyyy-MM-dd" value="${actor.birthday}" /></p>
                <p>신장: ${actor.height}</p>
            </div>
        </div>
        <div id="updateForm">
            <form action="/ex/character/updateActor">
                <input type="number" value="${actor.actor_id}" name="actor_id" readonly>
                <input type="text" value="${actor.actor_name}" name="actor_name">
                <input type="date" value="<fmt:formatDate value='${actor.birthday}' pattern='yyyy-MM-dd'/>" name="birthday">
                <input type="number" value="${actor.height}" name="height">
                <input type="number" value="${actor.weight}" name="weight">
                <input type="text" value="${actor.actor_img}" name="actor_img"><br>
                <input type="hidden" value="${musical_id}" name="musical_id">
                <input type="submit" value="수정">
            </form>
        </div>
        <button id="updateActor">수정하기</button>
        <button class="deleteActor" data-actor-id="${actor.actor_id}" data-musical-id="${musical_id}">삭제하기</button><br><br>
        <div id="works">
            <p><strong>출연작품</strong></p>
            <c:forEach items="${worksList}" var="works">
                <div class="worksAll">
                    <div class="worksPoster">
                        <img src="/ex/resources/img/musical/${works.musical_poster}" alt="${works.musical_title}">
                    </div>
                    <div class="worksInfo">
                        <p><strong>${works.musical_title}</strong></p>
                        <p>${works.musical_period_start}<br>~<br>${works.musical_period_end}</p>
                        <p>${works.character_name} 역</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
