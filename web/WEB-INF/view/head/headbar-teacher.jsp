<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/15
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>head</title>
    <meta charset="utf-8">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/mine.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mine.css">
</head>
<body>
<div id="mainHeader">
    <div class="dropdown">
        <div id="avatarMenu" data-toggle="dropdown" class="avatar pull-right" data-target="#"
             href="javascript:;">
            <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            ${realname}<span class="caret"></span>
        </div>
        <ul class="dropdown-menu avaterMenu pull-right multi-level" role="menu" aria-labelledby="avatarMenu">
            <li class="dropdown-submenu">
                <a tabindex="-1" href="javascript:;"><span class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;&nbsp;考试选项</a>
                <ul class="dropdown-menu avaterMenu">
                    <li><a tabindex="-1" href="#"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;查看以往考试</a></li>
                    <li><a tabindex="-1" href="/onlineTest/addExamPage.action"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;新增考试</a></li>
                    <li><a tabindex="-1" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;修改考题</a></li>
                    <li><a tabindex="-1" href="javascript:;"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;&nbsp;删除考试</a></li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a tabindex="-1" href="javascript:;"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;公告选项</a>
                <ul class="dropdown-menu avaterMenu">
                    <li><a tabindex="-1" href="/onlineTest/checkNotice.action"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;查看全部公告</a></li>
                    <li><a tabindex="-1" href="/onlineTest/addNoticePage.action"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;新增公告</a></li>
                    <li><a tabindex="-1" href="/onlineTest/modifyNoticePage.action"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;修改公告</a></li>
                    <li><a tabindex="-1" href="/onlineTest/deleteNoticePage.action"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;&nbsp;删除公告</a></li>
                </ul>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="/onlineTest/changepwd.action"><span class="glyphicon glyphicon-wrench"></span>&nbsp;&nbsp;&nbsp;修改密码</a>
            </li>
            <li class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="/onlineTest/logout.action"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;退出</a>
            </li>

        </ul>
    </div>
</div>
<input type="hidden" id="classno" value="${classno}">
<script>
    /*$(document).ready(function () {

     //设置公告列表位置
     var noticeMenu = $("#noticeMenu");
     var x = noticeMenu.offset().left - 1;
     var y = noticeMenu.offset().top;
     noticeMenu.attr("data-toggle", "dropdown");
     $("ul.noticeMenu").css({'top': y, 'left': x});
     });*/
</script>

</body>
</html>
