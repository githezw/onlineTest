package cn.online.ssm.controller;

import cn.online.ssm.service.impl.UserService;
import cn.online.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


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
}
