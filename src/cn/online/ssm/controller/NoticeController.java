package cn.online.ssm.controller;

import cn.online.ssm.po.NoticePo;
import cn.online.ssm.po.StudentPo;
import cn.online.ssm.service.impl.NoticeServiceImpl;
import org.apache.ibatis.annotations.Param;
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
    public ModelAndView checkNotice(String realname) throws Exception {
        List<NoticePo> noticePoList = new ArrayList<>();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("allnotice");
        return modelAndView;
    }

    /*
    设置未读消息为0

    /*
    获取班级通知列表信息
     */
    @RequestMapping("/clearNotice")
    public @ResponseBody
    String getNotice(@RequestBody StudentPo studentPo) throws Exception{
        String flag;
        String realname = studentPo.getRealname();
        try{
            noticeServiceImpl.clearNotice(realname);
            flag = "success";
        }catch(Exception e){
            flag = "failure";
        }
        return flag;
    }

}
