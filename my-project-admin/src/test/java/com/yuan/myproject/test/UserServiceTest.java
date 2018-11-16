package com.yuan.myproject.test;

import com.yuan.myproject.admin.dao.UserDao;
import com.yuan.myproject.admin.service.UserService;
import com.yuan.myproject.entity.User;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webSupport.Page;
import com.yuan.myproject.webSupport.PageResult;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class UserServiceTest {
    @Autowired
    private UserService userService;
    @Test
    public void testLogin() {
        Result result = userService.login("aa@qq.com", "123456");
        System.out.println(result.getMessage());
    }
    @Test
    public void testSaveUser(){
        User user=new User();
        user.setEmail("admin@qq.com");
        user.setUserName("lppp");
        user.setPhone("13278766789");
        user.setPassword("123456");
        userService.save(user);
    }
    @Test
    public void testGetById(){
        Long id=3L;
        User user = userService.getById(id);
        System.out.println(user);

    }

    @Test
    public void testDeleteById(){
        List list=new ArrayList();
        list.add(3l);
        userService.deleteMutil(list);

    }

    @Test
    public void testPageList(){
        User user=new User();
        user.setEmail("aa");
        Page page=new Page();
        page.setCurrent(1);
        page.setPageSize(10);
        user.setPage(page);
        Result result=userService.pageList(user);
        PageResult pageResult =(PageResult) result.getData();
        List<User> list=pageResult.getList();
        System.out.println(list);

    }

    @Test
    public void testUserList(){
        User query=new User();
        query.setEmail("aa");
        Result result =userService.findList(query);
        System.out.println(result);
        Assert.assertEquals(((List)result.getData()).size(),0);
    }
}
