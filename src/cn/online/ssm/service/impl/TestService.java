package cn.online.ssm.service.impl;

import cn.online.ssm.po.ExamItemPo;
import cn.online.ssm.po.ExamPaperPo;

import java.util.List;
import java.util.Map;

/**
 * Created by hezw on 2016/3/14.
 */
public interface TestService {

    //添加考试项目
    void addExamItem(ExamItemPo examItemPo) throws Exception;

    //删除考试项目
    void deleteExamItem(String id) throws Exception;

    /*
    获取所有考试项目
    @param classno
    @param subject
     */
    List<Map<String, String>> getAllExamItem(Map<String, String> map) throws Exception;

    //新建试题表
    void createExamTable(String tablename) throws Exception;

    //新增试题
    void addExamPaperItem(Map<String, String> map) throws Exception;

    //删除考试项
    void deleteExamTable(String tablename) throws Exception;

    //修改试题
    void updateExamPaperItem(Map<String, String> map) throws Exception;

    //获取一次考试中所有考试题
    List<ExamPaperPo> getAllPaperItem(String tablename) throws Exception;

}
