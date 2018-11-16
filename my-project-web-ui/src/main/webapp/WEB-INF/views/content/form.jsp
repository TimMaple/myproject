<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%--<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>--%>
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="/static/plugins/adminLTE/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/morris.js/morris.css">

        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/morris.js/morris.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/jvectormap/jquery-jvectormap.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="/static/plugins/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet" href="/static/plugins/adminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <link href="/static/plugins/jquery-ztree/jquery-ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css">
    <link href="/static/plugins/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css">
    <link href="/static/plugins/wangEditor/wangEditor.min.css" rel="stylesheet" type="text/css">


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/all/head.jsp"></jsp:include>
    <!-- 内容主体 -->
    <%--<div class="content-wrapper">--%>
        <section class="content-header">
            <h1>
                模块文章
            </h1>
        </section>
        <section class="content">
            <div class="row">
                <!-- right column -->
                <div class="col-md-12">
                    <c:if test="${not empty errorMessage }">
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                ${errorMessage}
                        </div>
                    </c:if>
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header">
                            <%--根据是否传过来id进行判断是否为修改文章--%>
                            <h3 class="box-title">${content.id>0 ? "修改文章":"增加文章"}</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form class="form-horizontal" role="form" action="/content/edit" method="post" id="form">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pname" class="col-sm-1 control-label">分类</label>
                                    <input type="hidden" value="${content.id}" name="contentId">
                                    <div class="col-sm-8">
                                        <input type="hidden" name="id" value="${content.id}">
                                        <input type="text" readonly="readonly" class="form-control" value="${content.category.name}" name="category.name" id="pname" placeholder="请选择" data-toggle="modal" data-target="#modal-info">
                                        <input type="hidden"  name="category.id" id="pid" value="${content.category.id}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="title" class="col-sm-1 control-label">标题</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="title" name="title" value="${content.title}" placeholder="标题">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="subTitle" class="col-sm-1 control-label">子标题</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="subTitle" name="subTitle" value="${content.subTitle}" placeholder="子标题">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="author" class="col-sm-1 control-label">作者</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="author" name="author" value="${content.author}" placeholder="作者">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="text" class="col-sm-1 control-label">描述</label>

                                    <div class="col-sm-8">
                                        <input type="hidden" id="text" name="text">
                                        <div id="editor">${content.text}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="/content/list">
                                        <button type="button" class="btn btn-info pull-right">返回</button>
                                    </a>
                                </div>
                                <div class="col-sm-8">
                                    <button type="submit" id="btnSubmit" class="btn btn-info pull-right">提交</button>

                                </div>
                            </div>
                            <!-- /.box-footer -->
                        </form>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
    <%--</div>--%>
</div>
<div class="modal modal-info fade in" style="z-index:10002;" id="modal-info" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">栏目</h4>
            </div>
            <div class="modal-body">
                <ul id="category-tree" class="ztree"></ul>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                <button onclick="getData()" type="button" class="btn btn-outline">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<jsp:include page="/WEB-INF/views/all/foot.jsp"></jsp:include>
<!--jquery -->
<script src="/static/plugins/Jquery/jquery-3.3.1.min.js"></script>
<!-- jQuery 3 -->
<script src="/static/plugins/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/plugins/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/static/plugins/adminLTE/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/static/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/static/plugins/adminLTE/dist/js/demo.js"></script>
<!-- Slimscroll -->
<script src="/static/plugins/adminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="/static/plugins/jquery-ztree/jquery-ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/static/plugins/dropzone/min/dropzone.min.js"></script>
<script type="text/javascript" src="/static/plugins/wangEditor/wangEditor.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#form").validate();
        // 加载ztree
        var setting = {
            view: {
                // 是否允许多选
                selectedMulti: false
            },
            // 异步
            async: {
                enable: true,
                url: "/category/treeData",
                autoParam: ['id']
            }
        };

        $.fn.zTree.init($("#category-tree"), setting);
        initWangEditor();   // 初始化wangeditor
    });
    function getData() {
        var zTree = $.fn.zTree.getZTreeObj("category-tree");
        var nodes = zTree.getSelectedNodes();
        if (nodes.length == 0) {
            alert("请选择父级目录");
            return;
        }
        var name = nodes[0].name;
        var id = nodes[0].id;

        $("#pid").val(id);
        $("#pname").val(name);
        $("#modal-info").modal("hide");
    }

    /**
     * 富文本编辑器
     */
    function initWangEditor() {
        var E = wangEditor;
        var editor = new E('#editor');  //把div的id传进去，直接初始化这个编辑器
        // 配置服务器端地址
        editor.customConfig.uploadImgServer ='/content/upload';  // 上传图片的url
        editor.customConfig.uploadFileName = 'dropFile';    // 上传图片时，用表单域的名称
        editor.create();
        $("#btnSubmit").bind('click', function () {
            var contentHtml = editor.txt.html();
            $("#text").val(contentHtml);
        });
    }


</script>
</body>
</html>
