package com.yuan.myproject.webui.service;


import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseService;
import com.yuan.myproject.persistence.Result;

public interface UserService extends BaseService<User> {

    Result login(User user);

    Result register(User user);
}
