<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/21
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除公告</title>
</head>
<body id="loginBody">
<%@include file="../common/headbar.jsp" %>
<div id="noticePanel">
    <div class="panel panel-default">
        <div class="panel-heading">删除班级公告&nbsp;&nbsp;<h4 style="display: inline;"><span class="label label-danger">鼠标悬停点击删除按钮即可删除公告</span>
        </h4></div>
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
                    删除结果
                </h4>
            </div>
            <div class="modal-body">
                正在删除······
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
                            '"/>' + '<div name="noticeInput" style="display: inline">' +
                            result[i].notice +
                            '</div><div class="pull-right" style="font-size: small" name="pubtimeInput">' +
                            result[i].pubtime +
                            '</div><br><br><div style="text-align:right" name="authorInput">—— ' +
                            result[i].author +
                            '</div><div class="deleteShadow" style="display: none;">' +
                            '<button type="button" class="btn btn-danger">删除'
                            + '</button></div></li>'
                    );
                }
            }
        });

        //鼠标悬停出现删除按钮
        $("ul.list-group").children("li").hover(function () {
            $(this).find(".deleteShadow").show();
            $(this).find(".deleteShadow").stop().animate({height: "100%", width: "100%"}, 400);
            $(this).find(".deleteShadow button").stop().animate({width: "100px", marginTop: "20px"}, 400);
        }, function () {
            $(this).find(".deleteShadow").stop().animate({height: "0px", width: "0px"}, 400);
            $(this).find(".deleteShadow").hide();
        });

        //删除按钮事件
        $("ul.list-group").children("li").find("button").click(function () {
            var id = $(this).parent().parent().find("input").val();
            var deleteNode = $(this).parent().parent();
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/onlineTest/deleteNotice.action",
                data: JSON.stringify({'id': id}),
                success: function (result) {
                    if (result == "success") {
                        $('#resultModel').modal('show');
                        $("div.modal-body").html("删除成功");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                        deleteNode.remove();
                    }
                    else {
                        $('#resultModel').modal('show');
                        $("div.modal-body").html("删除失败");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                    }
                }
            });

        });

        //返回按钮
        $("#backButton").click(function () {
            window.location.href = "/onlineTest/checkNotice.action";
        });
    });
</script>
</body>
</html>
