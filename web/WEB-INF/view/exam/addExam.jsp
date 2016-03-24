<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/22
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加考试</title>
</head>
<%@include file="../common/headbar.jsp" %>
<body id="loginBody">
<span id="slideleft" class="label label-default" style="position: absolute;top: 50%;left: 390px;"><br>收<br><br>起<br><br></span>

<div id="mainNavLeft" class="panel-group" style="float:left;width: 400px;">
    <div style="text-align: center; margin-top: 30px;">
        <button type="button" class="btn btn-danger" style="width:250px" data-toggle="collapse"
                data-parent="#mainNavLeft"
                href="#addForm">新增考试
        </button>
        <div id="addForm" class="collapse examContent">
            <div class="form-horizontal" role="form" id="addExamForm">
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" style="color: darkgrey;">考试名称</span>
                        <input type="text" class="form-control" id="examname"
                               placeholder="在此输入考试名称">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon" style="color: darkgrey;">考试日期</span>
                        <input type="text" class="form-control" id="examtime"
                               placeholder="格式:2016-3-23">
                    </div>
                </div>
                <input type="hidden" id="subject" value="${subject}">
                <input type="hidden" id="author" value="${realname}">
            </div>
            <div class="col-sm-12" style="margin-bottom: 30px">
                <div class="col-sm-6">
                    <button id="addExamBtn" class="btn btn-success" data-toggle="modal"
                            data-target="#resultModel">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                </div>
                <div class="col-sm-6">
                    <button id="addExamReset" class="btn btn-warning">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                </div>
            </div>
        </div>
    </div>

    <div class="ExamList" style="text-align: center;margin-top: 20px;">
        <button type="button" class="btn btn-info" style="width:250px" data-toggle="collapse" data-parent="#mainNavLeft"
                href="#ExamItemList" id="getAllExamBtn">展开全部考试项
        </button>
        <div id="ExamItemList" class="collapse examContent" style="margin-top: 10px;"></div>
    </div>
</div>

<div class="form-horizontal" role="form" id="modifyForm" style="height: 250px;margin-left: 300px;float:left">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine" style="color: darkgrey;">考试题目</span>
            <textarea type="text" class="form-control" rows="3" id="examTitle" name="examTitle" style="width:300px;"
                      placeholder="在此输入考试题目"></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine" style="color: darkgrey;">选项1</span>
            <input type="text" class="form-control" id="select1" name="select1" style="width:300px"
                   placeholder="在此输入选项1">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine" style="color: darkgrey;">选项2</span>
            <input type="text" class="form-control" id="select2" name="select2" style="width:300px"
                   placeholder="在此输入选项2">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine" style="color: darkgrey;">选项3</span>
            <input type="text" class="form-control" id="select3" name="select3" style="width:300px"
                   placeholder="在此输入选项3">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine" style="color: darkgrey;">选项4</span>
            <input type="text" class="form-control" id="select4" name="select4" style="width:300px"
                   placeholder="在此输入选项4">
        </div>
    </div>

    <div class="col-sm-12" style="width:350px;margin-top: 50px">
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
                    添加考试项
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

        //是否加载所有考试项标志
        var examListFlag = true;
        //滑动标志
        var slideFlag = true;

        //添加考试项按钮
        $("#addExamBtn").click(function () {
            var examname = $("#examname").val();
            var examtime = $("#examtime").val();
            var subject = $("#subject").val();
            var author = $("#author").val();
            var classno = $("#classno").val();
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/onlineTest/addExamItem.action",
                data: JSON.stringify({
                    'examname': examname,
                    'subject': subject,
                    'examtime': examtime,
                    'author': author,
                    'classno': classno
                }),
                success: function (result) {
                    if (result == "success") {
                        $("div.modal-body").html("添加成功");
                        resetFun();
                        $("#model-button").click(function () {
                            /*window.location.href = "/onlineTest/mainPage.action";*/
                            $('#resultModel').modal('hide');
                            $("div.modal-body").html("正在添加······");
                        });
                    }
                },
                error: function (result) {
                    if (result == "success") {
                        $("div.modal-body").html("添加失败");
                        resetFun();
                        $("#model-button").click(function () {
                            /*window.location.href = "/onlineTest/mainPage.action";*/
                            $('#resultModel').modal('hide');
                            $("div.modal-body").html("正在添加······");
                        });
                    }
                }
            });
        });

        //展开全部考试项按钮
        $("#getAllExamBtn").click(function () {
            if (examListFlag) {
                var subject = $("#subject").val();
                var classno = $("#classno").val();
                $.ajax({
                    type: "post",
                    contentType: "application/json",
                    url: "/onlineTest/getAllExamItem.action",
                    data: JSON.stringify({'classno': classno, 'subject': subject}),
                    success: function (result) {
                        for (var i = 0; i < result.length; i++) {
                            var id = result[i]["id"];
                            var examname = result[i]["examname"];
                            var examItemNode = $("<div>");
                            var examIdNode = $("<input>");
                            examItemNode.attr("class", "ExamItem");
                            examIdNode.attr("type", "hidden");
                            examIdNode.val(id);
                            examItemNode.append(examIdNode);
                            examItemNode.text(examname);
                            $("#ExamItemList").append(examItemNode);
                            examListFlag=false;
                        }
                    },
                    error: function () {
                        alert("error");
                    }
                });
            }
        });

        $("#addExamReset").click(resetFun);

        $("#slideleft").click(function () {
            if (slideFlag == true) {
                $('#addForm').collapse('hide');
                $('#ExamItemList').collapse('hide');
                $("#mainNavLeft").stop().animate({width: "30px"}, 400);
                $("#modifyForm").stop().animate({marginLeft: "500px"});
                $("#slideleft").stop().animate({left: "20px"}, 400);
                slideFlag = false;
            } else {
                $("#mainNavLeft").stop().animate({width: "400px"}, 400);
                $("#modifyForm").stop().animate({marginLeft: "300px"});
                $("#slideleft").stop().animate({left: "390px"}, 400);
                slideFlag = true;
            }
        });

        function resetFun() {
            $("#examname").val("");
            $("#examtime").val("");
        }

        function Examclick
        $("div.ExamItem").click(function () {
            $(this).css("background-color", "#d81159");
            $(this).siblings().css("background-color", "#2e3e4c");
        })
    });
</script>
</body>
</html>
