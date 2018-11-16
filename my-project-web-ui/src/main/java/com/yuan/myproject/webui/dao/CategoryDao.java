package com.yuan.myproject.webui.dao;

import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDao extends BaseDao<Category> {

    List<Category> getByParentId(Long id);

    /**
     * 通过id加载它下面的子节点的数组
     * @param id
     * @return
     */
    List<Category> queryChildrenCategory(@Param("id") Long id);
}
