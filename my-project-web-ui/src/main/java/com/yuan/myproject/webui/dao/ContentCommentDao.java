package com.yuan.myproject.webui.dao;

import com.yuan.myproject.entity.ContentComment;
import com.yuan.myproject.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentCommentDao extends BaseDao<ContentComment> {

    Long getCount(@Param("contentId")Long contentId);

    ContentComment deleteUserIdAndId(ContentComment contentComment);
}
