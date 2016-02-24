package cn.online.ssm.controller;

import cn.online.ssm.service.impl.UserService;
import org.apache.tomcat.util.bcel.classfile.Method;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by hezw on 2016/2/22.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value="login",method = RequestMethod.POST)
    String login() throws Exception{
        String passwd = userService.stuLogin("xiaoming");
        return "login";
    }
}
