package com.xu.serviceimpl;

import com.xu.mapper.UserMapper;
import com.xu.pojo.User;
import com.xu.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserMapper usertMapper;
    //用户注册
    @Override
    public int insUser(User u) {
        //设置用户激活状态
        u.setActive("N");
        //获取邮箱激活码
        u.setMailcode(UUID.randomUUID().toString().replaceAll("-", ""));
        //设置用户注册时间
        u.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        return usertMapper.insUser(u);
    }
    //查找激活码---ByMailcode
    @Override
    public User selUserByMailcode(String mailcode) {
        return usertMapper.selUserByMailcode(mailcode);
    }

    //用户激活
    @Override
    public int updActiveByUserID(int id) {
        return usertMapper.updActiveByUserID(id);
    }
    //用户登录
    @Override
    public User selUserByUnameAndPwd(String username, String password) {
        return usertMapper.selUserByUnameAndPwd(username,password);
    }
}
