package com.yuan.myproject.admin.dao;


import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDao extends BaseDao<Category> {
    List<Category> getlist();
    /**
     * 通过id加载它下面的子节点的数组
     * @param id
     * @return
     */
    List<Category> queryChildrenCategory(@Param("id") Long id);

    /**
     * 查询树表
     * @return
     */
    List<Category> queryTreeTable();

    /**
     * 设置不是父节点    0
     */
    void setIsParentFalse(@Param("id") Long id);

    /**
     * 设置是父节点     1
     */

    void setIsParentTrue(@Param("id") Long id);
}
