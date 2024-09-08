<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 작성</title>
    <style>
        /* 스타일 정의 */
        .form {
            border-style: solid;
            border-color: #0d6efd;
            border-width: 2px; /* 원하는 두께로 조정 */
            padding: 20px; /* 내용과 경계 사이의 간격을 조정 */
            border-radius: 8px; /* 모서리를 둥글게 만들기 (선택 사항) */
            width: 70%;
            margin: 0 auto; /* 수평 중앙 정렬 */
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #f1f1f1;
        }
        input[type="text"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .footer {
            text-align: right;
        }
    </style>
     <script src="https://cdn.tiny.cloud/1/h5yrozkhm4pop1e9p7yazo88cdqxlqtpd30jx7dg4tiiblg1/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body>
    <!-- 공통 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/comm/menu.jsp"/>

    <div class="container">
        <!-- 헤더 영역 -->
        <div class="py-5 text-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="72" height="57" fill="#0d6efd" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"/>
                <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"/>
            </svg>
            <h2>U-Jam Daejeon</h2>
            <p class="lead">게시판 수정</p>
        </div>
        <hr>
        
        <!-- 폼 영역 -->
        <div class="form">
            <form action="${pageContext.request.contextPath}/event/edit.do" method="post">
                <table>
                    <!-- 게시물 번호 -->
                    <tr>
                        <th>게시물 번호</th>
                        <td>
                            <input type="text" name="eventBbsNo" value="${fn:escapeXml(editform.eventBbsNo)}" readonly="readonly">
                        </td>
                    </tr>
                    <!-- 아이디 -->
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="eventBbsId" value="${fn:escapeXml(editform.eventBbsId)}" readonly="readonly">
                        </td>
                    </tr>
                    <!-- 제목 -->
                    <tr>
                        <th>제목</th>
                        <td>
                            <input type="text" name="eventBbsTitle" value="${fn:escapeXml(editform.eventBbsTitle)}">
                        </td>
                    </tr>
                    <!-- 내용 -->
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea id="BbsCon" name="eventBbsCon" rows="20" cols="80">${fn:escapeXml(editform.eventBbsCon)}</textarea>
                        </td>
                    </tr>
                </table>
                <!-- 제출 버튼 -->
                <div class="footer">
                    <button type="submit" class="btn btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                            <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
                            <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
                        </svg>
                        작성완료
                    </button>
                </div>
            </form>
            <!-- 목록으로 버튼 -->
            <a href="${pageContext.request.contextPath}/event/list.do">
                <button type="button" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                        <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
                        <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
                    </svg>
                    목록으로
                </button>
            </a>
            <br>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
    <script>
    var plugins = [
        "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
        "paste", "code", "help", "wordcount", "save", "fontsize", "fontselect"
    ];

    var edit_toolbar = 'formatselect fontselect fontsizeselect |'
                        + ' forecolor backcolor |'
                        + ' bold italic underline strikethrough |'
                        + ' alignjustify alignleft aligncenter alignright |'
                        + ' bullist numlist |'
                        + ' table tabledelete |'
                        + ' link image';

    tinymce.init({
        fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt",
        language: "ko_KR",
        selector: '#BbsCon', /* 지정 하고 싶은 곳 id 값 */
        height: 1000,
        menubar: true,
        image_title: true,
        automatic_uploads: true,
        file_picker_types: 'image',
        plugins: plugins,
        toolbar: edit_toolbar,
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
</script>
</body>
</html>
