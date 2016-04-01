<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/4/1
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部考试</title>
</head>
<body id="loginBody">
<%@include file="../common/headbar.jsp" %>
<div id="noticePanel">
    <div class="panel panel-default">
        <div class="panel-heading">科目考试一览</div>
        <ul class="list-group">
        </ul>
    </div>
    <button type="button" class="btn btn-success pull-right" onclick="pageScroll()">返回顶部</button>
    <span class="pull-right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <button type="button" class="btn btn-warning pull-right" id="backButton">
        &nbsp;&nbsp;&nbsp;返回&nbsp;&nbsp;&nbsp;</button>
    <br><br><br><br><br>
</div>
<input type="hidden" id="classno2" value="${classno}">
<script>
    $(document).ready(function () {

        //获取全部公告列表 并标注今日发布的公告
        var classno2 = $("#classno2").val();
        $.ajax({
            type: "post",
            url: "/onlineTest/getNotice.action",
            contentType: "application/json",
            data: JSON.stringify({'classno': classno2}),
            success: function (result) {
                var date = new Date();
                var year = date.getFullYear();
                var month = date.getMonth() + 1;
                var day = date.getDate();
                month = month < 10 ? "0" + month : month;
                day = day < 10 ? "0" + day : day;
                var mydate = year + "-" + month + "-" + day;
                var i = 0;
                for (i; i < result.length; i++) {
                    if (mydate == result[i].pubtime) {
                        $("ul.list-group").append('<li class="list-group-item" style="background-color: #D4DFE6">' +
                                result[i].notice +
                                '<div class="pull-right" style="font-size: small">' + '<span class="badge self-badge">' +
                                '今天发布</span>' +
                                '</div><br><br><div style="text-align:right">—— '
                                + result[i].author +
                                '</div>' + '</li>');
                    } else {
                        $("ul.list-group").append('<li class="list-group-item" style="background-color: #D4DFE6">' +
                                result[i].notice +
                                '<div class="pull-right" style="font-size: small">' +
                                result[i].pubtime +
                                '</div><br><br><div style="text-align:right">—— ' +
                                result[i].author +
                                '</div>' + '</li>');
                    }
                }
            }
        });

        //返回按钮
        $("#backButton").click(function () {
            window.location.href = "/onlineTest/mainPage.action";
        });
    });
</script>
</body>
</html>
