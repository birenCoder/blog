<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/5/6
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="/css/reg.css">
    <script src="/js/reg.js"></script>
</head>
<!--引用头文件-->
<jsp:include page="head.jsp"></jsp:include>

<body>
    <div class="reg">
        <div id="msg" ><p style="color: red;position: absolute;font-size: 22px;left: 41%;">${MESSAGE}</p></div>
        <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return check()">
            <p>注册</p>
            <span class="reg-lefts">账&nbsp;&nbsp;&nbsp;号:</span>
            <input type="text" class="inputs" name="username" id="user" value="" onblur="checkUser()"/>
            <label id="luser"></label>
            <br>

            <span class="reg-lefts">用户名:</span>
            <input type="text" class="inputs"name="realname" id="name" value="" onblur="checkName()"/>
            <label id="lname"></label>
            <br>

            <span class="reg-lefts">密&nbsp;&nbsp;&nbsp;码:</span>
            <input type="password" class="inputs" name="password" id="pwd1" value="" onblur="checkPwd1()" onchange="checkPwd2()"/>
            <label id="lpwd1"></label>
            <br>

            <span class="reg-lefts">确认密码:</span>
            <input type="password" class="inputs" name="" id="pwd2" value="" onblur="checkPwd2()"/>
            <label id="lpwd2"></label>
            <br>

            <span class="reg-lefts">性&nbsp;&nbsp;&nbsp;别:</span>
            <input type="radio" class="sex" name="sex" value="1"  checked="checked" >男
            <input type="radio" class="sex" name="sex" value="0" >女
            <br>

            <span class="reg-lefts">QQ邮箱:</span>
            <input type="text" class="inputs" name="mail" id="mail" value="" onblur="checkMail()"/>
            <label id="lmail"></label>
            <br>

            <span class="reg-lefts">验证码:</span>
            <input type="text"  class="inputs" name="code" id="code" value="" onblur="checkCode()"/>
            <img id="imgCode" src="${pageContext.request.contextPath}/code" width="100" height="30" title="点击刷新" onclick="flashCode()">
            <br>
            <label id="lcode"></label>
            <br>

            <input id="submit" type="submit" value="立即注册"/>
        </form>
    </div>
</body>
    <script type="text/javascript">
        setTimeout( function(){
            var msg = document.getElementById("msg");
              msg.innerHTML = "";
        }, 3000);
    </script>
</html>
