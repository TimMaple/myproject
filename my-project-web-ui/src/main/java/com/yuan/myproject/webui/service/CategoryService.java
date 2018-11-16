package com.yuan.myproject.webui.service;

import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseService;
import com.yuan.myproject.persistence.Result;

import java.util.List;

public interface CategoryService extends BaseService<Category> {

    Result getByParentId(Long id);

    List<Category> queryChildrenCategory(Long id);

}


