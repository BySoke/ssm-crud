<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>list</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .list-group-item-text {
            color: red;
        }
    </style>
</head>
<body>
<h2>点击蓝色选项跳转不同页面</h2>
<h3>请打开网络连接加载js\css等内容</h3>
<div class="list-group">
    <a href="user/findAll" class="list-group-item active">
        <h4 class="list-group-item-heading">
            查看所有列表
        </h4>
    </a>
    <a href="#" class="list-group-item">
        <h4 class="list-group-item-heading">
            实现：遍历所有的数据
        </h4>
        <p class="list-group-item-text">
            未实现：条件查询、分页及其他
        </p>
    </a>
</div>

<div class="list-group">
    <a href="user/findPageHelper" class="list-group-item active">
        <h4 class="list-group-item-heading">
            PageHelper分页列表-get【全局刷新页面】
        </h4>
    </a>
    <a href="#" class="list-group-item">
        <h4 class="list-group-item-heading">
            实现：PageHelper插件，实现遍历所有分页、页面跳转、页面页数自定义
        </h4>
        <p class="list-group-item-text">
            未实现：条件查询
        </p>
    </a>
</div>

<div class="list-group">
    <a href="user/findPage" class="list-group-item active">
        <h4 class="list-group-item-heading">
            PageHelper分页查询列表-get【全局刷新页面】
        </h4>
    </a>
    <a href="#" class="list-group-item">
        <h4 class="list-group-item-heading">
            实现：PageHelper插件，实现遍历所有分页、页面跳转、页面页数自定义、条件查询
        </h4>
        <p class="list-group-item-text">
            未实现：ajax局部刷新
        </p>
    </a>
</div>

<div class="list-group">
    <a href="user/jumpPage" class="list-group-item active">
        <h4 class="list-group-item-heading">
            PageHelper + ajax 分页列表-post【局部刷新页面】
        </h4>
    </a>
    <a href="#" class="list-group-item">
        <h4 class="list-group-item-heading">
            实现：PageHelper插件，实现遍历所有分页、ajax局部刷新分页、分页查询、页面跳转、显示条数自定义
        </h4>
        <p class="list-group-item-text">
            未实现：都已实现
        </p>
    </a>
</div>


<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script>

</script>
</body>
</html>
