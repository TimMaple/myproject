package com.yuan.myproject.entity;

import com.yuan.myproject.persistence.BaseEntity;
import lombok.Data;

/**
 * 内容实体类
 */
@Data
public class Content extends BaseEntity {

    /**
     * 父类别
     */
    private Category parent;
    /**
     * 作者
     */
    private String author;
    /**
     * 标题
     */
    private String title;
    /**
     * 子标题
     */
    private String subTitle;


    /**
     * 链接
     */
    private String url;
    /**
     * 图片1
     */
    private String pic1;

    /**
     * 图片2
     */
    private String pic2;
    /**
     * 图片2
     */
    private String pic3;
    /**
     * 内容详情
     */
    private String text;






}
