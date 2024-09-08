<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .main {
            color: white;
            background-image: url('<c:url value="/resources/img/expobridge.jpg" />');
            background-position: center;
            background-size: cover;
        }

        /* A태그 스타일 설정 */
        .card a {
            color: inherit; /* 부모 요소의 색상 상속 */
            text-decoration: none; /* 밑줄 제거 */
        }

        .card a:hover {
            color: #0d6efd; /* 마우스 오버 시 색상 변경 */
        }
  
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/comm/menu.jsp"/>

    <!-- 메인 사진 -->
    <div class="main">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">대전 엑스포 야경</h1>
                <p class="col-md-8 fs-4">대전 엑스포의 야경은 다채로운 조명으로 물들어 환상적인 경관을 선사합니다. 다리의 곡선과 구조를 강조하는 조명이 강과 도시의 풍경을 아름답게 비추며, 주변 산책로와 조경과 어우러져 매력적인 야경을 제공합니다. 이곳은 도시의 현대성과 자연의 아름다움을 동시에 즐길 수 있는 명소입니다.</p>
                <button class="btn btn-primary btn-lg" type="button" onclick="location.href='${pageContext.request.contextPath}/bbs/select.do?bbsNo=141'">구경하기</button>

            </div>
        </div>
    </div>
    
    <!-- 관광지 -->
    <div class="container px-4 py-5" id="custom-cards">
        <h2 class="pb-2 border-bottom">즐거움이 가득한 관광지</h2>
        
        <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
            <c:forEach items="${attList}" var="att" varStatus="status">
                <div class="col">
                 <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
                    style="background-image: url('${pageContext.request.contextPath}/bbs/down.do?attNo=${att.attNo}'); background-size: cover;">
                        <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><a href='${pageContext.request.contextPath}/bbs/select.do?bbsNo=${bbsList[status.index].bbsNo}'>${bbsList[status.index].bbsTitle}</a></h3>
                            <!-- 브랜드 이미지 -->
                            <ul class="d-flex list-unstyled mt-auto">
                                <li class="me-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                                        <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"/>
                                        <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"/>
                                    </svg>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <!-- 맛집 -->
    <div class="container px-4 py-5" id="custom-cards">
        <h2 class="pb-2 border-bottom">입이 즐거운 대전 맛집</h2>
        
        <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
            <c:forEach items="${foodattList}" var="foodatt" varStatus="status">
                <div class="col">
                    <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
                    style="background-image: url('${pageContext.request.contextPath}/food/down.do?foodAttNo=${foodatt.foodAttNo}'); background-size: cover;">
                        <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><a href='${pageContext.request.contextPath}/food/select.do?foodBbsNo=${foodList[status.index].foodBbsNo}'>${foodList[status.index].foodBbsTitle}</a></h3>
                            <!-- 브랜드 이미지 -->
                            <ul class="d-flex list-unstyled mt-auto">
                                <li class="me-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                                        <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"/>
                                        <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5.5 0 0 0 1.5-1.5v-2.382a1.5.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1-1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"/>
                                    </svg>
                                </li>
                               <!--  <li class="d-flex align-items-center me-3">
                                    <svg class="bi me-2" width="1em" height="1em">
                                        <use xlink:href="#geo-fill"></use>
                                    </svg>
                                    <small>Earth</small>
                                </li>
                                <li class="d-flex align-items-center">
                                    <svg class="bi me-2" width="1em" height="1em">
                                        <use xlink:href="#calendar3"></use>
                                    </svg>
                                    <small>3d</small>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
</body>
</html>
