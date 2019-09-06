package com.xu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 控制进入jsp
 */
@Controller
public class viewController {
    @RequestMapping("reg")
    private String reg(){
        return "/reg.jsp";
    }
    @RequestMapping("login")
    private String login(){
        return "/login.jsp";
    }
    @RequestMapping("index")
    private String index(){
        return "/index.jsp";
    }
    @RequestMapping("resource")
    private String resource(){
        return "/resource.jsp";
    }
    @RequestMapping("guestbook")
    private String guestbook(){
        return "/guestbook.jsp";
    }
}
