package com.yuan.myproject.admin.dao;


import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao extends BaseDao<User>{

    User getByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    /**
     * 删除多个id
     * @param ids
     */
    void deleteMutil(@Param("ids") List ids);

    /**
     * 搜索黑名单
     * @return
     */
     List<User> getByBlackUser();


}
