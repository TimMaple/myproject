package com.yuan.myproject.utils;


import org.apache.commons.lang3.StringUtils;

/**
 * 用正则校验
 */
public class PattenUtil {
    /**
     * 邮件正则
     */
    public static final String EMAIL_PATTEN="^[0-9a-z]+\\w*@([0-9a-z]+\\.)+[0-9a-z]+$";
    /**
     * 电话号码校验
     */
    public static final String PHONE_PATTEN="^[1][3,4,5,7,8][0-9]{9}$";

    /**
     * 校验邮件地址是否合法
     * @param email
     * @return
     */
    public static boolean validateEmail(String email){
        if(StringUtils.isBlank(email)){
            return false;
        }
        //matches 方法：传正则进行校验，如果符合正则，返回true，否则返回false
        return email.matches(EMAIL_PATTEN);
    }

    /**
     * 校验电话号码是否合法
     * @param phone
     * @return
     */
    public static boolean validatePhone(String phone){
        if(StringUtils.isBlank(phone)){
            return false;
        }
        //matches 方法：传正则进行校验，如果符合正则，返回true，否则返回false
        return phone.matches(PHONE_PATTEN);
    }


}
