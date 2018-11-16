package com.yuan.myproject.admin.controller;

import com.alibaba.fastjson.JSON;
import com.yuan.myproject.admin.service.ContentService;
import com.yuan.myproject.entity.Content;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webSupport.Page;
import com.yuan.myproject.webSupport.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * @Wise
 * @create 2018-10-29-17:06
 */
@Controller
@RequestMapping("/content")
public class ContentController extends BaseController<ContentService,Content> {
    /**
     * 分页回显
     * @param content
     * @param page
     * @param model
     * @param message
     * @return
     */
    @RequestMapping("list")
    public String contentList(Content content, Page page, Model model, @ModelAttribute("message")String message){
        content.setPage(page);
        Result result = service.pageList(content);
        model.addAttribute("list",((PageResult)result.getData()).getList());
        model.addAttribute("page",result.getData());
        model.addAttribute("content",content);
        model.addAttribute("message",message);
        return "content/list";
    }
    /**
     * 前往form，是否带参数过去
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/form")
    public String form(Long id, Model model) {
        if(id != null && id.longValue() > 0) {
            Content content = service.getById(id);
            String detail = service.getDetail(content.getText());
            model.addAttribute("content",content);
            model.addAttribute("detail",detail);
        }
        return "content/form";
    }

    /**
     * MultipartFile的属性file代表了上传那个表单域的name
     * @param dropFile
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String upload(MultipartFile dropFile, HttpServletResponse response) throws  Exception {
        response.setContentType("applicaion/json;charset=utf-8");   // 指定返回数据的类型为json
        // 获取原来的文件名
        String fileName = dropFile.getOriginalFilename();
        int index = fileName.lastIndexOf(".");
        String suffix = fileName.substring(index);
        fileName = UUID.randomUUID().toString().replaceAll("-","")+suffix;
        dropFile.transferTo(new File("d:/img/"+fileName));
        Map data = new HashMap();
        data.put("errno",0);
        data.put("data",new String[]{"/content/picShow?fileName="+fileName});
        data.put("path",fileName);
        return JSON.toJSONString(data);
    }

    /**
     * 用流的方式返回图片
     * @param fileName
     * @param response
     */
    @RequestMapping("/picShow")
    public void picShow(String fileName,HttpServletResponse response) {
        InputStream inputStream = null;
        try {
            // 添加contentType告诉浏览器返回的数据类型
            // 获取文件后缀
            int index = fileName.lastIndexOf(".");
            String suffix = fileName.substring(index+1);
            if ("jpg".equals(suffix)) {
                response.setContentType("image/jpeg");
            } else if ("png".equals(suffix)) {
                response.setContentType("image/png");
            }
            File file = new File("d:/img/"+fileName);
            inputStream = new FileInputStream(file);
            OutputStream outputStream = response.getOutputStream();
            byte[] buff = new byte[1024];
            int k = 0;  // 每次读完后返回读了多个字节
            while ((k = inputStream.read(buff)) > 0) {
                outputStream.write(buff,0,k);
            }

        } catch (Exception e) {
            e.printStackTrace();;
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 编辑的方法
     * @param content
     * @param redirectAttributes
     * @param model
     * @return
     */
    @RequestMapping("/edit")
    public String edit(Content content, RedirectAttributes redirectAttributes, Model model) {
        Result result = null;
        String string = null;
        if (content.getId() != null && content.getId().longValue() > 0) {
            result = service.update(content);
            string = "修改成功！！！";
        } else {
            result = service.save(content);
            string = "添加成功！！！";
        }
        if (result.getStatus() == Result.SUCCESS_STATUS) {
            redirectAttributes.addFlashAttribute("message", string);
            return "redirect:/content/list";
        } else {
            model.addAttribute("errorMessage",result.getMessage());
            return "content/form";
        }
    }

    /**
     * 删除的方法，传入id删除相应的数据
     * @param id
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Long id,RedirectAttributes redirectAttributes){
        service.delete(id);
        redirectAttributes.addFlashAttribute("message","删除内容成功！！！");
        return "redirect:/content/list";
    }

    /**
     * 批量删除内容
     * @param ids
     * @return
     */
    @RequestMapping("/deleteMutil")
    @ResponseBody
    public String deleteMutil(String ids) {
        if (ids != null) {
            String[] idArray = ids.split(",");
            List<String> list = new ArrayList<>();
            for (String s : idArray) {
                if (s != null && s.trim().length() > 0) {
                    list.add(s);
                }
            }
            service.deleteMutil(list);
        }

        return "success";
    }
}
