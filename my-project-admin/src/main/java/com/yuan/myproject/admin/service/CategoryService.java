package com.yuan.myproject.admin.service;


import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseService;

import java.util.List;

public interface CategoryService extends BaseService<Category> {
    List<Category> queryChildrenCategory(Long id);

    /**
     * 查询树表
     * @return
     */
    List<Category> queryTreeTable();


}
