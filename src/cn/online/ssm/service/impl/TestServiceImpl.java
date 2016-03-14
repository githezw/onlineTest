package cn.online.ssm.service.impl;

import cn.online.ssm.mapper.TestMapper;
import cn.online.ssm.po.TestCategoryPo;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by hezw on 2016/3/14.
 */

public class TestServiceImpl implements TestService {

    @Autowired(required = false)
    private TestMapper testMapper;
    @Override
    public void addTestCategory(TestCategoryPo testCategoryPo) throws Exception {
        try {
            testMapper.addTestCategory(testCategoryPo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
