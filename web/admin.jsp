<%--
  Created by IntelliJ IDEA.
  User: xudada
  Date: 2019/5/25
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<c:choose>
    <c:when test="${insArticleInfo==0}">
        <script type="text/javascript">
            alert("提示：文章添加成功！");
        </script>
    </c:when>
    <c:when test="${insArticleInfo==-1}">
        <script type="text/javascript">
            alert("提示：文章添加失败！");
        </script>
    </c:when>
    <c:when test="${insArticleInfo==-2}">
        <script type="text/javascript">
            alert("提示：服务器繁忙，请稍后再试！");
        </script>
    </c:when>
</c:choose>
<head>
    <title>博客管理</title>

    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/admin.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="image/blog.png" />
    <link rel="stylesheet" href="css/admin.css">
</head>
<script type="text/javascript">
    /*子菜单*/
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
        $(".admin_manages").click(function() {
            $(".admin_manages").each(function() {
                $(this).css({ "color": "white"});
                $(".info_show").css({"display": "none"});
            });

            var index =$(this).index()-1;
            $(this).css({ "color": "aqua"});
            if(index == 1 ){
                selArticle(1);
            }else if(index == 2){
                selUserAll(1);
            }
            $(".info_show").eq(index).css({"display": "inline-block"});

        });
    });
    /*分页点击*/
    $(document).on('click','#articlePage li',function(){
        var index =$(this).index();

        //判断是否超出分页数
        if(index==0 && currentPage- 1 < 1 ||index == count+1 && currentPage+1 > lastPage){
            alert("已经是最后一页！！！");
        }else{
            if(index == 0 && currentPage-1>0){//判断是否超出第一页
                selArticle(currentPage-1);
            }else if(index == count+1 && currentPage+1 <= Page+count+1){//判断是否超出最后一页
                selArticle(currentPage+1);
            }else if(index >=1 && index <=lastPage){
                selArticle(index+Page);//加入Page时为了跳转到正确的页数，index是代表标签li的位置
            }
        }
    });
    $(document).on('click','#userPage li',function(){
        var index =$(this).index();
        //判断是否超出分页数
        if(index==0 && currentPage - 1 < 1 ||index == count+1 && currentPage+1 > lastPage){
            alert("已经是最后一页！！！");
        }else{
            if(index == 0 && currentPage-1>0){//判断是否超出第一页
                selUserAll(currentPage-1);
            }else if(index == lastPage+1 && currentPage+1 <=Page+count+1){//判断是否超出最后一页
                selUserAll(currentPage+1);
            }else if(index >=1 && index <=lastPage){
                selUserAll(index+Page);
            }
        }
    });
</script>

<body >
<!--头部开始-->
<div id="head">
    <a href="index.jsp"><span>博客管理</span></a>
    <div class="sub_menu">
        Menu
        <div class="sub_info">
            <span>菜单栏</span>
            <a href="Javascript:void(0)" class="admin_manages" >发表文章</a>
            <a href="Javascript:void(0)" class="admin_manages">文章管理</a>
            <a href="Javascript:void(0)" class="admin_manages">用户管理</a>
            <a href="Javascript:void(0)" class="admin_manages">评论管理</a>
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
    <a href="Javascript:void(0)" class="admin_manages">发表文章</a>
    <a href="Javascript:void(0)" class="admin_manages">文章管理</a>
    <a href="Javascript:void(0)" class="admin_manages">用户管理</a>
    <a href="Javascript:void(0)" class="admin_manages">评论管理</a>
</div>
<%--发表文章--%>
<div class="info_show">
    <form action="${pageContext.request.contextPath}/write?oper=insArticle" method="post">
        <span>主题：</span>
         <input type="text" value="" class="article"  name="atrice_theme">
        <br>
        <span>标签：</span>
        <input type="text" value="" class="article"  name="atrice_teg">
        <br>
        <span>分类：</span>
        <input type="text" value="" class="article"  name="atrice_classification">
        <br>
        <span>摘要：</span>
        <input type="text" value="" class="article"  name="atrice_summary">
        <br>
        <textarea   id="content"  class="article" name="atrice_content" style="display: none"></textarea>
        <br/>
        <div id="editor" >
        </div>
        <input type="submit" class="submit"  value="提交文章">
    </form>
</div>
<%--文章管理--%>
<div class="info_show">
    <table border="0" cellspacing="3" cellpadding="0">
        <tr>
            <th width="5%">序号</th>
            <th width="25%">文章主题</th>

            <th width="25%">发布时间</th>
            <th width="16%">操作</th>
        </tr>
        <tbody id="articleAll"></tbody>
    </table>
    <%--分页--%>
    <div class="page">
        <ul id="articlePage">
        </ul>
    </div>
</div>
<%--用户管理--%>
<div class="info_show">
    <table border="0" cellspacing="3" cellpadding="0">
        <tr>
            <th width="5%">序号</th>
            <th width="25%">用户</th>

            <th width="25%">注册时间</th>
            <th width="16%">操作</th>
        </tr>
        <tbody id="userAll"></tbody>
    </table>
    <%--分页--%>
    <div class="page">
        <ul id="userPage">
        </ul>
    </div>
</div>
<%--评论管理--%>
<div class="info_show">
    <table border="0" cellspacing="3" cellpadding="0">
        <tr>
            <th width="5%">序号</th>
            <th width="25%">评论内容</th>
            <th width="25%">评论位置</th>
            <th width="25%">评论时间</th>
            <th width="10%">操作</th>
        </tr>

        <tr>
            <td>1</td>
            <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
            <td>信息: Deployment of web application directory E:\apache-tomcat-7.0.56\webapps\manager has finished in 224 ms</td>
            <td>2019-06-12</td>
            <td>
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
</body>
<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="wangEditor/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    var content = document.getElementById("content");
    //图片上传
    editor.customConfig.uploadImgServer = "${pageContext.request.contextPath}/upload";
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadFileName = "filName";

    editor.customConfig.uploadImgHooks = {
        before: function(xhr, editor, files) {
            console.log("未上传");
        },
        success: function(xhr, editor, result) {
            console.log("上传成功");
        },
        fail: function(xhr, editor, result) {
            console.log("上传失败,原因是" + result);
        },
        error: function(xhr, editor) {
            console.log("上传出错");
        },
        timeout: function(xhr, editor) {
            console.log("上传超时");
        }
    }
    // 开启粘贴样式的过滤功能
    editor.customConfig.pasteFilterStyle = true;
    // 关闭忽略粘贴内容中的图片功能
    editor.customConfig.pasteIgnoreImg = false;
    // 自定义菜单配置
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'justify',  // 对齐方式
        'image',  // 插入图片
    ]

    editor.customConfig.onchange = function () {
        // 监控变化，同步更新到 textarea
        content.innerHTML=editor.txt.html();
    }
    editor.create();
</script>
</html>
