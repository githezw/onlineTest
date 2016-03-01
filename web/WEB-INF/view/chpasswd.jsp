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
<body>
<form action="/onlineTest/changePasswd.action" method="post">
    姓名：<input type="text" name="realname" /><br>
    原始密码：<input type="password" name="passwdold" /><br>
    新密码：<input type="password" name="passwdnew" /><br>
    表名：<input type="text" name="tablename" /><br>
    角色名：<input type="text" name="role" /><br>
    <input type="submit" value="修改" />
</form>
</body>
</html>
