<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/5/25
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:choose>
    <c:when test="${user==null}">
        <script type="text/javascript">
            alert("提示：请先登录！");
            window.location="/login.jsp";
        </script>
    </c:when>

</c:choose>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="/css/person.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/image/blog.png" />
</head>
<script type="text/javascript">
  window.onload = function () {
        document.onclick = function (e) {
            $(".sub_info").hide();
        }
        $('.sub_menu').bind("click", function (e) {

            if ($(".sub_info").css("display") == "none") {
                $(".sub_info").show();
            } else {
                $(".sub_info").hide();
            }
            e = e || event; stopFunc(e);
        });

        //阻止向上传递事件
        $('.sub_info').bind("click", function (e) {
            e = e || event;
            stopFunc(e);
        });
    }
    function stopFunc(e) {
        e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
    }

 $(document).ready(function() {
     $(".info_shows").click(function() {
         $(".info_shows").each(function() {
             $(this).css({ "color": "white"});
             $(".info_show").css({"display": "none"});
         });

         var index =$(this).index()-1;
         $(this).css({ "color": "aqua"});
         $(".info_show").eq(index).css({"display": "inline-block"});

     });

 });
</script>

<body >
<!--头部开始-->
    <div id="head">
        <a href="index.jsp"><span>个人信息</span></a>
       <div class="sub_menu">
           Menu
            <div class="sub_info">
                <span>菜单栏</span>
                <a href="Javascript:void(0)" class="info_shows" >信息查看</a>
                <a href="Javascript:void(0)" class="info_shows">评论查看</a>
                <a href="Javascript:void(0)" class="info_shows">信息修改</a>
                <a href="Javascript:void(0)" class="info_shows">密码修改</a>
            </div>
        </div>
    </div>
        <%--
            信息查看
            评论修改
            信息修改
            密码修改
        --%>
        <%--选项--%>
       <div class="info_menu">
            <span>菜单栏</span>
            <a href="Javascript:void(0)" class="info_shows">信息查看</a>
            <a href="Javascript:void(0)" class="info_shows">评论查看</a>
            <a href="Javascript:void(0)" class="info_shows">信息修改</a>
            <a href="Javascript:void(0)" class="info_shows">密码修改</a>
        </div>
        <%--展示--%>
        <div class="info_show">
            <span class="info_span">用户名:</span>
            <br>
            <p>彼人丶已绝版</p>
            <span class="info_span">性别:</span>
            <br>
            <p>男</p>
            <span class="info_span">联系电话:</span>
            <br>
            <p>15767489046</p>
            <span class="info_span">QQ邮箱:</span>
            <br>
            <p>805214631@qq.com</p>
        </div>

        <div class="info_show">
            <table border="0" cellspacing="3" cellpadding="0">
                <tr>
                    <th width="5%">序号</th>
                    <th width="25%">留言信息</th>

                    <th width="25%">时间</th>
                    <th width="10%">操作</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>


                <tr>
                    <td>2</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</td>
                    <td>2019-06-12</td>
                    <td>
                        <a href="#" target="_blank" class="operate" style="background-color: limegreen">查看</a>
                        <a href="#" style="background-color: red;">删除</a>
                    </td>
                </tr>
            </table>
            <%--分页--%>
            <div class="page">
                <ul>
                    <li><a href="">&laquo;</a></li>
                    <li class="page-number"><a href="javascript:void(0)" class="active">1</a></li>
                    <li class="page-number"><a href="javascript:void(0)">2</a></li>
                    <li class="page-number"><a href="javascript:void(0)">3</a></li>
                    <li class="page-space">&hellip;</li>
                    <li class="page-number"><a href="javascript:void(0)">8</a></li>
                    <li><a  href="">&raquo;</a></li>
                </ul>

            </div>
        </div>
<%--信息修改--%>
        <div class="info_show">
                <form method="post" action="">
                    <span class="info_span">用户名:</span>
                    <br>
                    <input type="password" name="realname" id="" value=""/>
                    <label id=""></label>
                    <br>
                    <span class="info_span">性别:</span>
                    <br>
                    <input type="radio" class="sex" name="sex" value="1"  checked="checked" >男
                    <input type="radio" class="sex" name="sex" value="0" >女
                    <label id=""></label>
                    <br>
                    <span class="info_span">联系电话:</span>
                    <br>
                    <input type="password" name="realname" id="" value=""/>
                    <label id=""></label>
                    <br>
                    <span class="info_span">QQ邮箱:</span>
                    <br>
                    <input type="password" name="realname" id="" value=""/>
                    <label id=""></label>
                    <br>
                    <input class="submit" type="submit" value="修改信息">
                </form>
        </div>
        <%--密码修改--%>
        <div class="info_show">
                <form method="post" action="">
                <span class="info_span">旧密码:</span>
                <br>
                <input type="password" name="realname" id="pwd" value=""/>
                <label id="lpwd"></label>
                <br>
                <span class="info_span">新密码:</span>
                <br>

                <input type="password" name="realname" id="npwd" value=""/>
                <label id="lnpwd"></label>
                <br>
                <span class="info_span">确认新密码:</span>
                <br>
                <input type="password" name="realname" id="npwds" value=""/>
                <label id="lnpwds"></label>
                <br>
                    <input class="submit" type="submit" value="修改密码">
                </form>
        </div>
</body>
</html>
