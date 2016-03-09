package cn.online.ssm.controller;

import cn.online.ssm.po.ModifyPwdPo;
import cn.online.ssm.po.NoticePo;
import cn.online.ssm.po.StudentPo;
import cn.online.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by hezw on 2016/2/22.
 */
@Controller
public class UserController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @RequestMapping("/index")
    public String index() throws Exception {
        return "index";
    }

    @RequestMapping("/mainPage")
    public String mainPage() throws Exception {
        return "main";
    }

    /*
    用户登录请求
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String realname, String passwdTemp, String role, HttpSession session) throws Exception {
        boolean flag = userServiceImpl.userLogin(realname, passwdTemp, role);
        if (flag) {
            session.setAttribute("realname", realname);
            session.setAttribute("role", role);
            return "redirect:/mainPage.action";
        } else {
            return "redirect:/index.action";
        }
    }

    /*
    退出登录
     */
    @RequestMapping("logout")
    public String logout(HttpSession session) throws Exception {
        session.removeAttribute("realname");
        session.removeAttribute("role");
        return "redirect:/index.action";
    }

    /*
    跳转到修改密码页面
     */
    @RequestMapping("/changepwd")
    public String changepwd() throws Exception {
        return "chpasswd";
    }

    /*
    通过传递json数据修改密码
     */
    @RequestMapping(value = "/changePasswd",method = RequestMethod.POST)
    public @ResponseBody String changePasswd(@RequestBody ModifyPwdPo modifyPwdPo) throws Exception {
        Boolean flag;
        boolean validateFlag;
        String tablename = modifyPwdPo.getRole() + "info";
        HashMap map = new HashMap<String, String>();
        map.put("realname", "'" + modifyPwdPo.getRealname() + "'");
        map.put("passwd", "'" + modifyPwdPo.getPasswdnew() + "'");
        map.put("tablename", tablename);
        validateFlag = userServiceImpl.userLogin(modifyPwdPo.getRealname(), modifyPwdPo.getPasswdold(), modifyPwdPo.getRole());
        if (validateFlag) {
            try {
                userServiceImpl.changePasswd(map);
                flag = true;
            } catch (Exception e) {
                flag = false;
            }
        } else {
            flag = false;
        }
        return flag.toString();
    }

    /*
    获取新公告数量
     */
    @RequestMapping("/getNoticeNum")
    @ResponseBody
    public int getNoticeNum(@RequestBody StudentPo studentPo) throws Exception{
        String realname = studentPo.getRealname();
        int noticeNum = 0;
        noticeNum=userServiceImpl.getNoticeNum(realname);
        return noticeNum;
    }

    /*
    获取班级通知列表信息
     */
    @RequestMapping("/getNotice")
    public @ResponseBody
    List<NoticePo> getNotice(@RequestBody StudentPo studentPo) throws Exception{
        List<NoticePo> noticeList =  new ArrayList<NoticePo>();
        int classno = studentPo.getClassno();
        noticeList = userServiceImpl.getNotice(classno);
        return noticeList;
    }
}
