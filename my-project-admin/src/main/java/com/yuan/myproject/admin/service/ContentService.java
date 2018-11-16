package com.yuan.myproject.admin.service;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseService;

import java.util.List;

/**
 * @Wise
 * @create 2018-10-29-14:46
 */
public interface ContentService extends BaseService<Content> {
    void deleteMutil(List ids);
    String getDetail(String text);
}
