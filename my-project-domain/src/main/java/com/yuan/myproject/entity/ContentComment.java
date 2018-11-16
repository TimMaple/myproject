package com.yuan.myproject.entity;

import com.yuan.myproject.persistence.BaseEntity;
import lombok.Data;

@Data
public class ContentComment extends BaseEntity {
    private User user;
    private Content content;
    private String text;
}
