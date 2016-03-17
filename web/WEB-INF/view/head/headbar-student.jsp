<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/4
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
                <a role="menuitem" tabindex="-1" href="#"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;查看历史成绩</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="/onlineTest/changepwd.action"><span class="glyphicon glyphicon-wrench"></span>&nbsp;&nbsp;&nbsp;修改密码</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="/onlineTest/logout.action"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;退出</a>
            </li>
        </ul>
    </div>
    <div class="dropdown">
        <div class="notice dropdown-toggle pull-right" id="noticeMenu">
            <span class="badge" id="noticeNum"></span>
            <span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            公告&nbsp;<span class="caret"></span>
        </div>
        <ul class="dropdown-menu pull-right noticeMenu" role="menu" aria-labelledby="noticeMenu">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#"></a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#"></a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#"></a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#"></a>
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

        //获取未读公告数量
        var name = $("#avatarMenu").text().trim();
        $.ajax({
            type: "post",
            url: "/onlineTest/getNoticeNum.action",
            asyn: false,
            contentType: "application/json",
            data: JSON.stringify({'realname': name}),
            success: function (result) {
                if (result == 0) {
                    $("span#noticeNum").attr("class", "badge:empty");
                } else {
                    $("span#noticeNum").html(result);
                }
            },
            error: function () {
                alert("error");
            }
        });

        //获取公告列表  并设置未读公告样式
            var classno = $("#classno").val();
        $.ajax({
            type: "post",
            url: "/onlineTest/getNotice.action",
            contentType: "application/json",
            data: JSON.stringify({'classno': classno}),
            success: function (result) {
                var i = 0;
                var noticeNum = $("#noticeNum").text();
                $("ul.noticeMenu").children().each(function () {
                    if (i < noticeNum) {
                        //给子节点添加click事件
                        $(this).click(function () {

                            //设置数据库未读消息为0
                            $.ajax({
                                type: "post",
                                url: "/onlineTest/clearNotice.action",
                                contentType: "application/json",
                                data: JSON.stringify({"realname": name}),
                                success: function (result) {
                                    if (result == "success") {
                                        //设置点击跳转公告列表页面
                                        $("span#noticeNum").hide();
                                        window.location.href = "/onlineTest/checkNotice.action";
                                    } else {
                                        alert("failure");
                                    }
                                }
                            });
                        });
                        //未读公告添加提醒
                        if (result[i].notice.length > 8) {
                            $(this).find("a").html(result[i].notice.substr(0, 7) + "...." + "<span class='badge self-badge pull-right'>新</span>");
                        } else {
                            $(this).find("a").html(result[i].notice.substr(0, 7) + "<span class='badge self-badge pull-right'>新</span>");
                        }
                    } else {
                        $(this).click(function () {
                            //设置点击跳转公告列表页面
                            window.location.href = "/onlineTest/checkNotice.action";
                        });
                        if (result[i].notice.length > 12) {
                            $(this).find("a").html(result[i].notice.substr(0, 7) + "....");
                        } else {
                            $(this).find("a").html(result[i].notice.substr(0, 7));
                        }
                    }
                    i++;
                });
            },
            error: function () {
                alert("error");
            }

        });
    });
</script>

</body>
</html>
