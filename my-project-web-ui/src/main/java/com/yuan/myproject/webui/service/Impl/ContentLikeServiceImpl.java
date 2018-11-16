package com.yuan.myproject.webui.service.Impl;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.entity.ContentLike;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.webui.dao.ContentLikeDao;
import com.yuan.myproject.webui.service.ContentLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ContentLikeServiceImpl extends BaseServiceImpl<ContentLike,ContentLikeDao> implements ContentLikeService{

    @Autowired
    private ContentLikeDao contentLikeDao;


    @Override
    public Integer Count(ContentLike contentLike) {
        return contentLikeDao.Count(contentLike.getContentId().getId());
    }


    @Override
    public ContentLike getByUserIdAndContentId(ContentLike contentLike) {
        Date date = new Date();
        contentLike.setCreated(date);
        contentLike.setUpdated(date);
        ContentLike content = dao.getByUserIdAndContentId(contentLike);
        if (content == null){
            dao.save(contentLike);
            return content;
        }else{
            dao.delete(content.getId());
            return null;
        }
    }
}
