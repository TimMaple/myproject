package com.yuan.myproject.webui.controller;


import com.alibaba.fastjson.JSON;
import com.yuan.myproject.entity.*;
import com.yuan.myproject.persistence.BaseController;
import com.yuan.myproject.persistence.Result;
import com.yuan.myproject.webui.service.CategoryService;
import com.yuan.myproject.webui.service.ContentCommentService;
import com.yuan.myproject.webui.service.ContentLikeService;
import com.yuan.myproject.webui.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/content")
public class ContentController extends BaseController<ContentService,Content> {

    @Autowired
    private ContentService contentService;
    @Autowired
    private ContentCommentService contentCommentService;
    @Autowired
    private ContentLikeService contentLikeService;
    @Autowired
    private CategoryService categoryService;


    /**
     * 根据父类id获取子类所有内容,用于contents展示统一分类下所有内容
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getByParentId")
    public String getByParentId(@RequestParam("id") Long id, Model model) {
        Result<Content> result = contentService.getByParentId(id);
        Category category = categoryService.getById(id);
        if (result.getStatus() == Result.SUCCESS_STATUS) {
            model.addAttribute("result", result);
            model.addAttribute("category",category);
            return "contents";
        } else {
            model.addAttribute("category",category);
            model.addAttribute("result", result);
            return "contents";
        }
    }

    /**
     * 返回整个airticle页面的请求处理
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getById")
    public String getById(@RequestParam("id") Long id, Model model) {

        //获取content
        Content content = contentService.getById(id);
        if (content != null) {
            model.addAttribute("content", content);
        } else {
            model.addAttribute("errorMessage", "获取内容失败!!");
        }


        /**
         * 获取file
         */
        FileInputStream is = null;
        StringBuffer sb = null;
        try {
            is = new FileInputStream(new File("d:/text/"+content.getText()));
            sb = new StringBuffer();
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = is.read(buf)) > 0) {
                sb.append(new String(buf, 0, len,"utf-8"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (sb != null) {
            model.addAttribute("contentFile", sb.toString());
        } else {
            model.addAttribute("msg", "抱歉,内容丢失了!");
        }
//  评论总数
        ContentComment contentComment = new ContentComment();
        contentComment.setContent(content);
        Long commentCount = contentCommentService.getCount(contentComment);
        model.addAttribute("commentCount",commentCount);
// 获取到对应的评论
        Result result = contentCommentService.findList(contentComment);
        List<ContentComment> commentList= ( List<ContentComment>)result.getData();

        model.addAttribute("commentList",commentList);
//// 点赞总数
        ContentLike contentLike = new ContentLike();
        contentLike.setContentId(content);
        Integer likeCount = contentLikeService.Count(contentLike);
        model.addAttribute("likeCount",likeCount);

        return "article";
    }

    /**
     * 返回单篇文章,用于修改
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/getByIdSingle")
    public String  getByIdSingle(Long id,Model model){
        Content content = contentService.getById(id);
        if(content!=null){
            model.addAttribute("content",content);
            return "form";
        }else{
            return "";
        }
    }

    /**
     * ------------------------------------------------------------------------------------------------------------------------------------
     * @param response
     * @param model
     * @param filename
     */
    @RequestMapping("/getPic")
    @ResponseBody
    public void getData(HttpServletResponse response, Model model, String filename){
        int i = filename.lastIndexOf(".");
        String suffix = filename.substring(i);
        if(".jpg".equals(suffix)){
            response.setHeader("ContentType","image/jpeg");
        }else if(".png".equals(suffix)){
            response.setHeader("ContentType","image/png");
        }
        FileInputStream is=null;
        try {
            is = new FileInputStream(new File("D:/img/" + filename));
            ServletOutputStream os = response.getOutputStream();
            byte[] buf=new byte[1024];
            int len=0;
            while((len=is.read(buf))>0){
                os.write(buf,0,len);
                os.flush();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(is!=null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

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
        dropFile.transferTo(new File("d:/img/"+fileName));//图片地址
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
     * 发布文章
     * 编辑的方法
     * @param content
     * @param redirectAttributes
     * @param model
     * @return
     */
    @RequestMapping("/edit")
    public String edit(Content content, Long contentId, RedirectAttributes redirectAttributes, Model model) {
        Result result = null;
        String string = null;
//        获取其前台的text
        if (content.getId() != null && content.getId().longValue() > 0) {
//            获得之前的路径
            String text =contentService.getById(contentId).getText();
//            把改过之后的text传到txt里面
            String content2 = contentService.textProcessor(content,text);
            content.setText(content2);
//            把获得桌子前的路经传到 content的text里面
            result = contentService.update(content);
            string = "修改成功！！！";
        } else {
            //发表文章 把文件读取到txt 文本中 返回txt的路径
            String content2 =  contentService.textProcessor(content,null);
            content.setText(content2 );
            result = contentService.save(content);
            string = "添加成功！！！";
        }
        if (result.getStatus() == Result.SUCCESS_STATUS) {
            redirectAttributes.addFlashAttribute("message", string);
            return "redirect:/homePage/getData";
        } else {
            model.addAttribute("errorMessage",result.getMessage());
            return "form";
        }
    }

    /**
     * jiede  回显
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/show")
    public String show(Long id,Model model) {
//        获取 contentid
        Content content = contentService.getById(id);
        //读取在txt的内容 转成字符串
        Content content1 = contentService.setText(content);
        model.addAttribute("content",content1);
        return "form";
    }

    /**
     * 搜索
     * @param content
     * @param model
     * @return
     */
    @RequestMapping(value="search")
    public String search(Content content,Model model){
        Result result = contentService.findList(content);
        model.addAttribute("result",result);
        return "contents";
    }

    /**
     * 获取到添加文章的表单
     * @return
     */
    @RequestMapping("/getForm")
    public String getFrom(){
        return "form";
    }

    /**
     * 根据用户名获取到发布的文章
     */
    @RequestMapping(value="getByUserName")
    public  String getByUserId( Model model,@ModelAttribute("author") String author){
        Result result=null;
        if(author!=null){
            Content content = new Content();
            content.setAuthor(author);
            result = contentService.findList(content);
        }else{
            result= Result.fail("");
        }
        model.addAttribute("result",result);
        return "personContents";
    }

    @RequestMapping(value="/delete")
    public String delete(@RequestParam("id") Long id, Model model, String author,HttpSession session,RedirectAttributes redirectAttributes){
        Result result = contentService.delete(id);

        if(result.getStatus()==Result.SUCCESS_STATUS){
            model.addAttribute("result",result);
            System.out.println(author);
            redirectAttributes.addFlashAttribute("author",author);
            return "redirect:/content/getByUserName";
        }else{
            model.addAttribute("result",result);
            return "personContents";
        }
    }


}
