package com.yuan.myproject.webui.dao;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.entity.ContentLike;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ContentLikeDao extends BaseDao<ContentLike> {
    /**
     * 查询点赞条数
     * @param
     * @return
     */
    Integer Count(@Param("contentId")Long contentId);

    /**
     * 取消点赞
     * @param userId
     * @param contentId
     * @return
     */
    Integer deleteId(@Param("userId")Long userId,@Param("contentId") Long contentId);

    ContentLike getByUserIdAndContentId(ContentLike contentLike);
}
