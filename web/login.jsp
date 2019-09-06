<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/5/3
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <script src="js/login.js"></script>
</head>
<!--引用头文件-->
<jsp:include page="head.jsp"></jsp:include>

<body>
    <!--登录界面-->
    <div id="log">
        <div id="login" align="center">
            <form action="user?oper=login" method="post" onsubmit="return check()" >
                <p >登录</p>
                <input type="text" name="uname" id="uname" placeholder="帐号" onblur="check_Name()" />
                <br />
                <label id="lname"></label>
                <br />
                <input type="password" name="pwd" id="pwd" placeholder="密码" onblur="check_Pwd()"/>
                <br />
                <label id="lpwd"></label>
                <br />
                <input id="submit" type="submit" value="登录"/>
                <br />
                <a href="${pageContext.request.contextPath}/reg" id="reg" >立即注册</a>
                <a href="" id="forget">忘记密码</a>
            </form>
        </div>
    </div>
</body>
    <%--<script type="text/javascript">--%>
        <%--setTimeout( function(){--%>
            <%--var tip = document.getElementById("tip");--%>
            <%--tip.innerHTML = "";--%>
        <%--}, 3000);--%>
    <%--</script>--%>
</html>
