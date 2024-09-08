<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공동구매 메인페이지</title> 

</head>
<body>
<jsp:include page="/WEB-INF/views/shopnav/menu.jsp"/>
	
	<body>
    <h2>게시글 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>썸네일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="post" items="${postList}">
                <tr>
                    <td>${post.prodName}</td>
                    <td>${post.prodPrice}</td>
                  <td>
                        <c:choose>
                            <c:when test="${not empty post.thumbnailNewName}">
                                <img src="${post.thumbnailNewName}" alt="${post.thumbnailName}" width="100"/>
                            </c:when>
                            <c:otherwise>
                                No Thumbnail
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr> 
            </c:forEach>
        </tbody>
    </table>
</body>

</body>