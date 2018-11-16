package com.yuan.myproject.webui.controller;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.entity.ContentLike;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.webui.service.ContentLikeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/contentLike")
public class ContentLikeController extends BaseController<ContentLikeService,ContentLike> {

    @RequestMapping(value = "/getCount")
    public String getCount(ContentLike contentLike,Model model){
        int num = service.Count(contentLike);
        model.addAttribute("num",num);
        return "";
    }

    @RequestMapping(value = "/getExdi",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getExdi(Long userId, Long contentId,Model model){
        ContentLike contentLike = new ContentLike();
        User user = new User();
        user.setId(userId);
        Content content = new Content();
        content.setId(contentId);
        contentLike.setUserId(user);
        contentLike.setContentId(content);
        service.getByUserIdAndContentId(contentLike);
        return "hhhahaah";
    }

}
