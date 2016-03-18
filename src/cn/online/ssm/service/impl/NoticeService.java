package cn.online.ssm.service.impl;

import cn.online.ssm.po.NoticePo;

/**
 * Created by hezw on 2016/3/9.
 */
public interface NoticeService {

    //清除未读公告数目
    void clearNotice(String realname) throws Exception;

    //添加公告
    void addNotice(NoticePo noticePo) throws Exception;

    //更新公告
    void updateNotice(NoticePo noticePo) throws Exception;
}
