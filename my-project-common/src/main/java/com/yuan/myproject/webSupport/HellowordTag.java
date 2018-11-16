package com.yuan.myproject.webSupport;

import lombok.Data;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.Writer;

@Data
public class HellowordTag extends BodyTagSupport {

    private int count;//总条数

    private int pageSize;//每页多少条

    private int current;//当前是第几页

    private static final int showPageCount=2;

    @Override
    public int doEndTag() throws JspException {
        try {
            //计算总共有多少页
            int pageCount=count/pageSize;
            if(count%pageSize>0){
                pageCount++;
            }

            //计算从第几页的页数开始打印
            int start=current-showPageCount<1?1:current-showPageCount;
            //计算打印的最后一页
            int end=current+showPageCount>pageCount?pageCount:current+showPageCount;
            //计算上一页是哪一页
            int prePage=current-1<1?1:current-1;
            //计算下一页
            int nextPage=current+1>pageCount?pageCount:current+1;
            //pageContext是继承过来的
            Writer writer = pageContext.getOut();
            //page是写在页面上javasctript脚本 1是参数
            writer.write("<li><a href=\"javascript:page(1)\"> 首页 </a></li>");
            writer.write("<li><a href=\"javascript:page("+prePage+")\"> 上一页 </a></li>");
            for(int i=start;i<=end;i++){
                if(i==current){
                    writer.write("<li><a  href=\"javascript:void(0)\"> "+i+" </a></li>");
                }else {
                    writer.write("<li><a href=\"javascript:page("+i+")\"> "+i+" </a></li>");
                }

            }

            writer.write("<li><a href=\"javascript:page("+nextPage+")\"> 下一页 </a></li>");
            writer.write("<li><a href=\"javascript:page("+pageCount+")\"> 尾页 </a></li>");




        }catch (Exception e){
            e.printStackTrace();
        }

        return super.SKIP_BODY;//不理会标签内部
    }
}
