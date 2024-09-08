<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/menu.jsp"/>
    <h1>User List</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>User No</th>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Gender</th>
                <th>Birthdate</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>${findinfo.userNo}</td>
                    <td>${findinfo.id}</td>
                    <td>${findinfo.username}</td>
                    <td>${findinfo.email}</td>
                    <td>${findinfo.phone}</td>
                    <td>${findinfo.address}</td>
                    <td>${findinfo.gender}</td>
                    <td>${findinfo.birthdate}</td>
                </tr>
        </tbody>
    </table>
<a href="${pageContext.request.contextPath}/user/edit.do?id=${findinfo.id}">
<button type="button">수정하기</button> 
</a>
</body>
</html>
