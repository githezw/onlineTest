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
    <meta charset="utf-8">
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

<!--修改结果弹出框-->
<div class="modal fade" id="resultModel" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改结果
                </h4>
            </div>
            <div class="modal-body">
                正在修改······
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="model-button">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
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
                var i = 0;
                for (i; i < result.length; i++) {
                    $("ul.list-group").append('<li class="list-group-item" style="background-color: #D4DFE6">' +
                            '<input type="hidden" value="' +
                            result[i].id +
                            '">' + '<div class="pull-left" name="noticeInput">' +
                            result[i].notice + '</div>' +
                            '<div class="pull-right" style="font-size: small" name="pubtimeInput">' +
                            result[i].pubtime +
                            '</div><br><br><div style="text-align:right" name="authorInput">—— ' +
                            result[i].author +
                            '</div></li>');
                }
            }
        });

        //修改公告页面实现点击可重复编辑,并且更新到数据库中
        $("ul.list-group").children("li").children().click(modifyNoticeFun);

        //返回按钮
        $("#backButton").click(function () {
            window.location.href = "/onlineTest/checkNotice.action";
        });
    });
</script>
</body>
</html>