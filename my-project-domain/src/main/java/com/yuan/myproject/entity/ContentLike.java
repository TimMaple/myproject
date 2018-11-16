package com.yuan.myproject.entity;

import com.yuan.myproject.persistence.BaseEntity;
import lombok.Data;

@Data
public class ContentLike extends BaseEntity {
    private User userId;
    private Content contentId;
}
