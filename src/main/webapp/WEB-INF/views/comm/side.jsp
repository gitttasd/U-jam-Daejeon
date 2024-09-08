<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
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

        .lnb {
            background-color: #f8f9fa; /* 밝은 회색 배경 */
            padding: 15px;
            border-radius: 8px; /* 테두리 라운딩 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
            margin-bottom: 20px;
        }

        .lnb h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #333; /* 다크 그레이 색상 */
        }

        .lnb nav ul {
            list-style: none; /* 기본 리스트 스타일 제거 */
            padding: 0;
        }

        .lnb nav ul li {
            margin-bottom: 10px;
        }

        .lnb nav ul li a {
    text-decoration: none;
    color: #007bff; /* 기본 링크 색상 */
    font-size: 18px;
    display: block;
    padding: 10px;
    border-radius: 6px;
    transition: background-color 0.3s ease, color 0.3s ease;
    font-weight: bold;
   
}

.lnb nav ul li a:hover {
    background-color: #007bff; /* 링크에 마우스 올릴 때 배경색 */
    color: #fff; /* 링크에 마우스 올릴 때 글자색 */
}

.lnb nav ul li.active a {
    background-color: transparent; /* 활성화된 항목의 배경색을 투명으로 설정 */
    color: #007bff; /* 활성화된 항목의 링크 색상 */
    font-weight: bold; /* 활성화된 항목의 글자 굵기를 일반으로 설정 */
}

.lnb nav ul li.active a:hover {
    background-color: #007bff; /* 호버 시 활성화된 항목의 배경색 */
    color: #fff; /* 호버 시 활성화된 항목의 글자색 */
}


    </style>
</head>
<body>
    <div class="container">
        <div class="lnb">
            <h2>커뮤니티</h2>
            <nav>
                <ul>
                    <li class="active current">
                        <a href="${pageContext.request.contextPath}/free/list.do">
                            자유게시판
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/event/list.do">
                            이벤트
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/news/list.do">
                            대전소식
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>
