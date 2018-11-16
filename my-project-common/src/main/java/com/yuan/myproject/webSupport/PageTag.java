package com.yuan.myproject.webSupport;

import lombok.Data;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.Writer;

/**
 * 自定义分页标签
 */
@Data
public class PageTag extends BodyTagSupport {

    private int count;//总条数

    private int pageSize =10;//每页条数

    private int current;//当前第几页


    @Override
    public int doEndTag() throws JspException {
        try {
            //总条数除以每一页的条数，是不是总页数
            int pageCount=count/ pageSize;  //计算总页数
            //如果除出来不是整数，就加1页
            if(count% pageSize >0){
                pageCount++;
            }


            Writer writer=pageContext.getOut();
            //start 从第几页开始打印 比如 从第4页开始打印
            int start=current-4<1?1:current-4;
            //end 写到第几页 打印到第几页  比如打印到第8页
            int end=current+4>pageCount?pageCount:current+4;

            int prePage=current-1<1?1:current-1;//上一页是第几页
            int nextPage=current+1>pageCount?pageCount:current+1;//下一页是第几页

            //首先写第一页
            writer.write("<li><a href=\"javascript:page(1)\"> 首页 </a></li>");
            writer.write("<li><a href=\"javascript:page("+prePage+")\"> 上一页 </a></li>");
            for(int i=start;i<=end;i++){
                //当打印到当前页的时候，比如，现在是第5页，那么，5这个数字是不能跳转的
                //page()是一个javacript的脚本方法
                if(i!=current) {
                    writer.write("<li><a href=\"javascript:page("+i+")\">" + i + "</a></li>");
                }else {
                    //javascript:void(0)指的是什么也不做
                    //它本身的页数不能跳转，比如当前是第7页，点7没有反应
                    writer.write("<li><a href=\"javascript:void(0)\">" + i + "</li>");
                }

            }

            writer.write("<li><a href=\"javascript:page("+nextPage+")\"> 下一页 </a></li>");
            //最后写最后一页
            writer.write("<li><a href=\"javascript:page("+pageCount+")\"> 尾页 </a></li>");
        }catch (Exception e){
            e.printStackTrace();
        }
        //<sys:page ...>
        //
        // </sys:page>
        return super.SKIP_BODY;//不理会标签内部
    }


}
