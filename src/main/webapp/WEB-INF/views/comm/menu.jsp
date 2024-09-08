<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>유잼 대전</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

    * {
      font-family: 'Gowun Dodum', sans-serif;
    }

    body {
      background-color: white;
    }

    .logo{
      font-weight: bold;
      font-size: 20px;
    }

  </style>
</head>
<body>

<!-- 네비바 -->
<nav class="py-2 bg-body-tertiary border-bottom">
    <div class="container d-flex flex-wrap">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="${pageContext.request.contextPath}/home.do" class="nav-link link-body-emphasis px-2 active" aria-current="page">Home</a>
        </li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/bbs/list.do" class="nav-link link-body-emphasis px-2">관광지</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/food/list.do" class="nav-link link-body-emphasis px-2">맛집</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/free/list.do" class="nav-link link-body-emphasis px-2">커뮤니티</a></li>
      </ul>
      <ul class="nav">
      <c:if test="${loginUser==null}">
        <li class="nav-item"><a href='${pageContext.request.contextPath}/user/login.do' class="nav-link link-body-emphasis px-2">로그인</a></li>
        <li class="nav-item"><a href='${pageContext.request.contextPath}/user/add.do' class="nav-link link-body-emphasis px-2">회원가입</a></li>
      </c:if>
		<c:if test="${loginUser != null}">
		    <li class="nav-item d-flex align-items-center">${loginUser.id} (${loginUser.username})님</li>
		    
		    <c:choose>
		        <c:when test="${loginUser.admin == 'Y'}">
		            <li class="nav-item"><a href='${pageContext.request.contextPath}/user/list.do' class="nav-link link-body-emphasis px-2">관리자 페이지</a></li>
		        </c:when>
		        <c:otherwise>
		            <li class="nav-item"><a href='${pageContext.request.contextPath}/user/page.do' class="nav-link link-body-emphasis px-2">마이 페이지</a></li>
		        </c:otherwise>
		    </c:choose>
		
		    <li class="nav-item"><a href='${pageContext.request.contextPath}/user/logout.do' class="nav-link link-body-emphasis px-2">로그아웃</a></li>
		</c:if>
      </ul>
    </div>
    
    <!-- 헤더 -->
    <header class="py-3 mb-4">
      <div class="container d-flex flex-wrap justify-content-center">
        <a href="${pageContext.request.contextPath}/home.do" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto link-body-emphasis text-decoration-none">
          <svg class="bi me-2" width="40" height="32">
            <use xlink:href="#bootstrap"></use>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
            class="bi bi-backpack2-fill" viewBox="0 0 16 16">
            <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z" />
            <path
              d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5" />
          </svg>
          <span class="logo">U-Jam Daejeon</span>
        </a>
  <!--       <form class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
          <input type="search" placeholder="Search..." aria-label="Search">
          <button type="button" class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
              class="bi bi-backpack2-fill" viewBox="0 0 16 16">
              <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
              <path
                d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5">
              </path>
            </svg>
            검색하기
          </button>
        </form> -->
      </div>
    </header>
  </nav>
</body>
</html>