<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>views/hello</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
</head>
<body>
    <h3>hello.jsp</h3>
</body>

</html>
