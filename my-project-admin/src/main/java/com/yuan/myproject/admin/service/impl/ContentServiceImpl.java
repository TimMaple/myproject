package com.yuan.myproject.admin.service.impl;

import com.yuan.myproject.admin.dao.ContentDao;
import com.yuan.myproject.admin.service.ContentService;
import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @Wise
 * @create 2018-10-29-14:46
 */
@Service
public class ContentServiceImpl extends BaseServiceImpl<Content,ContentDao> implements ContentService {
    @Override
    @Transactional
    public void deleteMutil(List ids) {
        dao.deleteMutil(ids);
    }

    /**
     * 保存
     *
     * @param content
     * @return
     */
    @Override
    public Result save(Content content) {
        Content nweContent = fileTxt(content);
        return super.save(nweContent);
    }

    @Override
    public Result update(Content content) {
        Content newContent = fileTxt(content);
        return super.update(newContent);
    }

    /**
     * 保存进详细内容进入txt的方法
     * @param content
     * @return
     */
    private Content fileTxt(Content content){
        // 文件名，通过UUID来定义文件名
        String fileName = null;
        // 进行id判断，看是否为修改功能
        if (content.getId() != null && content.getId() .longValue() > 0) {
            // 读取数据库中原来的content对象
            Content oldContent = dao.getById(content.getId());
            // 使用原来的UUID
            fileName = oldContent.getText();
        } else {
            // 这里为新增功能，直接通过UUID生成随机文件名
            fileName = UUID.randomUUID().toString().replaceAll("-", "") + ".txt";
        }
        // 读取前端传过来text的内容
        String detail = content.getText();
        try {
            // 使用FileUtils工具类，是common.io.maven的jar中的工具类，写入方法，保存在本机D:/text文件夹里面
            FileUtils.write(new File("D:/text/"+fileName),detail,"utf-8",false);
            // 设置content的文件名为UUID，替换前端传过来的内容
            content.setText(fileName);
            // 返回处理过的content
            return content;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据文件名读取详细内容
     * @param text
     * @return
     */
    @Override
    public String getDetail(String text){
        String detail = null;
        try {
            detail = FileUtils.readFileToString(new File("D:/text/"+text), "utf-8");
            return detail;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
