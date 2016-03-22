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
<div id="mainNavLeft" class="panel-group" style="float:left;width: 400px;">
    <div style="text-align: center;margin-top: 30px">
        <button id="addExamBtn" type="button" class="btn btn-danger" style="width:250px">新增考试</button>
    </div>
    <div class="addExamForm">

    </div>
    <div class="ExamList">
        <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
             href="#c1"><span
                class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;C考试列表&nbsp;<span class="caret"></span>
            <%--<span class="badge self-badge pull-right">new</span>--%>
        </div>
        <div id="c1" class="collapse examContent examContent-s1">
            Nihil anim keffiyeh helvetica, craft beer labore wes anderson
        </div>
    </div>
</div>
<form class="form-horizontal" role="form" id="modifyForm" style="height: 250px;margin-left: 300px;float:left">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">考试题目</div></span>
            <textarea type="text" class="form-control" rows="3" id="examTitle" name="examTitle" style="width:300px"
                      placeholder="在此输入考试题目"></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">选项1</div></span>
            <input type="text" class="form-control" id="select1" name="select1" style="width:300px"
                   placeholder="在此输入选项1">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">选项2</div></span>
            <input type="text" class="form-control" id="select2" name="select2" style="width:300px"
                   placeholder="在此输入选项2">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">选项3</div></span>
            <input type="text" class="form-control" id="select3" name="select3" style="width:300px"
                   placeholder="在此输入选项3">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">选项4</div></span>
            <input type="text" class="form-control" id="select4" name="select4" style="width:300px"
                   placeholder="在此输入选项4">
        </div>
    </div>
</form>

<div class="col-sm-12" style="width:500px;margin-left: 290px;margin-top: 50px">
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
</body>
</html>
