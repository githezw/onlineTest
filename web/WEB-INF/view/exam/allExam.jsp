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
<input type="hidden" id="subject" value="${subject}">
<script>
    $(document).ready(function () {

        //展开全部考试项按钮

                var subject = $("#subject").val();
                var classno = $("#classno2").val();
                $.ajax({
                    type: "post",
                    contentType: "application/json",
                    url: "/onlineTest/getAllExamItem.action",
                    data: JSON.stringify({'classno': classno, 'subject': subject}),
                    success: function (result) {
                        for (var i = 0; i < result.length; i++) {
                            $("ul.list-group").append('<li class="list-group-item" style="background-color: #D4DFE6">' +
                                    result[i]["examname"] +
                                    '<div class="pull-right">'+result[i]["examtime"]+
                                     '</div></li>');
                        }
                    },
                    error: function () {
                        $('#resultModel').modal('hide');
                        alert("error");
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
