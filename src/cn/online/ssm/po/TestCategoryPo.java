package cn.online.ssm.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

/**
 * Created by hezw on 2016/3/14.
 */

public class TestCategoryPo {
    private String tableName;
    private String testName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String testTime;
    private String author;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public String getTestTime() {
        return testTime;
    }

    public void setTestTime(String testTime) {
        this.testTime = testTime;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
