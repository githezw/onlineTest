<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/2/29
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
</head>
<body id="loginBody">
<%@include file="headbar.jsp" %>
<form class="form-horizontal" role="form" id="modifyForm" style="height: 180px;">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">姓名</div></span>
            <input type="text" class="form-control" id="realname" name="realname" style="width:300px"
                   placeholder="在此输入姓名，如:小明">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">原始密码</div></span>
            <input type="password" class="form-control" id="passwdold" name="passwdold" style="width:300px"
                   placeholder="在此输入原密码">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">新密码</div></span>
            <input type="password" class="form-control" id="passwdnew" name="passwdnew" style="width:300px"
                   placeholder="在此输入新密码">
        </div>
    </div>
    <input type="hidden" name="role" value="${role}" id="role"/>
</form>
<div class="col-sm-12" style="width:500px;left:36%">
        <div class="col-sm-6">
            <button id="submit" class="btn btn-success" data-toggle="modal"
                    data-target="#resultModel">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
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
                    修改密码
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
        $("#submit").click(function () {
            var realname = $("#realname").val();
            var passwdold = $("#passwdold").val();
            var passwdnew = $("#passwdnew").val();
            var role = $("#role").val();
            $.ajax({
                type: "post",
                url: "/onlineTest/changePasswd.action",
                data: JSON.stringify({
                    "realname": realname,
                    "passwdold": passwdold,
                    "passwdnew": passwdnew,
                    "role": role
                }),
                contentType: "application/json",
                success: function (result) {
                    if (result == "true") {
                        $("div.modal-body").html("修改成功");
                        $("#model-button").click(function () {
                            window.location.href = "/onlineTest/mainPage.action";
                        });
                    }
                    else {
                        $("div.modal-body").html("修改失败");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                    }
                },
                error: function (result) {
                    $("div.modal-body").html("修改失败");
                    $("#model-button").click(function () {
                        $('#resultModel').modal('hide')
                    });
                }
            })
        });
        $("#reset").click(function(){
            $("#realname").val("");
            $("#passwdold").val("");
            $("#passwdnew").val("");
        });
    })
</script>
</body>
</html>
