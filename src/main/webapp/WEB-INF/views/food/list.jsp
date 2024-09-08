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
<style>
#addbutton {
  display: flex;
  justify-content: flex-end; /* 오른쪽 정렬 */
  margin-top: 50px;
}
  
  .pagination {
  display: flex;
  justify-content: center; /* 가운데 정렬 */
  padding: 0;
  list-style: none;
}
  
/* A태그 스타일 설정 */
        .card a {
            color: inherit; /* 부모 요소의 색상 상속 */
            text-decoration: none; /* 밑줄 제거 */
        }

        .card a:hover {
            color: #0d6efd; /* 마우스 오버 시 색상 변경 */
        }
          .star {
    font-size: 1.5rem; /* 별의 크기 조정 */
    color: #d3d3d3; /* 기본 별 색상 */
}

.star.filled {
    color: gold; /* 채워진 별 색상 */
}
 #main {
      position: relative;
      color: white;
      background-image: url('${pageContext.request.contextPath}/food/down.do?foodAttNo=101');
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
      height: 50vh; /* 섹션의 높이를 조절 (60% 뷰포트 높이) */
      padding: 5rem 0;
      margin-top: 2rem;
    }
#searchForm input[type="text"] {
 width: 100%; /* 입력 필드를 부모 요소의 너비에 맞추기 */
    max-width: 300px; /* 입력 필드의 최대 너비 설정 */
    height: 35px; /* 입력 필드의 높이 설정 */
    padding: 8px; /* 입력 필드의 내부 여백 설정 */
    border: 1px solid #ced4da; /* 입력 필드의 테두리 색상 설정 */
    border-radius: 5px; /* 입력 필드의 테두리 둥글게 설정 */
    font-size: 1rem; /* 입력 필드의 폰트 크기 설정 */
    box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/comm/menu.jsp"/>
 
<!-- 메인사진 -->
<section class="py-5 text-center container" id="main">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대전에서 먹거리 찾기</font></font></h1>
        <p class="lead text-body-secondary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대전의 숨은 맛집, 지금 바로 탐험해보세요</font></font></p>
        <p>
        
          <form id="searchForm" class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
          	  <select name="searchKey">
	          	<option value="title">제목</option>
	          	<option value="content">제목</option>
	          	<option value="total">제목+내용</option>
	          </select>
	          <script type="text/javascript">
	          		if('${searchVo.searchKey}')
	          		document.querySelector('[name="searchKey"]').value='${searchVo.searchKey}';
	          	</script>
          		<input type="text" name="searchValue" placeholder="검색어 입력" aria-label="Search">
    			  <input type="hidden" name="currentPageNo" value="1">
          <button type="submit" class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
              class="bi bi-backpack2-fill" viewBox="0 0 16 16">
              <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
              <path
                d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 1 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5">
              </path>
            </svg>
            검색하기
          </button>
        </form>
        </p>
      </div>
    </div>
  </section>

<!-- 앨범 -->
<div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:forEach items="${pagination}" var="bbs">
      <c:choose>
       <c:when test="${bbs.foodBbsStatus == 'Y'}">
        <div class="col">
          <div class="card shadow-sm">
            <c:choose> 
              <c:when test="${!empty bbs.attList}">
                <c:if test="${!empty bbs.attList[0]}">
                  <img src="${pageContext.request.contextPath}/food/down.do?foodAttNo=${bbs.attList[0].foodAttNo}" class="bd-placeholder-img card-img-top" width="100%" height="225" alt="Thumbnail">
                </c:if>
              </c:when>
              <c:otherwise>
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <title>Placeholder</title>
                  <rect width="100%" height="100%" fill="#55595c"></rect>
                  <text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지 없음</text>
                </svg>
              </c:otherwise>
            </c:choose>
            <div class="card-body">
              <p class="card-text">게시글 번호: ${bbs.foodBbsNo}</p>
              <p class="card-text"><a href='${pageContext.request.contextPath}/food/select.do?foodBbsNo=${bbs.foodBbsNo}'>${bbs.foodBbsTitle}</a></p>
              <p class="card-text">추천:
		      <c:choose>
		        <c:when test="${bbs.rating == null}">
		            <!-- 추천이 없을 때 빈 별 5개 표시 -->
		            <c:forEach var="i" begin="1" end="5">
		                <span class="star">&#9734;</span> <!-- 빈 별 -->
		            </c:forEach>
		        </c:when>
		        <c:otherwise>
		            <!-- 평점이 있을 때 평점에 따라 별 표시 -->
		            <c:forEach var="i" begin="1" end="5">
		                <c:choose>
		                    <c:when test="${i <= bbs.rating}">
		                        <span class="star filled">&#9733;</span> <!-- 채워진 별 -->
		                    </c:when>
		                    <c:otherwise>
		                        <span class="star">&#9734;</span> <!-- 빈 별 -->
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
		        </c:otherwise>
		    	</c:choose></p>
              <div class="d-flex justify-content-between align-items-center">
                <small class="text-body-secondary">조회수:${bbs.foodBbsCnt}</small>
              </div>
            </div>
          </div>
        </div>
         </c:when>
        </c:choose>
        </c:forEach>       
      </div>
      <c:if test="${loginUser.admin == 'Y'}">
      <div id="addbutton">
        <!-- 게시글 작성 버튼 -->
        <a href='${pageContext.request.contextPath}/food/add.do?id=${bbs.id}'><button type="button" class="btn btn-primary">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
            <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
            <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
          </svg> 게시글 작성
        </button></a>
      </div> 
      </c:if> 
    </div>
  </div>
  
<!-- 페이지네이션 -->
<script type="text/javascript">
    function goPage(pageNo){
        // 검색폼의 페이지 번호 인풋의 값을 인자로 받은 pageNo로 변경
        document.querySelector('[name="currentPageNo"]').value = pageNo;
        document.querySelector('#searchForm').submit();
    }
</script>



<nav aria-label="Page navigation example">
    <ul class="pagination">
        <!-- 이전 페이지 링크 -->
        <li class="page-item">
                <c:if test="${searchVo.firstPageNoOnPageList != 1}">
                    <a class="page-link" href="#" onclick="goPage(${searchVo.firstPageNoOnPageList-1});" aria-label="Previous">
                        <span aria-hidden="true">이전 페이지</span>
                    </a>
                </c:if>
        </li>

        <!-- 페이지 번호 링크 -->
        <c:forEach var="no" begin="${searchVo.firstPageNoOnPageList}" end="${searchVo.lastPageNoOnPageList}" step="1">
            <c:choose>
                <c:when test="${no == searchVo.currentPageNo}">
                    <li class="page-item active"><span class="page-link">${no}</span></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="#" onclick="goPage(${no});">${no}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- 다음 페이지 링크 -->
        <li class="page-item">
                <c:if test="${searchVo.lastPageNoOnPageList < searchVo.totalPageCount}">
                    <a class="page-link" href="#" onclick="goPage(${searchVo.lastPageNoOnPageList+1});" aria-label="Next">
                        <span aria-hidden="true">다음 페이지</span>
                    </a>
                </c:if>
        </li>
    </ul>
</nav>


</body>
</html>
