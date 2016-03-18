package cn.online.ssm.controller;

import cn.online.ssm.po.NoticePo;
import cn.online.ssm.po.StudentPo;
import cn.online.ssm.service.impl.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hezw on 2016/3/9.
 */

@Controller
public class NoticeController {

    @Autowired
    private NoticeServiceImpl noticeServiceImpl;

    /*
    全部公告显示页面
    */
    @RequestMapping("/checkNotice")
    public ModelAndView checkNotice() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("notice/allnotice");
        return modelAndView;
    }

    /*
    设置未读消息为0
     */
    @RequestMapping("/clearNotice")
    public
    @ResponseBody
    String getNotice(@RequestBody StudentPo studentPo) throws Exception {
        String flag;
        String realname = studentPo.getRealname();
        try {
            noticeServiceImpl.clearNotice(realname);
            flag = "success";
        } catch (Exception e) {
            flag = "failure";
        }
        return flag;
    }

    /*
    添加公告页面
     */
    @RequestMapping("/addNoticePage")
    public String addNoticePage() throws Exception {
        return "notice/addNotice";
    }

    /*
    添加公告
     */
    @RequestMapping("/addNotice")
    public
    @ResponseBody
    String addNotice(@RequestBody NoticePo noticePo) throws Exception {
        String flag;
        try {
            noticeServiceImpl.addNotice(noticePo);
            flag = "success";
        } catch (Exception e) {
            flag = "failure";
        }
        return flag;
    }

    /*
    修改公告页面
     */
    @RequestMapping("/modifyNoticePage")
    public String modifyNoticePage() throws Exception {
        return "notice/modifyNotice";
    }

    /*
    修改公告
     */
    @RequestMapping("/updateNotice")
    public
    @ResponseBody
    String updateNotice(@RequestBody NoticePo noticePo) throws Exception {
        String flag;
        try {
            noticeServiceImpl.updateNotice(noticePo);
            flag = "success";
        } catch (Exception e) {
            flag = "failure";
        }
        return flag;
    }
}
