package com.yuan.myproject.admin.service.impl;


import com.yuan.myproject.admin.dao.UserDao;
import com.yuan.myproject.admin.service.UserService;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.utils.BeanValidator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<User,UserDao> implements UserService {


    /**
     * 登录操作
     * @param email
     * @param password
     * @return
     */
    @Override
    public Result login(String email, String password) {

        if(StringUtils.isBlank(password)){
            return Result.fail("密码不能为空!");
        }
        password=DigestUtils.md5DigestAsHex(password.getBytes());
        User user=dao.getByEmailAndPassword(email,password);
        if(user!=null&&"admin@qq.com".equals(user.getEmail())){
            return Result.success("",user);
        }
        return Result.fail("账号或密码错误！");
    }

    /**
     * 保存
     *
     * @param user
     * @return
     */
    @Override
    @Transactional
    public Result save(User user) {
        //先校验
        //如果BeanValidator.validator返回空，那么校验通过，否则校验不通过
       String message= BeanValidator.validator(user);
       //如果message不为空，是不是非法
        if(StringUtils.isNotBlank(message)){
            //Result.fail 失败
            return Result.fail(message);
        }

        //加密码加密的逻辑
        if(StringUtils.isNotBlank(user.getPassword())){
            user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        }
        return super.save(user);
    }

    /**
     * 删除多个id
     *
     * @param ids
     */
    @Override
    @Transactional
    public void deleteMutil(List ids) {
        dao.deleteMutil(ids);
    }
    /**
     * 搜索黑名单
     * @return
     */
    @Override
    public List<User> getByBlackUser() {
        return dao.getByBlackUser();
    }

}
