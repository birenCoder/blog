<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/9/7
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="css/head.css" />
    <link rel="stylesheet" type="text/css" href="css/message.css"/>
    <title>彼人博客</title>
</head>
<!--引用头文件-->
<jsp:include page="head.jsp"></jsp:include>
<body>


<div>
    message提示信息：<p>${ACTIVE_MESSAGE}</p>
</div>
</body>
</html>
