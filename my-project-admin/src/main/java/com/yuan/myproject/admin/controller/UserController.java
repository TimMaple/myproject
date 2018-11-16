package com.yuan.myproject.admin.controller;

import com.yuan.myproject.admin.service.UserService;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webSupport.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController<UserService, User> {


    /**
     * 跳转用户黑名单
     * @return
     */
    @RequestMapping("/blacklist")
    public String blacklist(Model model){
        List<User> list = service.getByBlackUser();
        model.addAttribute("list",list);
        return "user/blacklist";
    }


    /**
     * 跳转用户列表单
     * @param user
     * @param page
     * @param model
     * @param messsage
     * @return
     */
    @RequestMapping("/list")
    public String userlist(User user, Page page, Model model, @ModelAttribute("message")String messsage){
        user.setPage(page);

        Result result=service.pageList(user);

        model.addAttribute("message",messsage);
        model.addAttribute("result",result);
        model.addAttribute("user",user);
        return "user/list";
    }

    /**
     * 跳转编辑用户的表单
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/form")
    public String userForm(Long id,Model model){
        User user=service.getById(id);
        model.addAttribute("user1",user);
        return "/user/form";
    }

    /**
     * 编辑用户
     * @param user
     * @param redirectAttributes
     * @param model
     * @return
     */
    @RequestMapping("/edit")
    public String userEdit(User user, RedirectAttributes redirectAttributes, Model model){
        Result result=null;
        //修改用户
        if(user.getId()!=null && user.getId().longValue()>0){
            result=service.update(user);
        }else {
            //新增用户
            result=service.save(user);
        }
        if(result.getStatus()==Result.ERROR_STATUS){
            model.addAttribute("errorMessage",result.getMessage());
            return "/user/form";
        }
        redirectAttributes.addFlashAttribute("message","编辑用户成功！！");
        return "redirect:/user/list";
    }

    /**
     * 删除操作
     * @param id
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/delete")
    public String deleteUser(Long id, RedirectAttributes redirectAttributes,Model model){
        service.delete(id);
        redirectAttributes.addFlashAttribute("message","删除用户成功！");
        //返回用户列表
        return "redirect:/user/list";
    }

    @RequestMapping("/deleteMutil")
    @ResponseBody
    public String deleteMutil(String ids,Model model){
        if(ids!=null) {
            String[] idArray = ids.split(",");
            List<String> list=new ArrayList<>();
            for(String s:idArray){
                if(s!=null && s.trim().length()>0) {
                    list.add(s);
                }
            }
            service.deleteMutil(list);

        }
        return "success";
    }
}