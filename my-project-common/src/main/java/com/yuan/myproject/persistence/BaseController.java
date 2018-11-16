package com.yuan.myproject.persistence;


import org.springframework.beans.factory.annotation.Autowired;

public class BaseController<S extends BaseService,T extends BaseEntity> {
    @Autowired
    protected S service;
}
