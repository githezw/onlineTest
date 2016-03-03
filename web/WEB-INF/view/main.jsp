<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/3
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统班级主页</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/mine.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mine.css">
</head>
<body>
<div id="mainHeader">
    <div class="dropdown">
        <div class="avatar dropdown-toggle pull-right" id="dropdownMenu1"
             data-toggle="dropdown">
            <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;demo
            <span class="caret"></span>
        </div>
        <ul class="dropdown-menu pull-right avaterMenu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">查看历史成绩</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">修改密码</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">退出</a>
            </li>
        </ul>
    </div>
</div>
<div id="mainNavLeft" class="panel-group">
        <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
             href="#c1"><span
                class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;C&nbsp;<span class="caret"></span>
        </div>
        <div id="c1" class="collapse examContent examContent-s1">
            Nihil anim keffiyeh helvetica, craft beer labore wes anderson
        </div>

    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#c2"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;C++&nbsp;<span class="caret"></span>
    </div>
    <div id="c2" class="collapse examContent examContent-s2">
        Nihil anim keffiyeh helvetica, craft beer labore wes anderson
    </div>

    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#java"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Java&nbsp;<span class="caret"></span>
    </div>
    <div id="java" class="collapse examContent examContent-s3">
        Nihil anim keffiyeh helvetica, craft beer labore wes anderson
    </div>

    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#sql"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Sql&nbsp;<span class="caret"></span>
    </div>
    <div id="sql" class="collapse examContent examContent-s1">
        Nihil anim keffiyeh helvetica, craft beer labore wes anderson
    </div>

    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#net"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Network&nbsp;<span class="caret"></span>
    </div>
    <div id="net" class="collapse examContent examContent-s2">
        Nihil anim keffiyeh helvetica, craft beer labore wes anderson
    </div>

    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#asp"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Asp .net&nbsp;<span class="caret"></span>
    </div>
    <div id="asp" class="collapse examContent examContent-s3">
        Nihil anim keffiyeh helvetica, craft beer labore wes anderson
    </div>

</div>
</body>
