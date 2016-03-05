package cn.online.ssm.po;

/**
 * Created by Neo on 2016/3/5.
 */
public class ModifyPwdPo {
    private String realname;
    private String passwdold;
    private String passwdnew;
    private String role;

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPasswdold() {
        return passwdold;
    }

    public void setPasswdold(String passwdold) {
        this.passwdold = passwdold;
    }

    public String getPasswdnew() {
        return passwdnew;
    }

    public void setPasswdnew(String passwdnew) {
        this.passwdnew = passwdnew;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
