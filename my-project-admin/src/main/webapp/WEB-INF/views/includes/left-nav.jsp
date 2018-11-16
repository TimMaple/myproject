<%--
  Created by IntelliJ IDEA.
  User: YURENCHEN
  Date: 2018/10/28
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<!-- sidebar menu: : style can be found in sidebar.less -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
<!-- Sidebar user panel -->
<div class="user-panel">
<div class="pull-left image">
    <img src="/static/plugins/adminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
</div>
<div class="pull-left info">
    <%--用户名字--%>
<p><c:if test="${not empty UserLogin}">${UserLogin.username}</p>
    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
    </div>
    </div>
    <!-- search form -->

    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
    <li class="header logo-lg">MAIN NAVIGATION</li>
    <li class="treeview">
    <a href="#">
    <i class="fa fa-user"></i> <span>用户管理</span>
    <span class="pull-right-container">
    <i class="fa fa-angle-left pull-right"></i>
    </span>
    </a>
    <ul class="treeview-menu">
        <li><a href="/user/list"><i class="fa fa-circle-o"></i> 用户列表</a></li>
        <li><a href="/user/form"><i class="fa fa-circle-o"></i> 用户添加</a></li>
        <li><a href="/user/blacklist"><i class="fa fa-circle-o"></i> 用户黑名单</a></li>
    </ul>
    </li>
    <li class="treeview">
    <a href="#">
    <i class="fa  fa-list"></i>
    <span>栏目管理</span>
    <span class="pull-right-container">
    <i class="fa fa-angle-left pull-right"></i>
    </span>
    </a>
    <ul class="treeview-menu">
        <li><a href="/category/list"><i class="fa fa-circle-o"></i>栏目树表</a></li>
        <li><a href="/category/form"><i class="fa fa-circle-o"></i>增加栏目</a></li>
    </ul>
    </li>
    <li class="treeview">
    <a href="#">
    <i class="fa fa-file"></i>
    <span>模块文章</span>
    <span class="pull-right-container">
    <i class="fa fa-angle-left pull-right"></i>
    </span>
    </a>
    <ul class="treeview-menu">
        <li><a href="/content/list"><i class="fa fa-circle-o"></i>文章列表</a></li>
        <li><a href="/content/form"><i class="fa fa-circle-o"></i>增加文章</a></li>
    </ul>
    </li>


    </ul>
    </section>
    <!-- /.sidebar -->
</aside>