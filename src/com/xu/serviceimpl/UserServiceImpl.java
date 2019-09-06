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

    @Override
    public int insUser(User u) {
        //设置用户激活状态
        u.setActive("N");
        //获取邮箱激活码
        u.setMailcode(UUID.randomUUID().toString().replaceAll("-", ""));
        //设置用户注册时间
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
        u.setTime(dateFormat.format(date));
        return usertMapper.insUser(u);
    }
}
