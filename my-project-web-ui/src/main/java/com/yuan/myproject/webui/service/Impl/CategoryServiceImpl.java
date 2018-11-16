package com.yuan.myproject.webui.service.Impl;

import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.dao.CategoryDao;
import com.yuan.myproject.webui.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl extends BaseServiceImpl<Category, CategoryDao> implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    public Result<Category> getByParentId(Long id){
        List<Category> list = categoryDao.getByParentId(id);
        if(list!=null && !list.isEmpty()){
            return Result.success(null,list);
        }else{
            return Result.fail("查询子目录失败");
        }
    }

    @Override
    public List<Category> queryChildrenCategory(Long id) {
        return dao.queryChildrenCategory(id);
    }
}
