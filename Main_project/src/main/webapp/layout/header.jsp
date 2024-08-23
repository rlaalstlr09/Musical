<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!-- Noto Sans font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap">
    <!-- Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- Custom CSS -->
    <link href="<%= request.getContextPath() %>/static/css/style.css" rel="stylesheet" />
    <style>
        .navbar {
            background-color: #4CAF50; /* 초록색 배경 */
        }
        .navbar-nav .nav-link {
            color: white; /* 링크 글자 색상 */
        }
        .navbar-nav .nav-link:hover {
            color: #d4edda; /* 링크 hover 시 색상 변경 */
        }
        .navbar-toggler {
            border-color: white; /* 토글 버튼 테두리 색상 */
        }
        .btn-outline-success {
            color: #4CAF50; /* 검색 버튼 텍스트 색상 */
            border-color: #4CAF50; /* 검색 버튼 테두리 색상 */
        }
        .btn-outline-success:hover {
            background-color: #4CAF50; /* 검색 버튼 배경 색상 변경 */
            color: white; /* 검색 버튼 텍스트 색상 변경 */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link " href="${pageContext.request.contextPath}/owner/owner_list">고객관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/pet/pet_list">반려동물관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/calendar">달력</a>
        </li>
      </ul>
      ${shop_id }
      <form class="d-flex" role="search" action="${pageContext.request.contextPath}/search_main" method="get" onsubmit="return validateSearch()">
        <input class="form-control me-2" type="search" name="keyword" id="keyword" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
  <script>
    function validateSearch() {
        var keyword = document.getElementById("keyword").value.trim();
        if (keyword === "") {
            alert("검색어를 입력해주세요");
            return false;
        }
        return true;
    }
  </script>
</nav>
<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9LY1R8dr0Hc6I1CC3dB7IuG7r0nTjlF0ChG9LqZK6FZfSLjz6LZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-1Y3F0AQcKFN65dVd3L2t2eVRBSMUs9RMq43iqGJpV3jpYb3K3jprbxA0EpG0HkQ8" crossorigin="anonymous"></script>
</body>
</html>
