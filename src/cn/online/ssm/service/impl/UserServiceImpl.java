package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.UserMapper;
import cn.online.ssm.po.NoticePo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
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
                flag = passwd.equals(passwdTemp);
            } catch (Exception e) {
                flag = false;
            }
        } else {
            try {
                String passwd = userMapper.teaLogin(realname);
                flag = passwd.equals(passwdTemp);
            } catch (Exception e) {
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public int getClassno(Map<String,String> map) throws Exception {
        int classno = 0;
        try {
            classno = userMapper.getClassno(map);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return classno;
    }

    @Override
    public void changePasswd(Map<String, String> map) throws Exception {
        try {
            userMapper.changePasswd(map);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<NoticePo> getNotice(Integer classno) throws Exception {
        List<NoticePo> noticeList = new ArrayList<>();
        try {
            noticeList = userMapper.getNotice(classno);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return noticeList;
    }

    @Override
    public int getNoticeNum(String realname) throws Exception {
        int noticeNum = 0;
        try {
            noticeNum = userMapper.getNoticeNum(realname);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return noticeNum;
    }

}
