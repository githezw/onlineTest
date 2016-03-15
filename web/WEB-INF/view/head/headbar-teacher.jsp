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
        <div class="avatar dropdown-toggle pull-right" id="avatarMenu"
             data-toggle="dropdown">
            <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            ${realname}<span class="caret"></span>
        </div>
        <ul class="dropdown-menu pull-right avaterMenu" role="menu" aria-labelledby="avatarMenu">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">添加考试</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">添加公告</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="/onlineTest/changepwd.action">修改密码</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="/onlineTest/logout.action">退出</a>
            </li>
        </ul>
    </div>
</div>
<input type="hidden" id="classno" value="${classno}">
<script>
    $(document).ready(function () {

        //设置公告列表位置
        var noticeMenu = $("#noticeMenu");
        var x = noticeMenu.offset().left - 1;
        var y = noticeMenu.offset().top;
        noticeMenu.attr("data-toggle", "dropdown");
        $("ul.noticeMenu").css({'top': y, 'left': x});
    });
</script>

</body>
</html>
