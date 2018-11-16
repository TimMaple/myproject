package com.yuan.myproject.entity;
import com.yuan.myproject.persistence.BaseEntity;
import com.yuan.myproject.utils.PattenUtil;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Pattern;

@Data
public class User extends BaseEntity {

    @Pattern(regexp = PattenUtil.EMAIL_PATTEN,message = "邮件地址格式不合法")
    private String email;
    @Length(max = 10,min = 3,message = "用户名必须在3个到10之内")
    private String userName;
    @Length(max = 20,min =6,message = "密码必须在6个到20之内")
    private String password;
    @Pattern(regexp = PattenUtil.PHONE_PATTEN,message = "电话号码格式不合法")
    private String phone;



}
