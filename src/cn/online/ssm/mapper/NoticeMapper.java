package cn.online.ssm.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * Created by hezw on 2016/3/9.
 */
public interface NoticeMapper {

    //设置未读消息数量为0
    void clearNotice(String realname) throws Exception;

}