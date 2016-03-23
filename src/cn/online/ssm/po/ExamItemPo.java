package cn.online.ssm.po;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by hezw on 2016/3/23.
 */

public class ExamItemPo {
    private int id;
    private String examname;
    private String subject;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String examtime;
    private String author;
    private int classno;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getExamname() {
        return examname;
    }

    public void setExamname(String examname) {
        this.examname = examname;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getExamtime() {
        return examtime;
    }

    public void setExamtime(String examtime) {
        this.examtime = examtime;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getClassno() {
        return classno;
    }

    public void setClassno(int classno) {
        this.classno = classno;
    }
}
