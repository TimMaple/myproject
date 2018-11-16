package com.yuan.myproject.webui.controller;

import com.yuan.myproject.entity.ContentComment;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.service.ContentCommentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value="/contentComment")
public class ContentCommentController extends BaseController<ContentCommentService,ContentComment> {

    /**
     * 添加评论
     * @param contentComment
     * @param model
     * @return
     */
    @RequestMapping(value="getSaveComment")
    public String getSaveComment(ContentComment contentComment, Model model){
        System.out.println(contentComment.getContent().getId());
        service.save(contentComment);
        model.addAttribute("message","添加成功");
        return "redirect:/content/getById?id="+contentComment.getContent().getId();
    }

    /**
     * 删除评论
     * @param
     * @param model
     * @return
     */
    @RequestMapping(value = "getDeleteComment")
    public String getDeleteComment(ContentComment contentComment,Model model){
        service.deleteUserIdAndId(contentComment);
        model.addAttribute("message","删除成功");
        return "";
    }

    /**
     * 展示评论内容
     * @param contentComment
     * @param model
     * @return
     */
    @RequestMapping(value = "findList")
    public String findList(ContentComment contentComment,Model model){
        Result result = service.findList(contentComment);
        model.addAttribute("result",result);
        return "";
    }

    /**
     * 根据文章id查询评论条数
     * @param contentComment
     * @param model
     * @return
     */
    @RequestMapping(value = "getCount")
    public String getCount(ContentComment contentComment,Model model){
        Long commentCount = service.getCount(contentComment);
        model.addAttribute("commentCount",commentCount);
        return "";
    }
}
