package com.yuan.myproject.webui.dao;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentDao extends BaseDao<Content> {
    List<Content> getByParentId(Long id);

    List<Content> getTop();

}
