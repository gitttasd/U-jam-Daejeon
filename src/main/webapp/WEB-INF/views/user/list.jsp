<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Wp5HNfWCRcmB5D0Xsw7IK2icUjRgzV3q6bZ+Rz5oL4Y5eR5f5GPEF/5T5zZ8vFb" crossorigin="anonymous">
    <style>
        body {
            padding-top: 20px;
        }
        table th, table td {
            text-align: center;
        }
        .pagination {
            margin-top: 20px;
        }
        .btn-custom {
            margin: 0 5px;
        }
        
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/comm/menu.jsp"/>

    <div class="container">
        <h1 class="mb-4">회원 정보</h1>
        
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>User No</th>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Birthdate</th>
                    <th>Remark 1</th>
                    <th>Remark 2</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.userNo}</td>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.address}</td>
                        <td>${user.gender}</td>
                        <td>${user.birthdate}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/edit.do?id=${user.id}" class="btn btn-warning btn-sm btn-custom">Edit</a>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/user/del.do" method="post" class="d-inline">
                                <input type="hidden" name="id" value="${fn:escapeXml(user.id)}">
                                <button type="submit" class="btn btn-danger btn-sm btn-custom">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <!-- Previous page link -->
                <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/user/list.do?page=${currentPage - 1}&size=${pageSize}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <!-- Page number links -->
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/user/list.do?page=${i}&size=${pageSize}">${i}</a>
                    </li>
                </c:forEach>

                <!-- Next page link -->
                <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/user/list.do?page=${currentPage + 1}&size=${pageSize}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-2k1G7oI9E9KkIQQlLGhM3jA93bK5M6E98F92zt/6FFsZtFQt99SgW6wctk3E72IF4" crossorigin="anonymous"></script>
</body>
</html>
