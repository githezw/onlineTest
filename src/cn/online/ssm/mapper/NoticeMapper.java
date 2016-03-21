package cn.online.ssm.mapper;

import cn.online.ssm.po.NoticePo;
import org.apache.ibatis.annotations.Param;

/**
 * Created by hezw on 2016/3/9.
 */
public interface NoticeMapper {

    //设置未读消息数量为0
    void clearNotice(String realname) throws Exception;

    //添加公告
    void addNotice(NoticePo noticePo) throws Exception;

    //更新公告
    void updateNotice(NoticePo noticePo) throws Exception;

    //删除公告
    void deleteNotice(int id) throws Exception;
}
