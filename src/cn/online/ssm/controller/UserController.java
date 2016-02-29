package cn.online.ssm.controller;

import cn.online.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;


/**
 * Created by hezw on 2016/2/22.
 */
@Controller
public class UserController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @RequestMapping("/login")
    public ModelAndView login(String realname, String passwdTemp,String role) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        boolean flag = userServiceImpl.userLogin(realname, passwdTemp, role);
        modelAndView.addObject("flag", flag);
        modelAndView.addObject("role",role);
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/changePasswd")
    public ModelAndView changePasswd(String realname,String passwdold, String passwdnew, String role, String tablename) throws Exception{
        Boolean flag;
        boolean validateFlag;
        ModelAndView modelAndView = new ModelAndView();
        HashMap map = new HashMap<String,String>();
        map.put("realname","'"+realname+"'");
        map.put("passwd","'"+passwdnew+"'");
        map.put("tablename",tablename);
        validateFlag = userServiceImpl.userLogin(realname, passwdold, role);
        if(validateFlag){
            try {
                userServiceImpl.changePasswd(map);
                flag = true;
            }catch(Exception e){
                flag =false;
            }
        } else {
            flag = false;
        }
        modelAndView.addObject("flag",flag);
        modelAndView.setViewName("chpwdresult");
        return modelAndView;
    }
}
