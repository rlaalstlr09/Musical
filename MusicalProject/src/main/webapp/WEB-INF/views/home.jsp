<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css">
</head>

<body>
	<jsp:include page="../../resources/layout/header.jsp" />


	<div class="slideshow-container">

		<c:forEach var="img" items="${img_set1}">

			<div class="mySlides fade">
				<div class="numbertext">1 / 3</div>
				<img
					src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
					style="width: 100%; height: 720px;">
				<div class="text"></div>
			</div>

		</c:forEach>
		<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
			onclick="plusSlides(1)">❯</a>

		<div class="dot-container">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
	</div>

	</section>
	<div class="recommend">
		<div class="recommend_text">RECOMMENDED MUSICAL</div>
	</div>
	<div class="open_carousel">
		<c:forEach var="img" items="${img_set2}">
			<div class="open_carousel-item">
				<img
					src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
					alt="Image 1">
				<div class="overlay">
					<div class="overlay-text">Image 1 Description</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>


	<div class="purple_text">
		ALLTIME<br> LEGEND
	</div>

	<div class="purple1_text">"티켓보라에서 예약하면 50%할인"</div>

	<div class="purple">
		<div class="background"></div>
		<div class="purple_slides">
			<c:forEach var="img" items="${img_set3}">
				<img
					src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
					alt="Image 1">
			</c:forEach>
			.
		</div>
	</div>


	<div class="concerts-container">
		<div class="openconcert1_text">OPEN MUSICAL</div>

		<div class="openconcert_text">
			<a href="#"> + </a>
		</div>
		<c:forEach var="img" items="${img_set4}">
			<div class="concerts">
				<img
					src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
					alt="Image 1">
				<div class="overlay">
					<div class="overlay-text">Image 1 Description</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="KIDS1_text">
		<a href="#"> + </a>
	</div>

	<div class="KIDS1">
		<div class="KIDS_text">KIDS MUSICAL</div>

		<div class="KIDS">
			<div class="main-container">
				<c:forEach var="img" items="${img_set5}" begin="0" end="0">
					<div class="large-item">
						<a href="#"> <img
							src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
							alt="이미지01">
						</a>
					</div>
				</c:forEach>


				<div class="grid-container">
					<div class="top-row">
						<c:forEach var="img" items="${img_set5}">
							<div class="grid-item">
								<a href="#"> <img
									src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
									alt="이미지02">
								</a>
							</div>
						</c:forEach>
					</div>

					<div class="bottom-row">
						<c:forEach var="img" items="${img_set5}">
							<div class="grid-item">
								<a href="#"> <img
									src="<%=request.getContextPath()%>/resources/img/피겨.jpg"
									alt="이미지04">
								</a>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>

		</div>


		<div class="You">
			<div class="left-content">
				<div class="text-line line-1">
					<br>인사이드아웃2<br>
				</div>
				<div class="text-line line-2">디즈니·픽사의 대표작</div>
				<div class="text-line line-3">새로운 감정과 함께 돌아오다!</div>
			</div>
			<iframe width="700" height="350"
				src="https://www.youtube.com/watch?v=Vf-iEgOneNs" frameborder="0"
				allowfullscreen></iframe>
		</div>



		<div class="nowgallery_text">
			<a href="#"> + </a>
		</div>

		<div class="now_gallery">
			<div class="now_text">NOW SHOWING</div>

			<div class="now-container">
				<c:forEach var="img" items="${img_set8}">
					<div class="now-item">
						<a href="#"> <img
							src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
							alt="이미지01">
							<h5>황금카니발 2024</h5>
							<p>
								2024.09.28 - 2024.09.29<br>경주시 금리단길 일대
							</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="now-container-two">
				<c:forEach var="img" items="${img_set8}">
					<div class="now-item">
						<a href="#"> <img
							src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
							alt="이미지01">
							<h5>황금카니발 2024</h5>
							<p>
								2024.09.28 - 2024.09.29<br>경주시 금리단길 일대
							</p>
						</a>
					</div>
				</c:forEach>
			</div>


			<div class="now-container-three">
				<c:forEach var="img" items="${img_set8}">
					<div class="now-item">
						<a href="#"> <img
							src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
							alt="이미지01">
							<h5>황금카니발 2024</h5>
							<p>
								2024.09.28 - 2024.09.29<br>경주시 금리단길 일대
							</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<c:forEach var="img" items="${img_set9}">
				<div class="ad-banner" id="adBanner">
					<a href="#" target="_blank" class="banner-link">
						<div class="banner-content">
							<img
								src="<%=request.getContextPath()%>/resources/img/${img.img_name}"
								alt="Banner Image">
							<div class="banner-text">
								<h3>예매바로가기</h3>
							</div>
						</div>
					</a>
			</c:forEach>
		</div>

		<jsp:include page="../../resources/layout/footer.jsp"></jsp:include>

</body>
</html>
