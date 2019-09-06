<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/5/1
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>留言</title>
    <link rel="stylesheet" href="css/guestbook.css">
</head>
<!--引用头文件-->
<jsp:include page="head.jsp"></jsp:include>
<body>
    <div class="guestbook">
        <b>留言区</b>
        <div class="write_message">
            <form action="">
            <div id="editor">
            </div>
                <input type="submit" value="提交">
            </form>
        </div>
        <div class="showmessage">
                <div class="message">
                    <span>2019年06月12日</span>
                    <br>
                    <span>张三:</span>
                    <p>开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入</p>
                </div>
                <div class="message">
                    <span>2019年06月12日 李四:</span>
                    <p>开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入开发日志写入</p>
                </div>
                <div class="message">
                    <span>2019年06月12日 王五：</span>

                    <p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd</p>
                </div>
            <div class="message">
                <span>2019年06月12日 李四:</span>
                <p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd</p>
            </div>
            <div class="message">
                <span>2019年06月12日 赵六:</span>
                <p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd</p>
            </div>
            <div class="moremessage">
                <input id="btnmore" type="button" value="显示更多">
            </div>
        </div>
    </div>
</body>
<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="wangEditor/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 自定义菜单配置
    editor.customConfig.menus = [

    ]

    editor.customConfig.onchange = function () {
        // 监控变化，同步更新到 textarea
    }
    editor.create();
</script>
</html>
