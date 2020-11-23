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

        #pageNum {
            width: 30px;
            height: auto;
            padding-top: 0;
            padding-bottom: 0;
            border: 1px solid #2f96b4;
        }

        table tr th {
            width: 100px;
        }

        form > table > tbody > tr > td {
            width: 100px;
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
<div class="container">

    <%--<form id="form" action="user/findPage">--%>
    <form id="form" action="">
        <table class="table table-hover table-bordered">
            <tr>
                <input id="page" style="display:none" value="1">
                <input id="size" style="display:none" value="${pageInfo.pageSize}">
                <th>id：</th>
                <td><input type="text" id="id" name="id" value="${queryParam.id}"></td>
                <th>name：</th>
                <td><input type="text" id="name" name="name" value="${queryParam.name}"></td>
            </tr>
            <tr>
                <th>age：</th>
                <td><input type="text" id="age" name="age" value="${queryParam.age}"></td>
                <th>password：</th>
                <td><input type="text" id="password" name="password" value="${queryParam.password}"></td>
            </tr>
            <tr>
                <th>phone：</th>
                <td><input type="text" id="phone" name="phone" value="${queryParam.phone}"></td>
                <th>city：</th>
                <td><input type="text" id="city" name="city" value="${queryParam.city}"></td>
            </tr>
        </table>
        <%--<button type="submit" class="btn btn-danger">查询</button>--%>
        <button type="button" class="btn btn-danger" onclick="formSubmit()">查询</button>
    </form>

</div>

<div>
    <nav style="text-align: center;">
        <ul class="pagination">
            <li>
                <a href="user/findPage?page=1&size=${pageInfo.pageSize}&id=${queryParam.id}&name=${queryParam.name}&age=${queryParam.age}&password=${queryParam.password}&phone=${queryParam.phone}&city=${queryParam.city}">首页</a>
            </li>
            <li <c:if test="${!pageInfo.hasPreviousPage}">class="disabled"</c:if>><a
                    href="user/findPage?page=${pageInfo.prePage}&size=${pageInfo.pageSize}&id=${queryParam.id}&name=${queryParam.name}&age=${queryParam.age}&password=${queryParam.password}&phone=${queryParam.phone}&city=${queryParam.city}"><<</a>
            </li>

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
                            href="user/findPage?page=${i}&size=${pageInfo.pageSize}&id=${queryParam.id}&name=${queryParam.name}&age=${queryParam.age}&password=${queryParam.password}&phone=${queryParam.phone}&city=${queryParam.city}">
                            ${i}
                    </a>
                </li>
            </c:forEach>


            <li <c:if test="${!pageInfo.hasNextPage}">class="disabled"</c:if>><a
                    href="user/findPage?page=${pageInfo.nextPage}&size=${pageInfo.pageSize}&id=${queryParam.id}&name=${queryParam.name}&age=${queryParam.age}&password=${queryParam.password}&phone=${queryParam.phone}&city=${queryParam.city}">>></a>
            </li>
            <li>
                <a href="user/findPage?page=${pageInfo.pages}&size=${pageInfo.pageSize}&id=${queryParam.id}&name=${queryParam.name}&age=${queryParam.age}&password=${queryParam.password}&phone=${queryParam.phone}&city=${queryParam.city}">尾页</a>
            </li>
            <li><span>当前是第 ${pageInfo.pageNum } 页,总${pageInfo.pages } 页, 总共 ${pageInfo.total } 条记录</span></li>
            <li>
                <a id="jumpA">
                    <label for="pageNum">跳转至：</label><input class="input" type="text" name="pageNum" id="pageNum"/></a>
                <a href="" id="jump">跳转</a>
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

</body>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>


    $(function () {

        var id = $("#id").val();
        var name = $("#name").val();
        var age = $("#age").val();
        var password = $("#password").val();
        var phone = $("#phone").val();
        var city = $("#city").val();

        $("#pageSizeSelect").val($("#size").val());

        $("ul.pagination li.disabled a").click(function () {
            return false;
        });

        $("#jump").click(function () {
            var page = $("#pageNum").val();
            var size = $("#size").val();
            $(this).attr('href', 'user/findPage?page=' + page + '&size=' + size + '&id=' + id + '&name=' + name + '&age=' + age + '&password=' + password + '&phone=' + phone + '&city=' + city);
        })

        $("#ok").click(function () {
            var page = 1;
            var size = $("#pageSizeSelect option:selected").val();
            $("#size").val(size);

            $(this).attr('href', 'user/findPage?page=' + page + "&size=" + size + '&id=' + id + '&name=' + name + '&age=' + age + '&password=' + password + '&phone=' + phone + '&city=' + city);
        })
    });

    /*
    * 此方法是为了尝试将自己设定的 size 传回后台，但是无效，如有人看到会解决，请联系一下QQ:3370996861，谢谢！
    * 方法目的：设置每页显示条数为某值，例如 10 后，点击确定按钮，然后多条件查询时，也就是点击完查询后，刷新过后的页面中应该也是每页显示10条记录，效果大致就是这样
    * 出现问题：http://localhost:8080/ssm/user/findPage?id=&name=&age=&password=123&phone=&city=   如题所述，action中系统并没有拼接 page 及 size
    */
    function formSubmit() {
        var form = $("#form");
        var page = 1;
        var size = $("#size").val();
        //alert(size);
        form.action = 'user/findPage?page=' + page + "&size=" + size + '&id=' + id + '&name=' + name + '&age=' + age + '&password=' + password + '&phone=' + phone + '&city=' + city;
        form.submit();
    }

</script>

</html>
