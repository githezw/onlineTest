package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.NoticeMapper;
import cn.online.ssm.po.NoticePo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;

/**
 * Created by hezw on 2016/3/9.
 */

public class NoticeServiceImpl implements NoticeService {

    @Autowired(required = false)
    private NoticeMapper noticeMapper;

    @Override
    public void clearNotice(String realname) throws Exception {
        try {
            noticeMapper.clearNotice(realname);
        } catch (Exception e) {
        }
    }

    @Override
    public void addNotice(NoticePo noticePo) throws Exception {
        try {
            noticeMapper.addNotice(noticePo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addNoticeNum(int classno) throws Exception {
        try {
            noticeMapper.addNoticeNum(classno);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateNotice(NoticePo noticePo) throws Exception {
        try {
            noticeMapper.updateNotice(noticePo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteNotice(int id) throws Exception {
        try {
            noticeMapper.deleteNotice(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
