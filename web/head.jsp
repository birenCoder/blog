<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/5/1
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="css/head.css" />
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
    <link rel="shortcut icon" href="images/blog.png" />
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
  </head>

  <body>
      <!--头部开始-->
      <div id="head">
		        <span>彼人博客</span>
		        <!--登录-->
		        <div class="login">
                    <%--<a href="login.jsp" >登录 / 注册</a>--%>
                    <c:choose>
                        <c:when test="${user==null}">
                            <a href="${pageContext.request.contextPath}/login" >登录 / 注册</a>
                        </c:when>
                        <c:when test="${user!=null}">
                            <lable>${user.realname}</lable>
                            <a href="person.jsp" target="_blank">个人中心</a>
                            <a href="javascript:void(0)" id="logout">退出</a>
                        </c:when>
                    </c:choose>
		        </div>
		        <!--导航栏-->
		        <div id="nav">
		          <a href="${pageContext.request.contextPath}/index" >首页</a>
		          <a href="${pageContext.request.contextPath}/resource" >资源区</a>
		          <a href="${pageContext.request.contextPath}/guestbook" >留言区</a>
		          <a href="#" >关于</a>
		        </div>
      </div>
  </body>
<%--<script type="text/javascript">--%>
    <%--$("#logout").on("click",function () {--%>
       <%--var logoutflag =  window.confirm("是否退出登录？");--%>
       <%--if(logoutflag)--%>
           <%--window.location="${pageContext.request.contextPath}/user?oper=logout";--%>
    <%--});--%>
<%--</script>--%>
</html>
