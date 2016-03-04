package cn.online.ssm.controller;

import cn.online.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;


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
    修改密码表单提交url
     */
    @RequestMapping("/changePasswd")
    public ModelAndView changePasswd(String realname, String passwdold, String passwdnew, String role) throws Exception {
        Boolean flag;
        boolean validateFlag;
        String tablename = role + "info";
        ModelAndView modelAndView = new ModelAndView();
        HashMap map = new HashMap<String, String>();
        map.put("realname", "'" + realname + "'");
        map.put("passwd", "'" + passwdnew + "'");
        map.put("tablename", tablename);
        validateFlag = userServiceImpl.userLogin(realname, passwdold, role);
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
        modelAndView.addObject("flag", flag);
        modelAndView.setViewName("chpwdresult");    //转到修改密码结果跳转页面
        return modelAndView;
    }
}
