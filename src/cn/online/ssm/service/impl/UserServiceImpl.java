package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by hezw on 2016/2/22.
 */
public class UserServiceImpl implements UserService {


    private UserMapper userMapper;

    @Override
    public String teaLogin(String realname) throws Exception {
        return new String();
    }

    @Override
    public String stuLogin(String realname) throws Exception {
        String passwd = userMapper.stuLogin(realname);
        return passwd;
    }
}
