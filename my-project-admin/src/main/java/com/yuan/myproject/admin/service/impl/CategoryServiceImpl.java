package com.yuan.myproject.admin.service.impl;

import com.yuan.myproject.admin.dao.CategoryDao;
import com.yuan.myproject.admin.service.CategoryService;
import com.yuan.myproject.entity.Category;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl extends BaseServiceImpl<Category,CategoryDao> implements CategoryService {
    @Override
    public List<Category> queryChildrenCategory(Long id) {
        return dao.queryChildrenCategory(id);
    }

    @Override
    public List<Category> queryTreeTable() {
        List<Category> list = dao.queryTreeTable();
//        先拿最顶层的  设最顶层的为空
        Category root = null;
        for (Category c:list) {
            if (c.getParent().getId().longValue() == 0) {
                root = c;
            }
        }
//        执行递归操作  把所有子节点 都放在父节点下面
        List<Category> list1 = addCategory(list,root);
        return list1;
    }

    /**
     * 递归方法 将集合 还有 顶部元素放到递归中
     * @param list
     * @param category
     * @return
     */
    private  List<Category> addCategory(List<Category> list, Category category){
        List<Category> taget = new ArrayList<>();
        taget.add(category);
        for (Category c:
             list) {
//            如果该节点的父节点的id == 该节点的id  就遍历该节点的子节点
            if(c.getParent().getId().longValue() == category.getId().longValue()){
                List<Category> categoryList = addCategory(list,c);
                taget.addAll(categoryList);
            }
        }
        return taget;
    }

    /**
     * 更新
     * @param category
     * @return
     */
    @Override
    public Result update(Category category) {
//        将传过来的category的内容记录下来 (下面要用到category)
        Category old = dao.getById(category.getId());
//        把传过来的category 的父类id设为 1
        dao.setIsParentTrue(category.getParent().getId());
//        更新传过来的category
        Result result = super.update(category);
//        查询原来的 category 父id 是否有子节点
        List<Category> categoryList = dao.queryChildrenCategory(old.getParent().getId());
//        判断是否为空 为空则设置 父id 为0
        if(categoryList.isEmpty()){
            dao.setIsParentFalse(old.getParent().getId());
        }
        return result;
    }

    /**
     * 添加
     * @param category
     * @return
     */
    @Override
    public Result save(Category category) {
        dao.setIsParentTrue(category.getParent().getId());
        return super.save(category);
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    public Result delete(Long id) {
//        根据id 获取查询记录
        Category categpry = dao.getById(id);
//        查询是否是父节点
        Result result = null;
        try {
            if (categpry.getIsParent() == 1) {
                return  Result.fail("不能删除父节点");
            }
            result = super.delete(id);
            List<Category> categoryList = dao.queryChildrenCategory(categpry.getParent().getId());
//        判断新的父节点是否为空 如果为空的就给新父节点 isparent 赋值为0
            if (categoryList.isEmpty()) {
                dao.setIsParentFalse(categpry.getParent().getId());
            }
        } catch (Exception e) {
            return  Result.fail("操作失败");
        }
        return result;
    }
}
