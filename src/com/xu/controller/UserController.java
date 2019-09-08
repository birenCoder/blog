package com.xu.controller;

import com.xu.pojo.Message;
import com.xu.pojo.User;
import com.xu.service.UserService;
import com.xu.utils.MailUtils;
import com.xu.utils.VerifyCodeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
public class UserController {
    @Resource
    private UserService userServiceImpl;

    /**
     * 用户注册
     * @param u
     * @return
     */
    @RequestMapping("/register")
    public String registerUser(HttpServletRequest request,User u,Model model){
        //获取验证码
        String veifyCode = (String) request.getSession().getAttribute("veifyCode");
        String code = request.getParameter("code");
        //验证码错误
        if(!veifyCode.equalsIgnoreCase(code)){
            //设置错误信息并返回
            model.addAttribute("MESSAGE",Message.REGISTER_MESSAGE_FAILURE);
            return "/reg.jsp";
        }
        try{
            //注册用户
            userServiceImpl.insUser(u);
            //注册成功 -- 发送邮箱激活码
            new Thread(new MailUtils(u.getMail(),u.getMailcode())).start();
            //返回激活信息
            model.addAttribute("MESSAGE",Message.REGISTER_MESSAGE_SUCCESS);
        }catch (Exception e){
            //注册失败 -- 放回注册失败信息
            e.printStackTrace();
            model.addAttribute("MESSAGE",Message.SERVER_MESSAGE_BUSYING);
        }
        return "/message.jsp";
    }

    /**
     * 验证码
     * @param request
     * @param response
     */
    @RequestMapping("/code")
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

    /**
     * 用户激活
     * @param mailcode
     *
     */
    @RequestMapping("/active/{mailcode}")
    public String activeUser(@PathVariable String mailcode,Model model)  {
        //根据激活码查找用户
        User u = null;
        try{
            //获取用户
             u = userServiceImpl.selUserByMailcode(mailcode);
        }catch (Exception e){
            //获取用户出现异常
            e.printStackTrace();
            model.addAttribute("MESSAGE", Message.SERVER_MESSAGE_BUSYING);
            return "/message.jsp";
        }
        //防止用户乱输入激活码
       if(u == null){
           //设置激活链接无效信息
           model.addAttribute("MESSAGE", Message.ACTIVE_MESSAGE_FAILURE);
       }else{
           //账号已经激活
           if(u.getActive().equals("Y")){
               //设置账号已经激活信息
               model.addAttribute("MESSAGE", Message.ACTIVE_MESSAGE_AGAIN);
           }else{
               //新建现在时间日期
               SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               String nowDate = simpleDateFormat.format(new Date());
               //激活链接是否超时
               long passTime = 0;
               try {
                   passTime = (simpleDateFormat.parse(nowDate).getTime()- simpleDateFormat.parse(u.getTime()).getTime() )/(1000 * 60);
               } catch (Exception e) {
                   //计算时间出现异常
                   e.printStackTrace();
                   model.addAttribute("MESSAGE", Message.SERVER_MESSAGE_BUSYING);
                   return "/message.jsp";
               }
               if(passTime > 15){
                   //激活时间超时
                   model.addAttribute("MESSAGE", Message.ACTIVE_MESSAGE_OVERTIME);
               }else{
                   //设置激活状态
                   try{
                        userServiceImpl.updActiveByUserID(u.getId());
                        //激活成功
                        model.addAttribute("MESSAGE", Message.ACTIVE_MESSAGE_SUCCESS);
                   }catch (Exception e){
                        //修改激活状态出现异常
                        e.printStackTrace();
                        //激活失败，出现异常，需要联系管理员
                        model.addAttribute("MESSAGE", Message.ACTIVE_MESSAGE_ERROR);
                       return "/message.jsp";
                   }
               }
           }
       }
        //激活成功，跳转到信息提示界面
        return "/message.jsp";
    }

    /**
     * 用户登录
     * @return
     */
    @RequestMapping("/logon")
    public String loginUser(String username,String password,Model model,HttpServletRequest request){
        User u = null;
        //查找用户
        try{
            u = userServiceImpl.selUserByUnameAndPwd(username,password);
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("MESSAGE",Message.SERVER_MESSAGE_BUSYING);
            return "/message.jsp";
        }
        if(u == null){
            //账号或密码错误
            model.addAttribute("MESSAGE",Message.LOGON_MESSAGE_FAILURE);
            return "/login.jsp";
        }else{
            if(u.getActive().equals("N")){
                //账号未激活
                model.addAttribute("MESSAGE",Message.LOGON_MESSAGE_NOACTIVE);
                return "/login.jsp";
            }else{
                //将用户保存到session中
                request.getSession().setAttribute("user",u);
            }
        }
        return "redirect:/index.jsp";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,Model model){
        request.getSession().invalidate();
        model.addAttribute("MESSAGE",Message.LOGOUT_MESSAGE_SUCCESS);
        return "/message.jsp";
    }

}
