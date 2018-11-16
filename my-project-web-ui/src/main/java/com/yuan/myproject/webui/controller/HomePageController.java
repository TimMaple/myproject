package com.yuan.myproject.webui.controller;

import com.yuan.myproject.entity.Category;
import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.service.CategoryService;
import com.yuan.myproject.webui.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/homePage")
public class HomePageController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ContentService contentService;

    @RequestMapping("/getData")
    public String getData( Model model){
        //栏目分类--父类
        Category category = new Category();//所有分类
        category.setIsParent(1);
        Result result = categoryService.findList(category);
        List<Category> categoryList = (List<Category>) result.getData();




        //轮播图--子类
        Result<Content> result7 = contentService.getByParentId(24L);
        List<Content> lunboList = (List<Content>)result7 .getData();


        //点赞数前五
        Result<Content> result6 = contentService.getTop();
        List<Content> topList = (List<Content>)result6.getData();

        //全部文章
        Result result8 = contentService.findList(new Content());
        List<Content> allList = (List<Content>)result8.getData();




        model.addAttribute("categoryList",categoryList);
        model.addAttribute("lunboList",lunboList);
        model.addAttribute("topList",topList);
        model.addAttribute("allList",allList);

        return "index";


    }

}


