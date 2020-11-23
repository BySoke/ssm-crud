<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>views/list</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        div {
            background-color: aliceblue;
        }
    </style>
</head>
<body>
    <h3>userList</h3>
    <div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>age</th>
                <th>password</th>
                <th>phone</th>
                <th>city</th>
            </tr>
            </thead>
            <tbody id="info">
            <c:forEach items="${userList}" var="userList">
            <tr>
                <td>${userList.id}</td>
                <td>${userList.name}</td>
                <td>${userList.age}</td>
                <td>${userList.password}</td>
                <td>${userList.phone}</td>
                <td>${userList.city}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
