<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/menu.jsp"/>
<h1>회원 정보 수정</h1> <!-- value 값을 쓰는 이유는 수정할 때 현재 값을 보여주기 위함 -->                     
 <form action='${pageContext.request.contextPath}/user/edit.do' method='post'>
	아이디 : <input type='text' name='id' value="${fn:escapeXml(uptfind.id)}" readonly><br> 
	<!-- 비밀번호 : <input type='password' name='memPass'><br> -->
	이메일 : <input type='text' name='username' value="${fn:escapeXml(uptfind.username)}"><br>
	이메일 : <input type='text' name='email' value="${fn:escapeXml(uptfind.email)}"><br>
	휴대전화: <input type='text' name='phone' value="${fn:escapeXml(uptfind.phone)}"><br>
	주소: <input type='text' name='address' value="${fn:escapeXml(uptfind.address)}">
	성별: 남성<input type="radio" name="gender" value="M" ${uptfind.gender == 'M' ? 'checked' : ''}> 여성 <input type="radio" name="gender" value="F" ${uptfind.gender == 'F' ? 'checked' : ''}><br>
	생년월일 : <input type='date' name='birthdate'  value="${uptfind.birthdate}"><br><br>
	<button type='submit'>저장</button>
</form>	

<!-- 삭제버튼 주석처리 -->	
<%-- <form action="${pageContext.request.contextPath}/user/del.do" method="post">
        <input type="hidden" name="id" value="${fn:escapeXml(uptfind.id)}">
        <button type="submit">삭제하기</button>
    </form> --%>
</body>
</html>