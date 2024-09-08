<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
  @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

  * {
      font-family: 'Gowun Dodum', sans-serif;
  }

  body {
      background-color: #f8f9fa; /* 밝은 회색 배경 */
      margin: 0;
      padding: 0;
  }

  /* 레이아웃 설정 */
  .layout {
      display: flex;
      align-items: flex-start;
      padding: 20px;
  }

  .sidebar {
      width: 20%;
      padding-right: 20px;
  }

  .content {
      width: 80%;
      background-color: white; /* 흰색 배경 */
      padding: 20px;
      border-radius: 8px; /* 모서리를 둥글게 */
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
  }

  .content h2 {
      font-size: 28px;
      margin-bottom: 20px;
      color: #343a40; /* 다크 그레이 */
  }

  table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
  }

  table, th, td {
      border: 1px solid #dee2e6; /* 테두리 색상 */
      text-align: center;
  }


  th, td {
      padding: 12px;
      text-align: center;
      vertical-align: middle;
  }

  th {
      background-color: #e9ecef; /* 헤더 배경색 */
      color: #495057; /* 헤더 텍스트 색상 */
      font-weight: bold;
  }

  tr:nth-child(even) {
      background-color: #f8f9fa; /* 짝수 행 배경색 */
  }

  tr:hover {
      background-color: #e9ecef; /* 행에 마우스 오버 시 배경색 */
  }

  .pagination {
      display: flex;
      justify-content: center;
      padding: 0;
      list-style: none;
      margin-top: 20px;
  }

 

  #addbutton {
      display: flex;
      justify-content: flex-end; /* 오른쪽 정렬 */
      margin-bottom: 20px;
  }

  #addbutton .btn {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
  }

  #addbutton .btn:hover {
      background-color: #0056b3;
  }
  
    table a {
    text-decoration: none; /* 링크 밑줄 없애기 */
    color: inherit; /* 텍스트 색상을 부모 요소에서 상속 */
}

table a:hover {
    color: #0056b3; /* 링크에 마우스를 올렸을 때의 색상 */
    text-decoration: underline; /* 마우스를 올렸을 때 밑줄을 추가하려면 이 속성 사용 */
}

</style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/comm/menu.jsp"/>

  <div class="layout">
    <!-- 좌측 사이드바 -->
    <div class="sidebar">
      <jsp:include page="/WEB-INF/views/comm/side.jsp"/>
    </div>

    <!-- 우측 메인 콘텐츠 -->
    <div class="content">
      <h2>대전소식 게시판</h2>

	 <c:if test="${loginUser.admin == 'Y'}">	
      <div id="addbutton">
        <!-- 게시글 작성 버튼 -->
        <a href='${pageContext.request.contextPath}/news/add.do?newsBbsid=${bbs.newsBbsId}'><button type="button" class="btn btn-primary">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
            <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
            <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
          </svg> 게시글 작성
        </button></a>
      </div>  
	  </c:if>
	  
      <table>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>아이디</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <!-- 게시물 리스트를 반복하여 출력 -->
          <c:forEach items="${pagination}" var="bbs">
            <tr>
              <td>${bbs.newsBbsNo}</td>
              <td><a href='${pageContext.request.contextPath}/news/select.do?newsBbsNo=${bbs.newsBbsNo}'>${bbs.newsBbsTitle}</a></td>
              <td>${bbs.newsBbsId}</td>
              <td>${bbs.newsBbsUser}</td>
              <td>${bbs.newsBbsRegdate}</td>
              <td>${bbs.newsBbsCnt}</td> 
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- 페이지네이션 -->
      <div class="pagination">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <!-- 이전 페이지 링크 -->
            <li class="page-item">
              <c:choose>
                <c:when test="${currentPage > 1}">
                  <a class="page-link" href="${pageContext.request.contextPath}/news/list.do?page=${currentPage - 1}&size=${pageSize}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </c:when>
                <c:otherwise>
                  <span class="page-link disabled"><span aria-hidden="true">&laquo;</span></span>
                </c:otherwise>
              </c:choose>
            </li>

            <!-- 페이지 번호 링크 -->
            <c:forEach begin="1" end="${totalPages}" var="i">
              <c:choose>
                <c:when test="${i == currentPage}">
                  <li class="page-item active"><span class="page-link">${i}</span></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/news/list.do?page=${i}&size=${pageSize}">${i}</a></li>
                </c:otherwise>
              </c:choose>
            </c:forEach>

            <!-- 다음 페이지 링크 -->
            <li class="page-item">
              <c:choose>
                <c:when test="${currentPage < totalPages}">
                  <a class="page-link" href="${pageContext.request.contextPath}/news/list.do?page=${currentPage + 1}&size=${pageSize}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </c:when>
                <c:otherwise>
                  <span class="page-link disabled"><span aria-hidden="true">&raquo;</span></span>
                </c:otherwise>
              </c:choose>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>

  <!-- footer는 다른 콘텐츠 하단에 위치 -->
  <jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
</body>
</html>
