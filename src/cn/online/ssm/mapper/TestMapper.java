package cn.online.ssm.mapper;

import cn.online.ssm.po.ExamItemPo;
import cn.online.ssm.po.ExamPaperPo;

import java.util.List;
import java.util.Map;

/**
 * Created by hezw on 2016/3/14.
 */
public interface TestMapper {

    //添加考试项目
    void addExamItem(ExamItemPo examItemPo) throws Exception;

    //删除考试项目
    void deleteExamItem(String id) throws Exception;

    //获取所有考试项目
    List<Map<String,String>> getAllExamItem(Map<String,String> map) throws Exception;

    //新建试题表
    void createExamTable(String tablename) throws Exception;

    //新增试题
    void addExamPaperItem(Map<String,String> map) throws Exception;

    //删除考试项
    void deleteExamTable(String tablename) throws Exception;
}
