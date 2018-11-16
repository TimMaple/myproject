package com.yuan.myproject.persistence;


import lombok.Data;

/**
 * service返回的信息
 */
@Data
public class Result<T> {

    public static final int ERROR_STATUS=500;//失败的状态

    public static final int SUCCESS_STATUS=200;//成功状态

    private int status=SUCCESS_STATUS;//处理结果是否成功

    private String message;//返回信息

    private T data;//返回的数据

    /**
     * 出错的时候可以直接用
     * @param message
     * @return
     */
    public static Result fail(String message){
        Result result= new Result();
        result.setMessage(message);
        result.setStatus(ERROR_STATUS);
        return result;
    }

    /**
     * 成功时可以调用
     * @param message
     * @param data
     * @return
     */
    public static Result success(String message,Object data){
        Result result= new Result();
        result.setMessage(message);
        result.setStatus(SUCCESS_STATUS);
        result.setData(data);
        return result;
    }

//
}
