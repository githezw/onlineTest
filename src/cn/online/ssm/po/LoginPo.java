package cn.online.ssm.po;

/**
 * Created by hezw on 2016/3/1.
 * 登录页面json转java对象
 */


public class LoginPo {
    private String realname;
    private String passwdTemp;
    private String role;

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPasswdTemp() {
        return passwdTemp;
    }

    public void setPasswdTemp(String passwdTemp) {
        this.passwdTemp = passwdTemp;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
