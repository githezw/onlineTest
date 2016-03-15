<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/15
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统班级主页</title>
</head>
<body>
<c:choose>
    <c:when test="${role=='student'}">
        <%@include file="../head/headbar-student.jsp" %>
    </c:when>
    <c:otherwise>
        <%@include file="../head/headbar-teacher.jsp" %>
    </c:otherwise>
</c:choose>
</body>
</html>
