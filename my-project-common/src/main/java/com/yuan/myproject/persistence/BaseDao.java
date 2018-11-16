package com.yuan.myproject.persistence;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 使用泛型抽取共同的dao方法 CRUD
 * 1.T 是任意一个BaseEntity的子类
 * 2. T 在定义的时候暂时还不知道
 * 3. 但是，由于T 是BaseEntity的子类，所以它就理所当然地拥有下面用到T的方法的逻辑
 *    比如：任何一个实体类都有CRUD四个方法
 *
 * @param <T>
 */
public interface BaseDao<T extends BaseEntity> {


    /**
     * 通过id查询对象
     * @param id
     * @return
     */
    T getById(@Param("id") Long id);

    /**
     * 写入一个新的
     * @param
     */
    void save(T t);

    /**
     * 查询列表
     * @param
     * @return
     */
    List<T> findList(T t);

    /**
     * 查询结果条数
     * @param t
     * @return
     */
    long findListCount(T t);

    /**
     * 更新全部
     * @param
     */
    void update(T t);

    /**
     * 删除一条记录
     * @param id
     */
    void delete(@Param("id") Long id);
}
