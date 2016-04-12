<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/4/6
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改考题</title>
</head>
<%@include file="../common/headbar.jsp" %>
<body id="loginBody">
<span id="slideleft" class="label label-default" style="position: absolute;top: 50%;left: 390px;"><br>收<br><br>起<br><br></span>

<div id="mainNavLeft" class="panel-group" style="float:left;width: 400px;">
    <div class="ExamList" style="text-align: center;margin-top: 30px;">
        <button type="button" class="btn btn-info" style="width:250px" data-toggle="collapse" data-parent="#mainNavLeft"
                href="#ExamItemList" id="getAllExamBtn">展开全部考试项
        </button>
        <div id="ExamItemList" class="collapse examContent" style="margin-top: 10px;"></div>
<%--        <input type="hidden" id="examSelected">
        <input type="hidden" id="examSelectedId">--%>
    </div>
</div>

<div class="form-horizontal" role="form" id="modifyExamPanel">

    <div class="panel panel-default">
        <div class="panel-heading">修改考题项&nbsp;&nbsp;<h4 style="display: inline;"><span class="label label-warning">点击需要修改的内容即可修改考题项</span>
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
                    修改考题
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

<input type="hidden" id="subject" value="${subject}">
<input type="hidden" id="author" value="${realname}">
<script>
    $(document).ready(function () {
        //是否加载所有考试项标志
        var examListFlag = true;
        //滑动标志
        var slideFlag = true;

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
                            examItemNode.attr("class", "ExamItem");
                            examItemNode.text(examname);
                            var examIdNode = $("<input />");
                            examIdNode.attr("type", "hidden");
                            examIdNode.val(id);
                            examItemNode.append(examIdNode);
                            examItemNode.bind("click", examClickColor);
                            $("#ExamItemList").append(examItemNode);
                        }
                        examListFlag = false;
                    },
                    error: function () {
                        $('#resultModel').modal('hide');
                        alert("error");
                    }
                });
            }
        });

        //刷新考试项列表
        function updateExamList() {
            $("#ExamItemList").html("");
            var subject = $("#subject").val();
            var classno = $("#classno").val();
            $.ajax({
                type: "post",
                contentType: "application/json",
                async: false,
                url: "/onlineTest/getAllExamItem.action",
                data: JSON.stringify({'classno': classno, 'subject': subject}),
                success: function (result) {
                    for (var i = 0; i < result.length; i++) {
                        var id = result[i]["id"];
                        var examname = result[i]["examname"];
                        var examItemNode = $("<div>");
                        examItemNode.attr("class", "ExamItem");
                        examItemNode.text(examname);
                        var examIdNode = $("<input>");
                        examIdNode.attr("type", "hidden");
                        examIdNode.val(id);
                        examItemNode.append(examIdNode);
                        examItemNode.bind("click", examClickColor);
                        $("#ExamItemList").append(examItemNode);
                    }
                    examListFlag = false;
                },
                error: function () {
                    alert("error");
                }
            });

        }

        //  收起/展开按钮点击事件
        $("#slideleft").click(function () {
            if (slideFlag == true) {
                $('#ExamItemList').collapse('hide');
                $("#mainNavLeft").stop().animate({width: "30px"}, 400);
                $("#modifyExamPanel").stop().animate({marginLeft: "400px"});
                $("#slideleft").stop().animate({left: "20px"}, 400);
                $(this).html("<br>展<br><br>开<br><br>");
                slideFlag = false;
            } else {
                $("#mainNavLeft").stop().animate({width: "400px"}, 400);
                $("#modifyExamPanel").stop().animate({marginLeft: "300px"});
                $("#slideleft").stop().animate({left: "390px"}, 400);
                $(this).html("<br>收<br><br>起<br><br>");
                slideFlag = true;
            }
        });

        //考试项背景色方法
        function examClickColor() {
            $(this).css("background-color", "#d81159");
            $(this).siblings().css("background-color", "#2e3e4c");
            var id = $(this).find("input").val();
            var examname = $(this).text()
            $("#examSelectedId").val(id);
            $("#examSelected").val(examname);
            ;
        }
    });
</script>
</body>
</html>
