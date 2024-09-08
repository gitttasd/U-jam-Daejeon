<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/comm/menu.jsp"/>
    <meta charset="UTF-8">
    <title>게시판 상세페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
            body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .layout {
            display: flex;
            align-items: flex-start;
            padding: 20px;
        }

        .sidebar {
            width: 275px;/* 25%; */
            padding-right: 20px;
        }

        .content {
            width: 65%;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            margin-left: 100px;
        }

        .form {
            border: 2px solid #0d6efd;
            padding: 20px;
            border-radius: 8px;
            background-color: white;
            margin-bottom: 20px;
        }

 
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #dee2e6;
            font-size: 16px;
    
        }

        th {
            background-color: #f1f1f1;
            color: #333;
            width: 80px;
        }

		td{
			background-color: #ffffff;
			
		}
        textarea {
            width: 100%;
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 10px;
            resize: none;
            background-color: #f8f9fa;
        }

        .footer {
            text-align: right;
            margin-top: 20px;
        }

        .footer button {
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .footer button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                margin-bottom: 20px;
            }

            .content {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="layout">
        <!-- 좌측 사이드바 -->
        <div class="sidebar">
            <jsp:include page="/WEB-INF/views/comm/side.jsp"/>
        </div>
        <!-- 메인 컨텐츠 -->
        <div class="content">    
            <div class="form">
                <div class="container">
                    <table>
                        <tr>
                            <th>글 번호</th>
                            <td>${bbsinfo.newsBbsNo}</td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>${bbsinfo.newsBbsId}</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>${bbsinfo.newsBbsUser}</td>
                        </tr>
                        <tr>
                        	<th>제목</th>
                        	<td>${bbsinfo.newsBbsTitle}</td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td style="width: 500px; height: 300px; max-width:500px; max-height:300px;overflow-y: auto;">
                 				<c:out value="${bbsinfo.newsBbsCon}" escapeXml="false"/>
                 			</td>	
                        </tr>
                    </table>
                </div>
                <div class="footer">
                   
                    <a href="${pageContext.request.contextPath}/news/list.do"><button type="button">목록으로</button></a>
                     <c:if test="${bbsinfo.newsBbsId == loginUser.id || loginUser.admin == 'Y'}">
                    <a href="${pageContext.request.contextPath}/news/edit.do?newsBbsNo=${bbsinfo.newsBbsNo}"><button type="button">수정하기</button></a>
                    <a href="${pageContext.request.contextPath}/news/del.do?newsBbsNo=${bbsinfo.newsBbsNo}"><button type="button">삭제하기</button></a>
                	</c:if>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
</body>
</html>
