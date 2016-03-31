package cn.online.ssm.controller;

import cn.online.ssm.po.ExamItemPo;
import cn.online.ssm.po.ExamPaperPo;
import cn.online.ssm.service.impl.TestServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    //获取全部考试项目
    @RequestMapping("/getAllExamItem")
    public
    @ResponseBody
    List<Map<String, String>> getAllExamItem(@RequestBody Map<String, String> map) throws Exception {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        try {
            list = testServiceImpl.getAllExamItem(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //增加考试项目表
    @RequestMapping("/createExamTable")
    public void createExamTable(@RequestBody Map<String, String> map) throws Exception {
        String tablename = "";
        tablename += (String) map.get("id");
        tablename = tablename + "_" + (String) map.get("examname");
        tablename = tablename + "_" + (String) map.get("subject");
        System.out.println(tablename);
        try {
            testServiceImpl.createExamTable(tablename);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //新增考题
    @RequestMapping("/addExamPaperItem")
    public
    @ResponseBody
    String addExamPaperItem(@RequestBody Map<String,String> map) throws Exception {
        String flag;
        Map<String,Object> examMap = new HashMap<String ,Object>();
        String tablename = map.get("id")+"_"+map.get("examname")+"_"+map.get("subject");
        map.put("tablename",tablename);
        try {
            testServiceImpl.addExamPaperItem(map);
            flag="success";
        } catch (Exception e) {
            e.printStackTrace();
            flag="failure";
        }
        return flag;
    }

    //删除考试项页面
    @RequestMapping("/deleteExamPage")
    public String deleteExamPage() throws Exception{
        return "exam/deleteExam";
    }

    //删除考试项
    @RequestMapping("/deleteExamTable")
    public @ResponseBody String deleteExamTable(@RequestBody Map<String,String> map) throws Exception{
        String flag;
        String tablename =  map.get("id")+"_"+map.get("examname")+"_"+map.get("subject");
        try {
            testServiceImpl.deleteExamItem(map.get("id"));
            testServiceImpl.deleteExamTable(tablename);
            flag="success";
        } catch (Exception e) {
            flag="failure";
            e.printStackTrace();
        }
        return flag;
    }

}
