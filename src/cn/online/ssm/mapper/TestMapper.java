package cn.online.ssm.mapper;

import cn.online.ssm.po.TestCategoryPo;

/**
 * Created by hezw on 2016/3/14.
 */
public interface TestMapper {

    //添加考试项目
    void addTestCategory(TestCategoryPo testCategoryPo) throws Exception;
}
