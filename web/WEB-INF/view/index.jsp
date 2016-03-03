<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/2/26
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/mine.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mine.css">
    <title>在线考试系统登录</title>
</head>
<body id="loginBody">
<div class="loginTitle"><h1>The Online Examination System</h1></div>
<div class="loginTitleSmall"><h5>欢迎登录在线考试系统</h5></div>
<form action="/onlineTest/login.action" method="post" class="form-horizontal" role="form" id="loginForm">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon"><div style="color: darkgrey;">姓名</div></span>
            <input type="text" class="form-control" id="realname" name="realname"
                   placeholder="在此输入姓名，如:小明">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon"><div style="color: darkgrey;">密码</div></span>
            <input type="password" class="form-control" id="passwdTemp" name="passwdTemp"
                   placeholder="在此输入密码">
        </div>
    </div>
    <div class="btn-group" id="roleSelect">
        <button type="button" class="btn btn-primary">教师</button>
        <button type="button" class="btn btn-primary">学生</button>
    </div>
    <input type="hidden" name="role" id="role" value="student">
    <br><br>
    <div class="form-group">
        <div class="col-sm-12">
            <div class="col-sm-6">
                <button type="submit" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
            <div class="col-sm-6">
                <button type="reset" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
        </div>
    </div>
</form>
${message}
<%--<script>
    $("#submit").click(function(){
        var realname = $("#realname").val();
        var passwdTemp = $("#passwdTemp").val();
        var role = $("#role").val();
        $.ajax({
            type:"POST",
            url:"/onlineTest/login.action",
            data:JSON.stringify({'realname':realname,'passwdTemp':passwdTemp,'role':role}),
            contentType:"application/json",
            success:function(result) {
                if (result == "success") {
                    window.location.href = "/WEB-INF/view/main.jsp";
                } else {
                    alert(result);
                }
            }
        })
    });
    </script>--%>
</body>
</html>
