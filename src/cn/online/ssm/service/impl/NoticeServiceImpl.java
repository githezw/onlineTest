package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by hezw on 2016/3/9.
 */

public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public void clearNotice(String realname) throws Exception {
        try {
            noticeMapper.clearNotice(realname);
        } catch (Exception e) {
        }
    }
}
