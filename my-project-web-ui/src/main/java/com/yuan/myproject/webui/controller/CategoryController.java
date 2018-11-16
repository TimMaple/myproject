package com.yuan.myproject.webui.controller;

import com.alibaba.fastjson.JSON;
import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 用户获取栏目分类
 */

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;


    /**
     * 获取所有category
     * @param category
     * @param model
     * @return
     */
    @RequestMapping("/getCategoryList")
    public String getCategoryList(Category category, Model model){
        Result result = categoryService.findList(category);
        if(result.getStatus()==Result.SUCCESS_STATUS){
            model.addAttribute("result",result);
            return "index";
        }else{
            result.setMessage("不好意思,系统出现错误了,请重试!1");
            model.addAttribute("result",result);
            return "index";
        }
     }

    /**
     * 添加或修改的树形结构展示
     * @param id
     * @return
     */
    @RequestMapping(value = "/treeData",produces ="application/json;charset=utf-8" )
    @ResponseBody
    public String treeData(Long id){
        System.out.println("dasdas");
        if(id==null){
            id=0L;
        }
        List<Category> list=categoryService.queryChildrenCategory(id);
        return JSON.toJSONString(list);
    }


    /**
     * 根据父类id获取子类category
     * @param category
     * @param model
     * @return
     */
     @RequestMapping("/getCategoryByParentId")
    public String getByParentId(Category category,Model model){
         Result result = categoryService.getByParentId(category.getId());
         if(result.getStatus()==Result.SUCCESS_STATUS){
             model.addAttribute("result",result);
             return "index";
         }else{
             model.addAttribute("result",result);
             return "index";
         }
     }


    /**
     * 根据iD获取分类详情
     * @param category
     * @param model
     * @return
     */

    @RequestMapping("/getById")
    public String getById(Category category,Model model){
        Category category1 = categoryService.getById(category.getId());
        if(category1!=null){
            Result result = Result.success(null, category1);
            model.addAttribute("result",result);
            return "";

        }else{
            Result result = Result.fail("该分类不存在!!");
            model.addAttribute("result",result);
            return "";
        }
    }

    /**
     * 使用ajax获取到子目录
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="/getByParentIdAjax",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getByParentIdAjax(Long id,Model model){
        Result result = categoryService.getByParentId(id);
        List<Category> list= ( List<Category>)result.getData();
        String str = JSON.toJSONString(list);
        return str;
    }
}
