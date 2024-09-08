<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style>
#form{
	width:500px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 80px;
}
a{
	margin-left: 10px;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/menu.jsp"/>
<form id="form" action='${pageContext.request.contextPath}/user/login.do' method='post'>
	<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="#0d6efd" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
	  <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"/>
	  <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"/>
	</svg>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="id">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
      <label for="floatingPassword">비밀번호</label>
    </div>

    <div class="form-check text-start my-3">
      <label id="add" class="form-check-label" for="flexCheckDefault">
        회원가입하기<a href="${pageContext.request.contextPath}/user/add.do">click</a>
      </label>
    </div>
    <button class="btn btn-primary w-100 py-2" type="submit">로그인 하기</button>
  </form>
</body>
</html>
