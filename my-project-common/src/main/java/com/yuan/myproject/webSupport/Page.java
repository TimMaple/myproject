package com.yuan.myproject.webSupport;

import lombok.Data;

@Data
public class Page {
    /**
     * 每页的条数
     */
    private int pageSize=5;
    /**
     * 查询起始条
     */
    //private int start;
    /**
     * 当前第几页
     */
    private int current=1;
    /**
     * 查询起始条
     */
    public int getStart() {
        return (current-1)*pageSize;
    }
}
