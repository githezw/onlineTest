package cn.online.ssm.service.impl;

import cn.online.ssm.po.StudentPo;
import cn.online.ssm.po.TeacherPo;

/**
 * Created by hezw on 2016/2/22.
 */
public interface UserService {
    String teaLogin(String realname) throws Exception;
    String stuLogin(String realname) throws Exception;
}
