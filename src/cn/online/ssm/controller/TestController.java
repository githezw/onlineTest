package cn.online.ssm.controller;

import cn.online.ssm.po.TestCategoryPo;
import cn.online.ssm.service.impl.TestServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hezw on 2016/3/14.
 */

@Controller
public class TestController {

    @Autowired
    private TestServiceImpl testServiceImpl;

    @RequestMapping("/addTestTable")
    public String addTestTable(TestCategoryPo testCategoryPo) throws Exception{
        try {
            testServiceImpl.addTestCategory(testCategoryPo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "index";
    }
}