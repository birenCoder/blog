package com.xu.mapper;

import com.xu.pojo.User;

public interface UserMapper {
    /**
     * 用户注册
     * @param u
     * @return
     */
    int insUser(User u);

    /**
     * 用户查找-
     * @param mailcode
     * @return
     */
    User selUserByMailcode(String mailcode);

    /**
     *  修改激活状态
     * @param id
     * @return
     */
    int updActiveByUserID(int id);

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    User selUserByUnameAndPwd(String username, String password);
}
