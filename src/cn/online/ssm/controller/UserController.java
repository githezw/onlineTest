package cn.online.ssm.controller;

import cn.online.ssm.po.LoginPo;
import cn.online.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public String index() throws Exception{
        return "index";
    }
    @RequestMapping("/mainPage")
    public String mainPage() throws Exception{
        return "main";
    }
    /*
    用户登录请求
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(String realname,String passwdTemp,String role, HttpSession session) throws Exception {
        ModelAndView model = new ModelAndView();
//        String realname = loginPo.getRealname();
//        String passwdTemp = loginPo.getPasswdTemp();
//        String role = loginPo.getRole();
        session.setAttribute("role", role);
        session.setAttribute("realname",realname);
        boolean flag = userServiceImpl.userLogin(realname, passwdTemp, role);
        if(flag) {
            model.setViewName("main");
        }
        else{
            model.setViewName("index");
            model.addObject("message","输入的用户名或密码错误");
        }
        return model;
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
    public ModelAndView changePasswd(String realname, String passwdold, String passwdnew, String role, String tablename) throws Exception {
        Boolean flag;
        boolean validateFlag;
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
