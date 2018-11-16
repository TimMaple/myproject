package com.yuan.myproject.webui.service.Impl;


import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.utils.BeanValidator;
import com.yuan.myproject.webui.dao.UserDao;
import com.yuan.myproject.webui.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;


@Service
public class UserServiceImpl extends BaseServiceImpl<User,UserDao> implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public Result login(User user) {
        if(StringUtils.isNotBlank(user.getUserName()) && StringUtils.isNotBlank(user.getPassword())){
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
            User user1 = userDao.getUserByUsernameAndPassword(user);
            Result result=null;
            if(user1!=null){
                result=Result.success(null,user1);
            }else{
                result=Result.fail("用户名或者密码错误!!");
            }
            return result;
        }else{
            return Result.fail("用户名或者密码为空!!");
        }

    }

    @Override
    public Result register(User user) {

        String msg = BeanValidator.validator(user);
        if(StringUtils.isBlank(msg)){
            String str = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            user.setPassword(str);
            Result result = super.save(user);
            if(result.getMessage()!=null && !"".equals(result.getMessage())){
                result.setMessage("用户名,邮箱或者电话号码已存在!!");
            }
           return result;
        }else{
            return Result.fail(msg);
        }

    }

}
