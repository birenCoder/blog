package com.xu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 控制进入jsp
 */
@Controller
public class viewController {
    //注册
    @RequestMapping("reg")
    private String reg(){
        return "/reg.jsp";
    }
    //登录
    @RequestMapping("login")
    private String login(){
        return "/login.jsp";
    }
    //首页
    @RequestMapping("index")
    private String index(){
        return "/index.jsp";
    }
    //文章
    @RequestMapping("resource")
    private String resource(){
        return "/resource.jsp";
    }
    //留言
    @RequestMapping("guestbook")
    private String guestbook(){
        return "/guestbook.jsp";
    }
    //信息
    @RequestMapping("message")
    private String message(){
        return "/message.jsp";
    }
}
