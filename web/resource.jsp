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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>资源</title>
        <link rel="stylesheet" href="/css/resource.css" />
        <script type="text/javascript" src="/js/resource.js"></script>
    </head>
    <!--引用头文件-->
    <jsp:include page="head.jsp"></jsp:include>
    <script type="text/javascript" >
        /*加载页面r*/
        selArticle(1);
        lableShow();
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
    </script>

    <body>
    <!--资源区部分-->
    <div id="resource">
        <%--资源show--%>
        <div id="articleInfo"></div>
        <%--分页--%>
        <div class="page">
              <ul id="articlePage"></ul>
        </div>
    </div>
    <%--右边--%>
    <div class="resource-right">
        <%--标签--%>
        <div class="resource-label">
            <span>标签</span>
            <br/>
            <div id="tagInfo"></div>
        </div>
        <%--分类--%>
         <div class="resource-label">
             <span>分类</span>
             <div id="classificationInfo"></div>
         </div>
        <%--最新文章--%>
        <div class="resource-label">
            <span>最新文章</span>
        </div>
        <%--热门文章--%>
        <div class="resource-label">
            <span>热门文章</span>
        </div>
    </div>
    </body>

</html>