package com.yuan.myproject.persistence;


import com.yuan.myproject.utils.BeanValidator;
import com.yuan.myproject.webSupport.PageResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * service抽象
 * @param <T>
 * @param <D>
 */
public abstract   class BaseServiceImpl<T extends BaseEntity,D extends BaseDao> implements BaseService<T>{

    private static final Logger logger=Logger.getLogger(BaseServiceImpl.class);

    @Autowired
    protected D dao;//UserDao


    /**
     * 通过id查询对象
     *
     * @param id
     * @return
     */
    @Override
    public T getById(Long id) {
        return (T)dao.getById(id);
    }

    /**
     * 保存
     *
     * @param t
     * @return
     */
    @Override
    @Transactional
    public Result save(T t) {
        try {
            Date date=new Date();
            t.setCreated(date);
            t.setUpdated(date);
            dao.save(t);
            return Result.success(null,t);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    @Transactional
    public Result delete(Long id) {
        try {
            dao.delete(id);
            return Result.success("",id);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    @Transactional
    public Result update(T t) {
        try {
            String message= BeanValidator.validator(t);
            if(StringUtils.isNotBlank(message)){
                return Result.fail(message);
            }
            t.setUpdated(new Date());
            dao.update(t);
            return Result.success("",t);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    public Result findList(T t) {
        try {
            List<T> list=dao.findList(t);
            return Result.success("",list);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    /**
     * @param
     * @param
     * @return
     */
    @Override
    public Result pageList(T user) {
        //总条数
        long count=dao.findListCount(user);
        //执行分页查询
        List<T> userList=dao.findList(user);
        //将查询结果、总条数、当前页数等数据放到pageResult对象中
        Result result = getResult(user, count, userList);
        return result;
    }

    protected Result getResult(T  user, long count, List<T> userList) {
        PageResult<T> pageResult=new PageResult<>();
        pageResult.setCount(count);
        pageResult.setPageSize(user.getPage().getPageSize());
        pageResult.setCurrent(user.getPage().getCurrent());
        pageResult.setList(userList);
        Result result=new Result();
        result.setData(pageResult);
        return result;
    }
}
