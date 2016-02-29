package cn.online.ssm.service.impl;

import cn.online.ssm.po.StudentPo;
import cn.online.ssm.po.TeacherPo;

import java.util.Map;

/**
 * Created by hezw on 2016/2/22.
 */
public interface UserService {
    Boolean userLogin(String realname, String passwdTemp, String role) throws Exception;
    void changePasswd(Map<String,String> map) throws Exception;
}
