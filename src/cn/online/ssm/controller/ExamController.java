package cn.online.ssm.controller;

import cn.online.ssm.po.ExamItemPo;
import cn.online.ssm.service.impl.TestServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by hezw on 2016/3/14.
 */

@Controller
public class ExamController {

    @Autowired
    private TestServiceImpl testServiceImpl;

    //添加考试页面
    @RequestMapping("/addExamPage")
    public String addExamPage() throws Exception {
        return "exam/addExam";
    }

    //增加考试项目
    @RequestMapping("/addExamItem")
    public
    @ResponseBody
    String addExamItem(@RequestBody ExamItemPo examItemPo) throws Exception {
        String flag;
        try {
            testServiceImpl.addExamItem(examItemPo);
            flag = "success";
        } catch (Exception e) {
            flag = "failure";
        }
        return flag;
    }
}
