package cn.online.ssm.po;

/**
 * Created by hezw on 2016/2/22.
 */
public class TeacherPo {
    private int id;
    private String realname;
    private String passwd;
    private int classno;
    private int grade;
    private String subject;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getClassno() {
        return classno;
    }

    public void setClassno(int classno) {
        this.classno = classno;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
