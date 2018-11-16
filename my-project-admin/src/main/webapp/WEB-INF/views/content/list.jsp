<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/sys.tld" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    <link rel="stylesheet" href="/static/plugins/adminLTE/plugins/iCheck/all.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/includes/head-nav.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/includes/left-nav.jsp"></jsp:include>
    <!-- 内容主体 -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                模块文章
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <c:if test="${not empty message }">
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    ${message}
                            </div>
                        </c:if>
                        <div class="box-header">
                            <h3 class="box-title">文章列表</h3></br></br>
                            <form action="/content/list" method="get" id="searchForm">
                                <div class="row">
                                    <input type="hidden" id="current" name="current" value="${page.current}"/>
                                    <input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}"/>
                                    <div class="col-xs-1">
                                        <button onclick="toFrom()" type="button" class="btn btn-default">
                                            <i class="fa fa-plus"></i>&nbsp;新增
                                        </button>
                                    </div>
                                    <div class="col-xs-1">
                                        <button type="button" onclick="openModal('-1')" class="btn btn-default" data-toggle="modal"
                                                data-target="#modal-danger">
                                            <i class="fa fa-trash-o"></i>&nbsp;批量删除
                                        </button>
                                    </div>

                                    <div class="col-xs-2">
                                        <input type="text" class="form-control" name="category.name" value="${content.parent.name}" id="category.name" placeholder="分类">
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="text" class="form-control" name="author" value="${content.author}" id="author" placeholder="作者">
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="text" class="form-control" name="title" value="${content.title}" id="title" placeholder="标题">
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="text" class="form-control" name="subTitle" value="${content.subTitle}" id="subTitle" placeholder="副标题">
                                    </div>
                                    <div class="col-xs-2">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fa fa-search"></i>&nbsp;搜索
                                        </button>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th><input class="flat" type="checkbox" id="checkAll"></th>
                                    <th>分类</th>
                                    <th>标题</th>
                                    <th>副标题</th>
                                    <th>作者</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${list}" var="content" varStatus="status">
                                    <tr>
                                        <td>
                                            <input class="flat" type="checkbox" name="contentCheck"
                                                   value="${content.id}">
                                        </td>
                                        <td>${content.parent.name}</td>
                                        <td>${content.title}</td>
                                        <td>${content.subTitle}</td>
                                        <td>${content.author}</td>
                                        <td><fmt:formatDate value="${content.updated}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                        <td>
                                            &nbsp;&nbsp;
                                            <button onclick="toFrom('${content.id}')" class="btn btn-primary">
                                                <i class="fa fa-edit"></i>&nbsp;编辑
                                            </button>
                                            &nbsp;&nbsp;&nbsp;
                                            <button onclick="openModal('${content.id}')" class="btn btn-danger"
                                                    type="button" data-toggle="modal" data-target="#modal-danger">
                                                <i class="fa fa-trash-o"></i>&nbsp;删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right">
                                <sys:page count="${page.count}" current="${page.current}"
                                          pageSize="${page.pageSize}"></sys:page>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->


    </div>
    <jsp:include page="/WEB-INF/views/includes/copyright.jsp"></jsp:include>
</div>
<!-- 删除前的警告模态框 -->
<div class="modal modal-danger fade in" id="modal-danger" style="display: none; padding-right: 15px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">删除提示</h4>
            </div>
            <div class="modal-body">
                <p>确定要删除吗？</p>
                <input type="hidden" id="deleteId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                <button onclick="deleteContent()" type="button" class="btn btn-outline">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
<script type="text/javascript">
    // 跳转的逻辑方法
    function page(current) {
        $("#current").val(current);
        $("#searchForm").submit();
    };

    // 编辑的函数
    function toFrom(id) {
        if (id == undefined) {
            return location.href = "/content/form";
        }
        location.href = "/content/form?id=" + id;
    };

    // 删除的函数
    function deleteContent() {
        var id = $("#deleteId").val();
        if (id > 0) {
            location.href = "/content/delete?id=" + id;
        } else {
            $.ajax({
                url: '/content/deleteMutil',
                type: 'post',
                data: {ids: idArray},
                success: function () {
                    location.reload();
                }
            })
        }

    };
    var idArray = '';

    // 删除前存储id的函数
    function openModal(id) {
        $("#deleteId").val(id);
        if (id == -1) {
            idArray = '';
            $("input[name='contentCheck']:checked").each(function () {
                idArray += "," + $(this).val();
            });
        }
    };
    // 高级查询后的回显
    $(function () {
        $("#searchForm").find("input").change(function () {
            $("#current").val(1);
        })
    })
</script>
<%--不包含插件的js,仅仅是admin的JS--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
<script type="text/javascript" src="/static/plugins/adminLTE/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        //初始化icheck
        $('input[type="checkbox"].flat').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });
        //用icheck全选
        $('#checkAll').on('ifChecked', function (event) {
            $("input[name='contentCheck']").iCheck('check');
        });
        //用icheck反选
        $('#checkAll').on('ifUnchecked', function (event) {
            $("input[name='contentCheck']").iCheck('uncheck');
        });
    });
</script>
</body>
</html>
