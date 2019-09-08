package com.xu.pojo;

public interface Message {
    //服务器出现异常
    String SERVER_MESSAGE_BUSYING = "服务器繁忙，请稍后再试或联系管理员！！！";
    //用户激活信息
    String ACTIVE_MESSAGE_SUCCESS = "恭喜你，账号激活成功！！！";
    String ACTIVE_MESSAGE_FAILURE = "该激活链接无效，请重新发送正确的激活链接！！！";
    String ACTIVE_MESSAGE_OVERTIME = "该激活链接已超时，请联系管理员！！！";
    String ACTIVE_MESSAGE_AGAIN = "该账号已经激活，请前往登录！！！";
    String ACTIVE_MESSAGE_ERROR = "账号激活失败，请联系管理员！！！";

    //用户注册信息
    String REGISTER_MESSAGE_SUCCESS ="恭喜你，账号注册成功，请前往邮箱激活该账号！！！";
    String REGISTER_MESSAGE_FAILURE ="验证码错误！！！";

    //用户登录信息
    String LOGON_MESSAGE_FAILURE = "账号或密码错误";
    String LOGON_MESSAGE_NOACTIVE = "该账号尚未激活";

    //退出信息
    String LOGOUT_MESSAGE_SUCCESS ="您已成功退出！！！";
}
