<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Anton+SC&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/menu.css' />">
  
</head>
<body>
<header>
	<nav class="navbar">
		<ul>
			<c:if test="${loginUser==null}">
			 	<li class="regular"><a href='${pageContext.request.contextPath}/user/login.do'>로그인</a><li>
			 	<li class="regular"><a href='${pageContext.request.contextPath}/user/add.do'>회원가입</a><li>
			</c:if>
			<c:if test="${loginUser!=null}">
				<li class="bold">${loginUser.id} (${loginUser.username})님<li>
				<li class="regular"><a href='${pageContext.request.contextPath}/user/list.do'>관리자 페이지</a><li>
				<li class="regular"><a href='${pageContext.request.contextPath}/user/logout.do'>로그아웃</a><li>
			</c:if>
		</ul>	
 </nav>
<hr>

        <div class="menu">
       	  <div class="logo"><a href='${pageContext.request.contextPath}/home.do'>BizBoost</a></div>
            <ul>
                <li class="regular"><a href='${pageContext.request.contextPath}/bbs/intro.do'>베스트 상품</a></li>
                <li class="regular"><a href='${pageContext.request.contextPath}/bbs/list.do'>농산물</a></li>
                <li class="regular"><a href='${pageContext.request.contextPath}/bbs/list.do'>수산물</a></li>
                <li class="regular"><a href='${pageContext.request.contextPath}/bbs/list.do'>축산물</a></li>
                <li class="regular"><a href='${pageContext.request.contextPath}/bbs/list.do'>기타/용품</a></li>
                <li class="regular"><a href='${pageContext.request.contextPath}/bbs/list.do'>이벤트</a></li>
            </ul>
        </div>
</header>        
</body>
</html>