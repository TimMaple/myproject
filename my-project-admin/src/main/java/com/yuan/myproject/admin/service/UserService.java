package com.yuan.myproject.admin.service;



import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseService;
import com.yuan.myproject.persistence.Result;

import java.util.List;

public interface UserService extends BaseService<User> {
    /**
     * 管理员登录
     * @param email
     * @param password
     * @return
     */

    Result login(String email, String password);
    /**
     * 删除多个id
     * @param ids
     */
    void deleteMutil( List ids);

    /**
     * 搜索黑名单
     * @return
     */
    List<User> getByBlackUser();





}
