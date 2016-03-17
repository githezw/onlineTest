package cn.online.ssm.service.impl;

import cn.online.ssm.po.NoticePo;
import cn.online.ssm.po.StudentPo;
import cn.online.ssm.po.TeacherPo;

import java.util.List;
import java.util.Map;

/**
 * Created by hezw on 2016/2/22.
 */
public interface UserService {
    //用户登录验证
    Boolean userLogin(String realname, String passwdTemp, String role) throws Exception;

    //获取学生/教师班级号
    int getClassno(Map<String,String> map) throws Exception;

    //修改密码
    void changePasswd(Map<String, String> map) throws Exception;

    //主页面获取公告数量，内容信息
    List<NoticePo> getNotice(Integer classno) throws Exception;

    //主页面获取公告未读数量
    int getNoticeNum(String realname) throws Exception;
}
