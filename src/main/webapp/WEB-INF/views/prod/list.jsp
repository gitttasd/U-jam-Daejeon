<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/adminnav/menu.jsp"/>
    <h2>상품 리스트</h2>
    
    <table border="1">
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>재고</th>
                <th>카테고리</th>
                <th>상품정보</th>
                <th>등록일</th>
                <th>수정일</th>
            </tr>
        </thead>
        <tbody>
            <!-- 게시물 리스트를 반복하여 출력 -->
            <c:forEach items="${prodlist}" var="list">
                <tr>
                    <td>${list.prodId}</td>
                    <td>${list.prodName}</td>
                    <td>${list.prodPrice}</td>
                    <td>${list.prodStock}</td>
                    <td>${list.prodDist}</td>
                    <td>${list.prodInfo}</td>
                    <td><fmt:formatDate value="${list.prodRegDate}" type="date" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${list.prodUpdateDate}" type="date" pattern="yyyy-MM-dd"/></td>
                    <%-- <td><a href='${pageContext.request.contextPath}/prod/select.do/${list.prodId}'><button type="button">상세보기</button></a></td> --%>
                </tr>

            </c:forEach>
    </table>
    
    <!-- 게시물 작성 버튼 -->
    <br>
    <p><a href='${pageContext.request.contextPath}/prod/add.do'><button type="button">상품 등록</button></a></p>
    
    <div class="pagination">
        <!-- 현재 페이지와 총 페이지 수 설정 -->
        <c:set var="currentPage" value="${currentPage}" />
        <c:set var="totalPages" value="${totalPages}" />
        <c:set var="pageSize" value="${pageSize}" />

        <!-- 이전 페이지 링크 -->
        <c:choose>
            <c:when test="${currentPage > 1}">
                <a href="${pageContext.request.contextPath}/prod/list.do?page=${currentPage - 1}&size=${pageSize}">&lt; 이전</a>
            </c:when>
            <c:otherwise>
                <a class="disabled">&lt; 이전</a>
            </c:otherwise>
        </c:choose>

        <!-- 페이지 번호 링크 -->
        <c:forEach begin="1" end="${totalPages}" var="i">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/prod/list.do?page=${i}&size=${pageSize}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- 다음 페이지 링크 -->
        <c:choose>
            <c:when test="${currentPage < totalPages}">
                <a href="${pageContext.request.contextPath}/prod/list.do?page=${currentPage + 1}&size=${pageSize}">다음 &gt;</a>
            </c:when>
            <c:otherwise>
                <a class="disabled">다음 &gt;</a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
