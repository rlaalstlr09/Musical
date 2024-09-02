<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/WEB-INF/resources/css/header.css"> 

</head>

<body>
  <jsp:include page="layout/header.jsp"/>
  

  <div id='wrap'>
    <section> <!-- 슬라이더 추가 -->
      <div class="slider">
        <div class="slides">
    
          <img class="slide" src="<%=request.getContextPath()%>/resources/img/임시1.jpg" alt="메인2">
          <img class="slide" src="<%=request.getContextPath()%>/resources/img/임시1.jpg" alt="메인2">
          <img class="slide" src="<%=request.getContextPath()%>/resources/img/임시2.jpg" alt="메인2">
    
        </div>
      </div>
    
    </section>
   
    

  </div>

<jsp:include page="layout/footer.jsp"/>

</body>
</html>