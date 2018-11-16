package com.yuan.myproject.webSupport;

import lombok.Data;

import java.util.List;

@Data
public class PageResult<T> {
    private long count;//总条数

    private List<T> list;//数据

    private int current;//当前第几页

    private int pageSize=10;//每页多少条记录

}
