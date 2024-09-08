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
<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-body-secondary">© U-Jam Daejeon, Inc</p>

    <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
    </a>

    <ul class="nav col-md-4 justify-content-end">
      <li class="nav-item"><a href="${pageContext.request.contextPath}/home.do" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="${pageContext.request.contextPath}/bbs/list.do" class="nav-link px-2 text-body-secondary">관광지</a></li>
      <li class="nav-item"><a href="${pageContext.request.contextPath}/food/list.do" class="nav-link px-2 text-body-secondary">맛집</a></li>
      <li class="nav-item"><a href="${pageContext.request.contextPath}/free/list.do" class="nav-link px-2 text-body-secondary">커뮤니티</a></li>
    </ul>
  </footer>
</div>
 
</body>
</html>