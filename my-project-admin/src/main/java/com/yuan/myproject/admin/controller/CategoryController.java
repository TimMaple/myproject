package com.yuan.myproject.admin.controller;

import com.alibaba.fastjson.JSON;
import com.yuan.myproject.admin.dao.CategoryDao;
import com.yuan.myproject.admin.service.CategoryService;
import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController<CategoryService,Category> {
    @Autowired
    private CategoryDao categoryDao;

    /**
     * 修改或添加
     * @param category
     * @return
     */
    @RequestMapping("/edit")
    public String from(Category category, RedirectAttributes redirectAttributes, Model model){
        Result result=null;
        if(category.getParent().getName() == ""){
            redirectAttributes.addFlashAttribute("message","请选择父节点");
            return "redirect:/category/form";
        }else if(category.getName() == ""){
            redirectAttributes.addFlashAttribute("message","请填写类名");
            return "redirect:/category/form";
        }
        if(category.getId()!=null && category.getId().longValue()>0){
            result = service.update(category);
        }else {
            result = service.save(category);
        }
        if(result.getStatus() == Result.SUCCESS_STATUS){
            redirectAttributes.addFlashAttribute("message","编辑成功！");
            return "redirect:/category/list";
        }else{
            redirectAttributes.addFlashAttribute("message",result.getMessage());
            return "redirect:/category/form";
        }
    }
    /**
     * 编辑中间站
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/form")
    public String form(Long id,Model model){
        if(id!=null && id.longValue()>0){
            Category category=service.getById(id);
            model.addAttribute("category",category);
        }
        return "category/form";
    }

    /**
     * 内容列表展示
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model){
        List<Category> getlist = service.queryTreeTable();
        model.addAttribute("list",getlist);
        return "category/list";
    }

    /**
     * 添加或修改的树形结构展示
     * @param id
     * @return
     */
    @RequestMapping(value = "/treeData",produces ="application/json;charset=utf-8" )
    @ResponseBody
    public String treeData(Long id){
        if(id==null){
            id=0L;
        }
        List<Category> list=service.queryChildrenCategory(id);
        return JSON.toJSONString(list);
    }

    /**
     * 添加字节点
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/toAddSubNode")
    public String toAddSubNode(Long id,Model model){
//        把接收到的id 作为父类id
        Category parent = service.getById(id);
        Category category = new Category();
        category.setParent(parent);
        model.addAttribute("category",category);
//        传到添加页面 把父类id 传过去
        return "category/form";
    }

    /**
     * 删除
     * @param id
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Long id,RedirectAttributes redirectAttributes){
        Result result=service.delete(id);
        if(result.getStatus()== Result.ERROR_STATUS){
            redirectAttributes.addFlashAttribute("message",result.getMessage());
        }else {
            redirectAttributes.addFlashAttribute("message","删除成功！");
        }
        return "redirect:/category/list";
    }
}
