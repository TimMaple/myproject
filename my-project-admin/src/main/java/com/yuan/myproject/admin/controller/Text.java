package com.yuan.myproject.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Text {
    @RequestMapping("")
    public String index(){
        System.out.println("index");
        return "user/login";
    }
}
