package com.yuan.myproject.webui.service.Impl;

import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseServiceImpl;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.dao.ContentDao;
import com.yuan.myproject.webui.service.ContentService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ContentServiceImpl extends BaseServiceImpl<Content, ContentDao> implements ContentService {


    @Autowired
    private ContentDao contentDao;

    @Override
    public String textProcessor(Content content,String text) {
        FileWriter writer;
        String fileName =null;
        if(text!=null){
            //修改
            fileName = text;
        }else {
            //添加
            fileName  =  UUID.randomUUID().toString()+"_"+content.getAuthor()+".txt";
        }

        try {
            FileUtils.write(new File("d:/text/"+fileName),content.getText(),"utf-8",false);
        } catch (IOException e) {
            e.printStackTrace();
        }
//        把文件名放入到 content 的text中
//        content.setText(fileName);
            return fileName;
    }

    @Override
    public Content setText(Content content) {
        String name = content.getText();
        try {
//            把文件的内容读出来 放到 content的text中
            String str = FileUtils.readFileToString(new File("d:/text/"+name), "utf-8");
            content.setText(str);
//            System.out.println(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content;
    }
    @Override
    public Result<Content> getByParentId(Long id) {
        List<Content> list = contentDao.getByParentId(id);
        if(list!=null && !list.isEmpty()){
            return Result.success(null,list);
        }else{
            return Result.fail("抱歉,该目录下还没有内容!!");
        }
    }

    @Override
    public Result<Content> getTop() {
        List<Content> list = contentDao.getTop();
        if(list!=null && !list.isEmpty()){
            return Result.success(null,list);
        }else{
            return Result.fail("请添加内容!!");
        }
    }



}
