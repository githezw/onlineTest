%--
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
    <script src="js/jquery.min.js"></script>
    <title>在线考试系统登录</title>
</head>
<body>
<form action="#">
    <label>姓名</label><input type="text" name="realname" id="realname">
    <label>密码</label><input type="password" name="passwdTemp" id="passwdTemp">
    角色<input type="text"  name="role" id="role">
    <input type="button" value="登录" id="submit">
    </form>
<script>
    $("#submit").click(function(){
        var realname = $("#realname").val();
        var passwdTemp = $("#passwdTemp").val();
        var role = $("#role").val();
        $.ajax({
            type:"POST",
            url:"/onlineTest/login.action",
            data:JSON.stringify({'realname':realname,'passwdTemp':passwdTemp,'role':role}),
            contentType:"application/json",
            success:function(result){
//                if(result=="success"){
//                    window.location.href="/WEB-INF/view/main.jsp";
//                }else{
//                    alert(result);
                }

        })
    });
    </script>
</body>
</html>
