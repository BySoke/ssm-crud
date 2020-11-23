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
    <title>views/list</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .pagination > li > a.active {
            background-color: aquamarine;
        }

        label {
            width: 100px;
        }

        #jumpA {
            padding-top: 3px;
            padding-bottom: 3px;
        }

        #pageNum {
            width: 30px;
            height: 26px;
        }

        li > a label {
            font-weight: inherit;
            width: 50px;
            display: inline-block;
            max-width: 70%;
            margin-bottom: 0;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-actions">
        <form id="form" action="">
            <table class="table table-hover table-bordered">
                <tr>
                    <td><label for="id">id：</label><input type="text" id="id" name="id" value=""></td>
                    <td><label for="name">name：</label><input type="text" id="name" name="name" value=""></td>
                </tr>
                <tr>
                    <td><label for="age">age：</label><input type="text" id="age" name="age" value=""></td>
                    <td><label for="password">password：</label><input type="text" id="password" name="password"
                                                                      value=""></td>
                </tr>
                <tr>
                    <td><label for="phone">phone：</label><input type="text" id="phone" name="phone" value=""></td>
                    <td><label for="city">city：</label><input type="text" id="city" name="city" value=""></td>
                </tr>
            </table>
        </form>
    </div>

    <div class="btn-group">
        <button type="button" id="btn-sub" class="btn btn-danger" onclick="formSubmit()">查询</button>
        <button type="button" id="btn-clr" class="btn btn-primary" onclick="formClear()">清空</button>
        <button type="button" id="btn-delAll" class="btn btn-info" onclick="delAllCheck()">删除所选</button>
        <button type="button" id="btn-add" class="btn btn-success">新增</button>
        <button type="button" id="btn-save" class="btn btn-warning">保存</button>
    </div>

    <div id="tableDiv" class="tab-container table" style="margin-top: 10px;margin-bottom: 10px;">
        <table class="table table-bordered" id="table-user">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all"/>
                </th>
                <th>id</th>
                <th>name</th>
                <th>age</th>
                <th>password</th>
                <th>phone</th>
                <th>city</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="info">

            </tbody>
        </table>
    </div>

    <div style="display: none">
        <input type="hidden" id="size" name="size" value="5">
    </div>

    <div class="container">
        <div id="page_div">

        </div>
    </div>

</div>


</body>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    //声明全局变量
    var totalRecord, currentPage;
    var number, lastNumber, everyPage, size;
    var id, name, age, password, phone, city;

    $(function () {
        size = $("#size").val();
        formSubmit(1, size);
    });

    //跳转至 xx 页，跳转按钮触发事件
    function jumpPage() {
        number = $("#pageNum").val();
        formSubmit(number, size);
    }

    //每页显示数据改变，点击确定按钮事件【可修改为 change 事件触发，个人爱好】
    function changeSize() {
        size = $("#pageSizeSelect option:selected").val();
        $("#size").val(size);

        formSubmit(1, size);
    }

    //表单提交函数与初始化融合
    function formSubmit(pageNum, pageSize) {

        //设置页码后查询时设定 pageSize 值
        if (checkIsNullOrEmpty($("#size").val())) {
            pageSize = $("#size").val();
        } else {
            pageSize = 5;
        }

        id = $("#id").val();
        name = $("#name").val();
        age = $("#age").val();
        password = $("#password").val();
        phone = $("#phone").val();
        city = $("#city").val();

        $.ajax({
            url: 'user/findPageHelperAjax',
            type: "post",
            data: {
                "page": pageNum,
                "size": pageSize,
                "id": id,
                "name": name,
                "age": age,
                "password": password,
                "phone": phone,
                "city": city
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                console.log(result.extend.queryParam)
                if (result.code === 200) {
                    contentInfolist(result);
                    pageInfoAppend(result);

                    $("#pageSizeSelect").val(pageSize);
                }
            },
            error: function () {
                alert("error");
            }
        });
    }

    //清空表单内容
    function formClear() {
        $("#id").val("");
        $("#name").val("");
        $("#age").val("");
        $("#password").val("");
        $("#phone").val("");
        $("#city").val("");
    }

    //校验是否为空、null、undefined - 单参数
    /*function checkIsNullOrEmpty(value) {
        //正则表达式用于判斷字符串是否全部由空格或换行符组成
        var reg = /^\s*$/
        //返回值为true表示不是空字符串
        return (value != null && value != undefined && !reg.test(value))
    }*/

    //多参数校验
    function checkIsNullOrEmpty() {
        var arg;
        for (let i = 0; i < arguments.length; i++) {
            arg = arguments[i];
        }
        //正则表达式用于判斷字符串是否全部由空格或换行符组成
        var reg = /^\s*$/
        //返回值为true表示不是空字符串
        return (arg != null && arg != undefined && !reg.test(arg))
    }

    //遍历数据集合
    function contentInfolist(result) {
        $("#table-user tbody").empty();
        var userList = result.extend.pageInfo.list;
        $.each(userList, function (index, item) {
            //复选框
            var checkBox = $("<td><input type='checkbox' class='check_item'></td>")
            var id = $("<td></td>").append(item.id);
            var name = $("<td></td>").append(item.name);
            var age = $("<td></td>").append(item.age);
            var password = $("<td></td>").append(item.password);
            var phone = $("<td></td>").append(item.phone);
            var city = $("<td></td>").append(item.city);
            //删除按钮
            var delBtn = $("<a href='javascript:void(0);' onclick='delUser()'></a>").addClass("btn del-btn btn-danger").append("删除");
            //为删除按钮添加一个自定义的属性，表示当前对象 id
            delBtn.attr("del-id", item.id);

            //编辑按钮
            var editBtn = $("<a href='javascript:void(0);' onclick='editUser()'></a>").addClass("btn edit-btn btn-primary").append("编辑");
            //为编辑按钮添加一个自定义属性，表示当前对象 id
            editBtn.attr("edit-id", item.id);

            var btnTd = $("<td></td>").append(editBtn).append("&nbsp;").append(delBtn);

            $("<tr></tr>").append(checkBox).append(id).append(name).append(age)
                .append(password).append(phone).append(city)
                .append(btnTd)
                .appendTo("#table-user tbody");
        });
    }

    //分页信息详情
    function pageInfoAppend(result) {

        $("#page_div").empty();

        number = result.extend.pageInfo.pageNum;
        lastNumber = result.extend.pageInfo.pages;

        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a href='javascript:void(0);'></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a href='javascript:void(0);'></a>").append("&laquo;"));

        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");

        }

        //首页单击事件
        firstPageLi.click(function () {
            formSubmit(1, size);
        });
        //上一页单击事件:当前页-1
        prePageLi.click(function () {
            formSubmit(result.extend.pageInfo.pageNum - 1, size);
        });

        var nextPageLi = $("<li></li>").append($("<a href='javascript:void(0);'></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a href='javascript:void(0);'></a>").append("末页"));

        //下一页不存在时即为最后一页，停用 下一页 末页 使用状态
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");

        }
        //下一页的单击事件：当前页+1
        nextPageLi.click(function () {
            formSubmit(result.extend.pageInfo.pageNum + 1, size);
        });

        //末页单击事件
        lastPageLi.click(function () {
            formSubmit(result.extend.pageInfo.pages, size);
        });

        ul.append(firstPageLi).append(prePageLi);

        //遍历页码
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            everyPage = item;
            var numLi = $("<li></li>").append($("<a ></a>").append(item).attr('id', "everyPage" + item));

            //当前页码激活
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }

            //给页码添加单击事件
            numLi.click(function () {
                formSubmit(item, size);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        var infoLi = $("<li></li>").append($("<span></span>").append("当前第 " + result.extend.pageInfo.pageNum + " 页" + " | " + "总 " +
            result.extend.pageInfo.pages + " 页" + " | " + "共 " + result.extend.pageInfo.total + " 条记录"));
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;

        var cusLi = $("<li></li>").append($("<a id='jumpA'></a>").append($("<label for='pageNum' href='javascript:void(0);'></label>").append("跳转至")
            .css({
                'padding-top': '3px',
                'padding-bottom': '3px'
            })).append($("<input class='input' type='text' name='pageNum' id='pageNum'>")))
            .append($("<a href='javascript:void(0);' id='jumpBtn' onclick='jumpPage()'></a>").append("跳转"));

        var selLi = $("<li></li>").append($("<a></a>").append("每页显示:").append($("<select id='pageSizeSelect'></select>")
            .append($("<option value='5'></option>").append("5")).append($("<option value='10'></option>").append("10"))
            .append($("<option value='15'></option>").append("15"))))
            .append($("<a id='okBtn' href='javascript:void(0);' onclick='changeSize()'></a>").append("确定"));


        ul.append(infoLi).append(cusLi).append(selLi);

        var nav = $("<nav style='text-align: center;'></nav>").append(ul);
        nav.appendTo("#page_div");
    }

    //删除单个对象
    function delUser() {
        var uid = $(".del-btn").attr('del-id');
        console.log(uid)
        $.ajax({
            //给删除按钮绑定id
            url: "user/deleteUserAjax/" + uid,
            type: "DELETE",
            success: function (result) {
                //调初始化函数
                formSubmit(currentPage, size);
            }
        });
    }

    //编辑单个对象
    function editUser() {

        //设置页码后查询时设定 pageSize 值
        if (checkIsNullOrEmpty($("#size").val())) {
            //alert('checkIsNullOrEmpty($("#size").val()):' + checkIsNullOrEmpty($("#size").val()));
            pageSize = $("#size").val();
        } else {
            pageSize = 5;
        }

        id = $("#id").val();
        name = $("#name").val();
        age = $("#age").val();
        password = $("#password").val();
        phone = $("#phone").val();
        city = $("#city").val();

        var uid = $(".edit-btn").attr('edit-id');
        console.log(uid)
        $.ajax({
            //给删除按钮绑定id
            url: "user/editUserAjax/" + uid,
            type: "post",
            success: function (result) {
                //调初始化函数
                formSubmit(currentPage, size);
                $("#id").val(result.extend.user.id);
                $("#name").val(result.extend.user.name);
                $("#age").val(result.extend.user.age);
                $("#password").val(result.extend.user.password);
                $("#phone").val(result.extend.user.phone);
                $("#city").val(result.extend.user.city);
            }
        });
    }

    /**
     attr('checked'): checked  无论选中与否，该值不会改变
     prop('checked'): true   选中时该值为true，否则为false
     */
    //完成复选框全选/全不选
    $("#check_all").click(function () {
        //alert($(this).prop("checked"));
        //选中标题行的复选框，下面的复选框跟着一起选中
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    /**
     $("xxx").click(fun)只能作用于已经存在于页面上的，后来加上的是不起作用的。
     $(document).on("click","xxx",fun)：无论是已经存在的还是后来添加上的，都能起作用。on方法可以为同一个元素绑定多个事件，触发顺序按照绑定事件的先后顺序
     因为这些元素是后来动态添加的，所以使用$("xxx").click写法是无效的，只能使用原生 js
     */
    //子复选框全选时，父复选框状态改变
    $(document).on("click", ".check_item", function () {
        //alert($(".check_item:checked").length);
        var flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    //删除所选事件
    function delAllCheck() {
        var delID = "";
        //子复选框循环遍历
        $.each($(".check_item:checked"), function () {
            /**
             <tr>
             <td><input type="checkbox" id="check_item"/></td> eq(0)
             <td>11</td>                                         1
             <td>jianghui</td>                                   2
             <td>22</td>                                         3
             <td>123</td>                                       ...
             <td>15222222222</td>
             <td>q</td>
             <td>删除/编辑</td>
             </tr>
             -------------------------------------------------------
             对于上述结构来说，
             */
            //拼接选中的员工 id 的字符串
            delID += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //删除最后遍历完毕之时添加的 “-”
        delID = delID.substring(0, delID.length - 1);

        $.ajax({
            url: "user/deleteUserAjax/" + delID,
            type: "DELETE",
            success: function (result) {
                console.log(result)
                //调初始化函数
                formSubmit(currentPage, size);
            }
        })
    }

    //新增事件
    $("#btn-add").click(function () {
        //设置页码后查询时设定 pageSize 值
        if (checkIsNullOrEmpty($("#size").val())) {
            //alert('checkIsNullOrEmpty($("#size").val()):' + checkIsNullOrEmpty($("#size").val()));
            pageSize = $("#size").val();
        } else {
            pageSize = 5;
        }

        //debugger;
        id = $("#id").val();
        name = $("#name").val();
        age = $("#age").val();
        password = $("#password").val();
        phone = $("#phone").val();
        city = $("#city").val();

        //只要其中有一个没有填写，则为fasle,【重点并不是这些数据校验】
        //alert('checkIsNullOrEmpty(id,name,age,password,phone,city):' + checkIsNullOrEmpty(id, name, age, password, phone, city))
        if (checkIsNullOrEmpty(id, name, age, password, phone, city)) {
            $.ajax({
                url: "user/addUserAjax",
                type: "post",
                data: $("#form").serialize(),
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    if (result.code == 200) {
                        formClear();
                        formSubmit(1, size);
                        $("#pageSizeSelect").val(pageSize);

                    }
                },
                error: function () {
                    alert("error");
                }
            })
        } else {
            alert("请确保每一项都填写正确");
        }
    })

    $("#btn-save").click(function () {

        //设置页码后查询时设定 pageSize 值
        if (checkIsNullOrEmpty($("#size").val())) {
            //alert('checkIsNullOrEmpty($("#size").val()):' + checkIsNullOrEmpty($("#size").val()));
            pageSize = $("#size").val();
        } else {
            pageSize = 5;
        }

        id = $("#id").val();
        name = $("#name").val();
        age = $("#age").val();
        password = $("#password").val();
        phone = $("#phone").val();
        city = $("#city").val();

        //只要其中有一个没有填写，则为fasle,【重点并不是这些数据校验】
        //alert('checkIsNullOrEmpty(id,name,age,password,phone,city):' + checkIsNullOrEmpty(id, name, age, password, phone, city))
        if (checkIsNullOrEmpty(id, name, age, password, phone, city)) {
            $.ajax({
                url: "user/updateUserAjax",
                type: "post",
                data: $("#form").serialize(),
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    if (result.code == 200) {
                        formClear();
                        formSubmit(1, size);
                        $("#pageSizeSelect").val(pageSize);
                        alert("更新成功")
                    }
                },
                error: function () {
                    alert("error");
                }
            })
        } else {
            alert("请确保每一项都填写正确");
        }
    })


</script>

</html>
