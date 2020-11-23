<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>views/list</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .pagination > li > a.active {
            background-color: aquamarine;
        }

        #table {
            width: 700px;
            margin: 0 auto;
        }

        input {
            width: 30px;
            height: auto;
            padding-top: 0;
            padding-bottom: 0;
            border: 1px solid #2f96b4;
        }

        #jumpA {
            padding-top: 5px;
            padding-bottom: 5px;
        }
    </style>
</head>
<body>
<div id="table">
    <table class="table table-hover table-bordered">
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
        <c:forEach items="${pageInfo.list}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.password}</td>
                <td>${user.phone}</td>
                <td>${user.city}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<div>
    <nav style="text-align: center;">
        <ul class="pagination">
            <li><a href="user/findPageHelper?page=1&size=${pageInfo.pageSize}">首页</a></li>
            <li <c:if test="${!pageInfo.hasPreviousPage}">class="disabled"</c:if>><a
                    href="user/findPageHelper?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}"><<</a></li>

            <%--<c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum<=pageInfo.pages-5?pageInfo.pageNum+5:pageInfo.pages}" var="pageNumber" varStatus="status">
           &lt;%&ndash; <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber" varStatus="status">&ndash;%&gt;
                <li>
                    <input type="hidden" value="${status.count}" id="status">
                    <a <c:if test="${pageInfo.pageNum == pageNumber}">class="active" </c:if> href="user/findPageHelper?page=${pageNumber}&size=${pageInfo.pageSize}">
                            ${pageNumber}
                    </a>
                </li>
            </c:forEach>--%>
            <c:choose>
                <c:when test="${pageInfo.pages <= 5}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${pageInfo.pages}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="begin" value="${pageInfo.pageNum - 2}"/>
                    <c:set var="end" value="${pageInfo.pageNum + 2}"/>

                    <c:if test="${begin -1 <= 0}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="5"/>
                    </c:if>
                    <%--如果end超过最大页,设置起始页=最大页-5--%>
                    <c:if test="${end > pageInfo.pages}">
                        <c:set var="begin" value="${pageInfo.pages - 4}"/>
                        <c:set var="end" value="${pageInfo.pages}"/>
                    </c:if>

                </c:otherwise>
            </c:choose>

            <c:forEach begin="${begin}" end="${end}" var="i" varStatus="status">
                <li>
                    <a
                            <c:if test="${pageInfo.pageNum == i}">class="active" </c:if>
                            href="user/findPageHelper?page=${i}&size=${pageInfo.pageSize}">
                            ${i}
                    </a>
                </li>
            </c:forEach>


            <li <c:if test="${!pageInfo.hasNextPage}">class="disabled"</c:if>><a
                    href="user/findPageHelper?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">>></a></li>
            <li><a href="user/findPageHelper?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a></li>
            <li><span>当前是第 ${pageInfo.pageNum } 页,总${pageInfo.pages } 页, 总共 ${pageInfo.total } 条记录</span></li>
            <li>
                <a id="jumpA">跳转至：
                    <input class="pagination-control" type="text" name="page" id="page"/></a>
                <a href="" id="jump">确定</a>
            </li>
            <li>
                <a>每页显示:
                    <select id="pageSizeSelect">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="15">15</option>
                    </select>
                    <a href="" id="ok">确定</a>
                </a>
            </li>
        </ul>
    </nav>
</div>

<input id="size" type="hidden" value="${pageInfo.pageSize}">
<input id="number" type="hidden" value="${pageInfo.pageNum}">
</body>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>


    $(function () {

        $("#pageSizeSelect").val($("#size").val());

        $("ul.pagination li.disabled a").click(function () {
            return false;
        });

        $("#jump").click(function () {
            var page = $("#page").val();
            var size = $("#size").val();
            $(this).attr('href', 'user/findPageHelper?page=' + page + '&size=' + size);
        })

        $("#ok").click(function () {
            var page = 1;
            var size = $("#pageSizeSelect option:selected").val();
            $(this).attr('href', 'user/findPageHelper?page=' + page + "&size=" + size);
        })

    });

</script>

</html>
