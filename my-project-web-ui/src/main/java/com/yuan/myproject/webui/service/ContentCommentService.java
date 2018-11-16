package com.yuan.myproject.webui.service;

import com.yuan.myproject.entity.ContentComment;
import com.yuan.myproject.persistence.BaseService;

public interface ContentCommentService extends BaseService<ContentComment> {

    Long getCount(ContentComment contentComment);

    ContentComment deleteUserIdAndId(ContentComment contentComment);
}
