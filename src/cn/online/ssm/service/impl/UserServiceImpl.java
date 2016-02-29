package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * Created by hezw on 2016/2/22.
 */
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper userMapper;

    /**
     * @author hezw
     * 用户登录方法，根据角色分学生和老师登录
     */
    @Override
    public Boolean userLogin(String realname, String passwdTemp, String role) throws Exception {
        boolean flag;
        if ("student".equals(role)) {
            try {
                String passwd = userMapper.stuLogin(realname);
                if (passwd.equals(passwdTemp)) {
                    flag = true;
                } else {
                    flag = false;
                }
            } catch (Exception e) {
                flag = false;
            }
        } else {
            try {
                String passwd = userMapper.teaLogin(realname);
                if (passwd.equals(passwdTemp)) {
                    flag = true;
                } else {
                    flag = false;
                }
            } catch (Exception e) {
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public void changePasswd(Map<String, String> map) throws Exception {
        try {
            userMapper.changePasswd(map);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
