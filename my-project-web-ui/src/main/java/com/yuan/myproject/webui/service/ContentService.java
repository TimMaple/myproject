package com.yuan.myproject.webui.service;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseService;
import com.yuan.myproject.persistence.Result;

public interface ContentService extends BaseService<Content> {
    Result<Content> getByParentId(Long id);

    Result<Content> getTop();

    /**
     * 发表文章 把文件读取到txt 文本中  jiede  返回路径    把文件名放入到 content 的text中
     * @return
     */
    String textProcessor(Content content, String text);

    /**
     * 回显  jiede
     * @param content
     * @return
     */
    Content setText(Content content);


}
