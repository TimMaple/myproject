package com.yuan.myproject.webui.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController< UserService,User> {

    @Autowired
    private UserService userService;

    @Autowired
    private Producer captchaProducer;


    @RequestMapping("/getRegister")
    public String getRegister(){
        return "register";
    }

    @RequestMapping("/getLogin")
    public String getLogin(){
        return "login";
    }


    /**
     * 登录
     * @param user
     * @param vCode
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(User user,String vCode,  Model model, HttpSession session){
        String vCode1 = (String) session.getAttribute("KAPTCHA_SESSION_KEY");
        if(!vCode.equals(vCode1)){
            Result result = Result.fail("验证码输入错误!!!");
            model.addAttribute("result",result);
            return "login";
        }
        Result result = userService.login(user);
        if(result.getStatus()==Result.SUCCESS_STATUS){
            session.setAttribute("frontUser",result.getData());
            model.addAttribute("result",result);
            return "redirect:/homePage/getData";
        }else{
            model.addAttribute("result",result);
            return "login";
        }

    }

    @RequestMapping(value="/logout")
    public String logout(HttpSession session){
        session.setAttribute("frontUser",null);
        return "login";
    }

    /**
     * 注册
     * @param user
     * @param confirmPassword
     * @param model
     * @return
     */
    @RequestMapping("/register")
    public String register(User user,String confirmPassword,Model model){
        System.out.println("dasdas");
        if(!confirmPassword.equals(user.getPassword())){
            Result result = Result.fail("两次密码输入不一致!!");
            model.addAttribute("result",result);
            return "register";
        }
        Result result = userService.register(user);
        if(result.getStatus()==Result.SUCCESS_STATUS){
            model.addAttribute("result",result);
            return "login";
        }else{
            model.addAttribute("result",result);
            return "register";
        }
    }

    /**
     * 获取到用户详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getUserById")
    public String getUserById(Long id,Model model){
        User user = userService.getById(id);
        if(user!=null){
            Result result = Result.success("", user);
            model.addAttribute("result",result);
            return "inform";
        }else{
            Result result = Result.fail("该用户不存在!!!");
            model.addAttribute("result",result);
            return "index";
        }
    }

    /**
     * 更新
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user,Model model,HttpSession session){
        Result result = userService.update(user);
        if(result.getStatus()==Result.SUCCESS_STATUS){
            result.setMessage("更新成功!!");
            model.addAttribute("result",result);
            session.setAttribute("frontUser",user);
            return "redirect:/homePage/getData";
        }else{
            result.setMessage("更新失败!!");
            result.setData(user);
            model.addAttribute("result",result);
            return "inform";
        }
    }

    /**
     * 验证码
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value="/getKaptcha")
    @ResponseBody
    public void getKaptcha(HttpServletRequest request, HttpServletResponse response)throws Exception{
        HttpSession session = request.getSession();
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        //设置格式
        response.setContentType("image/jpeg");
        //生成验证码
        String capText = captchaProducer.createText();
        //存入session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        //向客户端写出
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = null;
        out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        }  finally {
            out.close();
        }

    }



}
