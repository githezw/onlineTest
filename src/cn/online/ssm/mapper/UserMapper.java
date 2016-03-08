package cn.online.ssm.mapper;

import cn.online.ssm.po.NoticePo;

import java.util.List;
import java.util.Map;

/**
 * Created by hezw on 2016/2/22.
 */
public interface UserMapper {
    String stuLogin(String realname) throws Exception;

    String teaLogin(String realname) throws Exception;

    void changePasswd(Map<String,String> map) throws Exception;

    List<NoticePo> getNotice(Integer classno) throws Exception;

    int getNoticeNum(String realname) throws Exception;
}
