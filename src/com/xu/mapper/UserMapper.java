package com.xu.mapper;

import com.xu.pojo.User;

public interface UserMapper {
    /**
     * 用户注册
     * @param u
     * @return
     */
    int insUser(User u);
}
