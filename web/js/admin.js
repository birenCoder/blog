var currentPage;//当前页
var lastPage;//最后页
var Page=0;//记录每次开头的页数是多少
var count;//循环次数

//ajax-文章查询全部
function selArticle(pageNumber){
    $.post("/write", { "oper": "selArticleAll","pageNumber": pageNumber,"pageSize":10 },
        function(articleBean){
            var articleinfo="";
            var articlepage="";

            if(articleBean.data.length>0) {
                for (var i = 0; i < articleBean.data.length; i++) {
                    articleinfo += "<tr>";
                    articleinfo += "<td>" + (i+1+10*(pageNumber-1)) + "</td>"
                    articleinfo += "<td>" + articleBean.data[i].article_theme + "</td>"
                    articleinfo += "<td>" + articleBean.data[i].article_time + "</td>"
                    articleinfo += "<td>" +
                        "<a href=" + articleBean.data[i].article_id + " target='_blank' class='operate' style='background-color: limegreen'>查看</a> " +
                        "<a href='#' style='background-color: darkcyan;'>修改</a> " +
                        "<a href='#' style='background-color: red;'>删除</a>" +
                        "</td>";
                    articleinfo += "</tr>";
                }
            }else{
                articleinfo += "<tr>";
                articleinfo += "<td>"+"空"+"</td>";
                articleinfo += "<td>"+"空"+"</td>";
                articleinfo += "<td>"+"空"+"</td>";
                articleinfo += "<td>"+"空"+"</td>";
                articleinfo += "</tr>";
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
            $("#articleAll").html(articleinfo);
            $("#articlePage").html(articlepage);
        }, "json");
}
//用户查询查询
function selUserAll(pageNumber){
    $.post("/user", { "oper": "selUserAll","pageNumber": pageNumber },
        function(userBean){
            var userinfo="";
            var userpage="";
            if(userBean.data.length>0) {
                for (var i = 0; i < userBean.data.length; i++) {
                    userinfo += "<tr>";
                    userinfo += "<td>" + (i+1+10*(pageNumber-1))+ "</td>"
                    userinfo += "<td>" + userBean.data[i].user_name + "</td>"
                    userinfo += "<td>" + userBean.data[i].user_time + "</td>"
                    userinfo += "<td>" +
                        "<a href=" + userBean.data[i].user_name + " target='_blank' class='operate' style='background-color: limegreen'>查看</a> " +
                        "<a href='#' style='background-color: darkcyan;'>修改</a> " +
                        "<a href='#' style='background-color: red;'>删除</a>" +
                        "</td>";
                    userinfo += "</tr>";
                }
            }else{
                userinfo += "<tr>";
                userinfo += "<td>"+"空"+"</td>";
                userinfo += "<td>"+"空"+"</td>";
                userinfo += "<td>"+"空"+"</td>";
                userinfo += "<td>"+"空"+"</td>";
                userinfo += "</tr>";
            }
            if(userBean.totalPage>0){
                currentPage = userBean.pageNumber;
                lastPage= userBean.totalPage;
                userpage +=" <li><a href='javascript:void(0)'>&laquo;</a></li>";
                Page = 5* (parseInt(pageNumber/6));
                if(userBean.totalPage - Page >5)
                    count = 6
                else
                    count = userBean.totalPage - Page
                for (var i = 1; i <= count; i++) {
                    userpage +="<li  class='page-number'>";
                    if(userBean.pageNumber == i)
                        userpage +="<a  href='javascript:void(0)' class='active'>";
                    else
                        userpage +="<a  href='javascript:void(0)'>";
                        userpage +=(i+Page);
                        userpage +="</a>";
                        userpage +="</li>";
                }
                userpage +="<li><a  href='javascript:void(0)'>&raquo;</a></li>";

            }
            //相当innerHTML先清空后添加
            $("#userAll").html(userinfo);
            $("#userPage").html(userpage);
        }, "json");
}
