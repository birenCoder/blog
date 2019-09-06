package com.xu.controller;

import com.xu.pojo.User;
import com.xu.service.UserService;
import com.xu.utils.MailUtils;
import com.xu.utils.VerifyCodeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;


@Controller
public class UserController  {
    @Resource
    private UserService userServiceImpl;
    /**
     * 用户注册
     * @param u
     * @return
     */
    @RequestMapping("register")
    public String registerUser(HttpServletRequest request,User u){
        //获取验证码
        HttpSession session = request.getSession();
        String veifyCode = (String)session.getAttribute("veifyCode");
        String code = request.getParameter("code");
        //验证码错误
        if(!veifyCode.equalsIgnoreCase(code)){
            //放回错误信息
            return "redirect:/reg";
        }
        System.out.println(u);
        int index = userServiceImpl.insUser(u);

        if(index > 0){ //注册成功
            //发送邮箱激活码
            try {
                new Thread(new MailUtils(u.getMail(),u.getMailcode())).start();
            } catch (Exception e) {
                e.printStackTrace();
            }
            //返回激活信息
        }else{ //注册失败
           //放回注册失败信息
        }


        return "redirect:/login";
    }

    /**
     * 验证码
     * @param request
     * @param response
     */
    @RequestMapping("code")
    public void code(HttpServletRequest request, HttpServletResponse response){
        //设置验证码长度
        String veifyCode = VerifyCodeUtils.createVerifyCode(4);
        //获取session对象，并把验证码存入session中
        HttpSession session = request.getSession();
        session.setAttribute("veifyCode",veifyCode);
        //生成验证码图形
        BufferedImage image = VerifyCodeUtils.createImage(100,30,veifyCode);
        try {
            //把验证码输出到浏览器中
            VerifyCodeUtils.outPutImage(image,"jpg",response.getOutputStream());
        } catch (IOException e) {
            //用日志文件保存错误信息
            e.printStackTrace();
        }
        return ;
    }
    @RequestMapping("active/{mailcode}")
    public void activeUser(@PathVariable String mailcode){
        //根据激活码查找用户
        //效验激活时间
        //设置激活状态
        System.out.println(mailcode);
        //激活成功，跳转到信息提示界面
        return ;
    }
}
