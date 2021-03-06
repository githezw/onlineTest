package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.TestMapper;
import cn.online.ssm.po.ExamItemPo;
import cn.online.ssm.po.ExamPaperPo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by hezw on 2016/3/14.
 */

public class TestServiceImpl implements TestService {

    @Autowired(required = false)
    private TestMapper testMapper;

    @Override
    public void addExamItem(ExamItemPo examItemPo) throws Exception {
        try {
            testMapper.addExamItem(examItemPo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteExamItem(String id) throws Exception {
        try {
            testMapper.deleteExamItem(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    获取所有考试项目
    @param classno
    @param subject
     */
    @Override
    public List<Map<String, String>> getAllExamItem(Map<String, String> map) throws Exception {
        List<Map<String, String>> list = new ArrayList<>();
        try {
            list = testMapper.getAllExamItem(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void createExamTable(String tablename) throws Exception {
        try {
            testMapper.createExamTable(tablename);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addExamPaperItem(Map<String, String> map) throws Exception {
        try {
            testMapper.addExamPaperItem(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteExamTable(String tablename) throws Exception {
        try {
            testMapper.deleteExamTable(tablename);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateExamPaperItem(Map<String, String> map) throws Exception {
        try {
            testMapper.updateExamPaperItem(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ExamPaperPo> getAllPaperItem(String tablename) throws Exception {
        List<ExamPaperPo> list = new ArrayList<>();
        try {
            list = testMapper.getAllPaperItem(tablename);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
