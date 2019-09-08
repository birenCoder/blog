package com.xu.service;

import com.xu.pojo.User;

public interface UserService {
    /**
     * 用户注册
     * @param u
     * @return
     */
    int insUser(User u);

    /**
     * 激活码查找-ByMailcode
     * @param mailcode
     * @return
     */
    User selUserByMailcode(String mailcode);

    /**
     * 设置激活码
     * @param id
     * @return
     */
    int updActiveByUserID(int id);

    /**
     * 用户登录
     * @param username 账号
     * @param password 密码
     * @return
     */
    User selUserByUnameAndPwd(String username, String password);
}
