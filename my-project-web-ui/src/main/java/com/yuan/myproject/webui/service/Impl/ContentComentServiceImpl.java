package com.yuan.myproject.webui.service.Impl;

import com.yuan.myproject.entity.ContentComment;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.dao.ContentCommentDao;
import com.yuan.myproject.webui.service.ContentCommentService;
import org.springframework.stereotype.Service;

@Service
public class ContentComentServiceImpl extends BaseServiceImpl<ContentComment,ContentCommentDao> implements ContentCommentService {
    @Override
    public Long getCount(ContentComment contentComment) {
//        return dao.getCount(contentComment.getContentId().getId());
    return null;
    }


    @Override
    public ContentComment deleteUserIdAndId(ContentComment contentComment) {
        return dao.deleteUserIdAndId(contentComment);
    }
}
