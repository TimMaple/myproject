package com.yuan.myproject.entity;


import com.yuan.myproject.persistence.BaseEntity;
import lombok.Data;

@Data
public class Category extends BaseEntity {

    private String name;
    /**
     * 父节点
     */
    private Category parent;

    private Integer order;

    private Integer isParent;


}
