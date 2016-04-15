<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hezw
  Date: 2016/3/3
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统班级主页</title>
</head>
<body>
<%@include file="common/headbar.jsp" %>
<div id="mainNavLeft" class="panel-group">
    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#chinese"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Chinese&nbsp;<span class="caret"></span>
    </div>
    <div id="chinese" class="collapse examContent">
    </div>
    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#philosophy"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Philosophy&nbsp;<span class="caret"></span>
    </div>
    <div id="philosophy" class="collapse examContent">
    </div>
    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#economics"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Economics&nbsp;<span class="caret"></span>
    </div>
    <div id="economics" class="collapse examContent">
    </div>
    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#biology"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Biology&nbsp;<span class="caret"></span>
    </div>
    <div id="biology" class="collapse examContent">
    </div>
    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#history"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;History&nbsp;<span class="caret"></span>
    </div>
    <div id="history" class="collapse examContent">
    </div>
    <div class="subject" data-toggle="collapse" data-parent="#mainNavLeft"
         href="#sociology"><span
            class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Sociology&nbsp;<span class="caret"></span>
    </div>
    <div id="sociology" class="collapse examContent">
    </div>
</div>
<script>
    $(document).ready(function(){
        function addExamBySubject(subject,id,examname){
            var idSelect="#"+subject;
            var examItemNode = $("<div>");
            examItemNode.attr("class", "ExamItem");
            examItemNode.text(examname);
            var examIdNode = $("<input />");
            examIdNode.attr("type", "hidden");
            examIdNode.val(id);
            examItemNode.append(examIdNode);
            examItemNode.bind("click", examClickColor);
            $(idSelect).append(examItemNode);
        }
        $.ajax({
            type:"post",
            contentType:"application/json",
            data:JSON.stringify({'classno': null, 'subject': null}),
            url:"/onlineTest/getAllExamItem.action",
            success:function(result){
                for(var i =0;i<result.length;i++){
                    var id = result[i].id;
                    var examname = result[i].examname;
                    switch (result[i].subject){
                        case "chinese":
                            addExamBySubject("chinese",id,examname);
                            break;
                        case "philosophy":
                            addExamBySubject("philosophy",id,examname);
                            break;
                        case "economics":
                            addExamBySubject("economics",id,examname);
                            break;
                        case "biology":
                            addExamBySubject("biology",id,examname);
                            break;
                        case "history":
                            addExamBySubject("history",id,examname);
                            break;
                        case "sociology":
                            addExamBySubject("sociology",id,examname);
                            break;

                    }
                }
            }
        });
    });
    </script>
</body>
</html>
