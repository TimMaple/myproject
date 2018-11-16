package com.yuan.myproject.webui.dao;


import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends BaseDao<User> {

     User getUserByUsernameAndPassword(User user);

}
