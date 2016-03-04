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
<body id="loginBody">
<%@include file="headbar.jsp"%>
<form action="/onlineTest/changePasswd.action" method="post" class="form-horizontal" role="form" id="modifyForm">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">姓名</div></span>
            <input type="text" class="form-control" id="realname" name="realname" style="width:300px"
                   placeholder="在此输入姓名，如:小明">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">原始密码</div></span>
            <input type="password" class="form-control" id="passwdold" name="passwdold" style="width:300px"
                   placeholder="在此输入原密码">
        </div>
    </div>
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon input-addon-mine"><div style="color: darkgrey;">新密码</div></span>
            <input type="password" class="form-control" id="passwdnew" name="passwdnew" style="width:300px"
                   placeholder="在此输入新密码">
        </div>
    </div>
    <input type="hidden" name="role" value="${role}" />
    <br><br>
    <div class="form-group">
        <div class="col-sm-12">
            <div class="col-sm-6">
                <button type="submit" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
            <div class="col-sm-6">
                <button type="reset" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
        </div>
    </div>
</form>
</body>
</html>
