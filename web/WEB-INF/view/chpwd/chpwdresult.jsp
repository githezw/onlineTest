<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/2/29
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" />
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.min.js"></script>

</head>
<body>
<c:choose>
    <c:when test="${flag==true}">
        修改密码成功！<span id="num">3</span>秒后跳转...
    </c:when>
    <c:otherwise>
        修改密码失败！<span id="num">3</span>秒后跳转
    </c:otherwise>
    </c:choose>

<script language="javascript">
    function jump() {
        var second = $("span#num").html();
        if(second>0)
        {
            second--;
            $("#num").html(second);
        }else{
            location.href="/onlineTest/mainPage.action";
        }
        setTimeout("jump()", 1000);
    }
    $(document).ready(function() {
        jump();
    });
</script>
</body>
</html>
