var currentPage;//当前页
var lastPage;//最后页
var Page=0;//记录每次开头的页数是多少
var count;//循环次数
var callbackNum=0;
//ajax-文章查询全部
function selArticle(pageNumber){
    $.post("/write", { "oper": "selArticleAll","pageNumber": pageNumber,"pageSize":6},
        function(articleBean){
            var articleinfo="";
            var articlepage="";
            if(articleBean.data.length>0) {
                for (var i = 0; i < articleBean.data.length; i++) {
                    articleinfo += "<div class='show'>";
                    articleinfo += "<a href='' target='_blank'>"+articleBean.data[i].article_theme+"</a>";
                    articleinfo += "<span class='time'>"+articleBean.data[i].article_time+"</span>";
                    articleinfo += "<p>"+articleBean.data[i].article_summary+"</p>";
                    articleinfo += "<a href=''><more>查看更多</more></a>";
                    articleinfo += "</div>";
                }
            }
            if(articleBean.totalPage>0){
                currentPage = articleBean.pageNumber;
                lastPage= articleBean.totalPage;
                articlepage +=" <li><a href='javascript:void(0)'>&laquo;</a></li>";

                Page = 5* (parseInt(pageNumber/6));//显示正确的页数
                if(articleBean.totalPage - Page >5)//显示记录条数次数
                    count = 6
                else
                    count = articleBean.totalPage - Page //记录条数不够6条时
                for (var i = 1; i <= count; i++) {
                    articlepage +="<li  class='page-number'>";
                    if(articleBean.pageNumber == i+Page)
                        articlepage +="<a  href='javascript:void(0)' class='active'>";
                    else
                        articlepage +="<a  href='javascript:void(0)'>";
                    articlepage +=(i+Page);
                    articlepage +="</a>";
                    articlepage +="</li>";
                }
                articlepage +="<li><a  href='javascript:void(0)'>&raquo;</a></li>";
            }
            //相当innerHTML先清空后添加
            $("#articleInfo").html(articleinfo);
            $("#articlePage").html(articlepage);
        }, "json");
    callbackNum++;
}
//查询标签，分类
function selByLable(lableName,positionName){
    $.post("/write", { "oper":"selByLable","lableName":lableName},
        function(lableData){
            var lableinfo="";
            if(lableData.length>0) {
                for (var i = 0; i < lableData.length; i++) {
                    lableinfo += "<a href='' target='_blank'>";
                    lableinfo += lableData[i];
                    lableinfo += " ";
                    lableinfo += "</a>";
                }
            }else{
                lableinfo +="查询失败，请联系管理员！！！";
            }
            $("#"+positionName).html(lableinfo);
        }, "json");
    callbackNum++;
}
function lableShow() {
    while(callbackNum < 3){
        if(callbackNum == 1)
            selByLable("article_tag","tagInfo");
        else if(callbackNum == 2)
            selByLable("article_classification","classificationInfo");
    }
}