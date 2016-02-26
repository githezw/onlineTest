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
    <meta charset = "utf-8">
    <title>在线考试系统登录</title>
</head>
<body>
<form action="/onlineTest/login.action" method="post">
    <label>姓名</label><input type="text" name="realname">
    <label>密码</label><input type="password" name="passwdTemp">
    角色<input type="text"  name="role">
    <input type="submit" value="登录">
    </form>
</body>
</html>
