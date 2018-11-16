package com.yuan.myproject.webui.service;


import com.yuan.myproject.entity.ContentLike;
import com.yuan.myproject.persistence.BaseService;


public interface ContentLikeService extends BaseService<ContentLike> {
    Integer Count(ContentLike contentLike);

    ContentLike getByUserIdAndContentId(ContentLike contentLike);
}
