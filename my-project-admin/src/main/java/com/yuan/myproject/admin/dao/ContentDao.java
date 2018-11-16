package com.yuan.myproject.admin.dao;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Wise
 * @create 2018-10-29-14:45
 */
@Repository
public interface ContentDao extends BaseDao<Content> {
    /**
     * 传入多个id，进行批量删除
     * @param ids
     */
    void deleteMutil(@Param("ids") List ids);
}
