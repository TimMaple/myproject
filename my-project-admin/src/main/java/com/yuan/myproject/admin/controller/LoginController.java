package com.yuan.myproject.admin.controller;


import com.yuan.myproject.admin.service.UserService;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController extends BaseController<UserService, User> {

    /**
     * 首页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        System.out.println("index");
        return "index1";
    }
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginPage(){
        return "/user/login";
    }


    /**
     * 登录逻辑
     * @param email
     * @param password
     * @param model
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String email, String password, Model model, HttpSession session){
        Result result = service.login(email, password);
        if(Result.ERROR_STATUS==result.getStatus()){
            model.addAttribute("message",result.getMessage());
            return "/user/login";
        }else {
            //将user对象放到session里面
            session.setAttribute("user",result.getData());
            return "redirect:/index";
        }
    }



}
