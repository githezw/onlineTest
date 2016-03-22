<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/14
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班级公告</title>
</head>
<%@include file="../common/headbar.jsp" %>
<body id="loginBody">
<form class="form-horizontal" role="form" id="modifyForm" style="height: 250px;">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">班级号</div></span>
            <input type="text" class="form-control" id="classnum" name="classnum" style="width:300px"
                   placeholder="在此输入班级号"> <%--防止id与头文件中的classno冲突--%>
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">公告内容</div></span>
            <textarea type="text" class="form-control" rows="3" id="notice" name="notice" style="width:300px"
                      placeholder="在此输入公告内容"></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">公告作者</div></span>
            <input type="text" class="form-control" id="author" name="author" style="width:300px"
                   placeholder="在此输入公告作者">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">发表日</div></span>
            <input type="text" class="form-control" id="pubtime" name="pubtime" style="width:300px"
                   placeholder="在此输入公告发表日,格式:2016-01-01">
        </div>
    </div>
</form>
<div class="col-sm-12" style="width:500px;left:36%">
    <div class="col-sm-6">
        <button id="submit" class="btn btn-success" data-toggle="modal"
                data-target="#resultModel">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
    </div>
    <div class="col-sm-6">
        <button class="btn btn-warning" id="reset">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
    </div>

</div>
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
                    添加公告
                </h4>
            </div>
            <div class="modal-body">
                正在添加······
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
        $("#submit").click(function () {
            var classno = $("#classno").val();
            var classnum = $("#classnum").val();
            var notice = $("#notice").val();
            var author = $("#author").val();
            var pubtime = $("#pubtime").val();
            if (classno == classnum) {
                $.ajax({
                    type: "post",
                    url: "/onlineTest/addNotice.action",
                    data: JSON.stringify({
                        "classno": classno,
                        "notice": notice,
                        "author": author,
                        "pubtime": pubtime
                    }),
                    contentType: "application/json",
                    success: function (result) {
                        if (result == "success") {
                            $.ajax({
                                type: "post",
                                url: "/onlineTest/addNoticeNum.action",
                                data: JSON.stringify({
                                    "classno": classno,
                                }),
                                contentType: "application/json",
                                success: function (result) {
                                    if (result == 'success') {
                                        $("div.modal-body").html("添加成功");
                                        $("#model-button").click(function () {
                                            /*window.location.href = "/onlineTest/mainPage.action";*/
                                            $('#resultModel').modal('hide');
                                            $("div.modal-body").html("正在添加······");
                                        });
                                    }
                                }
                            });
                        }
                    },
                    error: function () {
                        $("div.modal-body").html("添加失败");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide');
                            $("div.modal-body").html("正在添加······");
                        });
                    }
                });
            }
            else {
                $("div.modal-body").html("您没有权限添加");
                $("#model-button").click(function () {
                    $('#resultModel').modal('hide');
                    $("div.modal-body").html("正在添加······");
                });
            }

        });

        $("#reset").click(function () {
            $("#classno").val("");
            $("#notice").val("");
            $("#author").val("");
            $("#pubtime").val("");
        });
    });
</script>
</body>
</html>
