<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/17
  Time: 15:53
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改公告</title>
</head>
<body id="loginBody">
<%@include file="../common/headbar.jsp" %>
<div id="noticePanel">
    <div class="panel panel-default">
        <div class="panel-heading">班级公告</div>
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
            async: false,
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
                    $("ul.list-group").append('<li class="list-group-item" style="background-color: #D4DFE6">' +
                            '<input type="hidden" value="' +
                            result[i].id +
                            '">' + '<div class="pull-left">' +
                            result[i].notice + '</div>' +
                            '<div class="pull-right" style="font-size: small">' +
                            result[i].pubtime +
                            '</div><br><br><div style="text-align:right">—— ' +
                            result[i].author +
                            '</div></li>');
                }
            }
        });

        //鼠标点击变输入框进行修改
        $("ul.list-group").children("li").children().click(function () {
            var textTemp = $(this).text();
            var htmlTemp = $(this).html();
            $(this).html("");
            var inputString = $("<input>");
            inputString.attr("class","form-control");
            inputString.val(textTemp);
            $(this).append(inputString);
//            $(this).html(inputString);
            $(this).blur(function(){
                /*alert($(this).html());
                var textNew = $(this).find("input").val();
                var node = $(htmlTemp);
                $(this).html("");
                $(this).appendChild(node);
                $(this).children().text(textNew);*!/*/
            });*/
            $(this).unbind("click");
        });

        //返回按钮
        $("#backButton").click(function () {
            window.location.href = "/onlineTest/checkNotice.action";
        });
    });
</script>
</body>
</html>