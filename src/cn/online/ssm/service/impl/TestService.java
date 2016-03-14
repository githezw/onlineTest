package cn.online.ssm.service.impl;

import cn.online.ssm.po.TestCategoryPo;

/**
 * Created by hezw on 2016/3/14.
 */
public interface TestService {
    //添加考试项目
    void addTestCategory(TestCategoryPo testCategoryPo) throws Exception;
}
