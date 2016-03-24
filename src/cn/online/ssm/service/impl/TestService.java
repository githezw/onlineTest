package cn.online.ssm.service.impl;

import cn.online.ssm.po.ExamItemPo;

import java.util.List;
import java.util.Map;

/**
 * Created by hezw on 2016/3/14.
 */
public interface TestService {

    //添加考试项目
    void addExamItem(ExamItemPo examItemPo) throws Exception;

    /*
    获取所有考试项目
    @param classno
    @param subject
     */
    List<Map<String,String>> getAllExamItem(Map<String,String> map) throws Exception;
}
