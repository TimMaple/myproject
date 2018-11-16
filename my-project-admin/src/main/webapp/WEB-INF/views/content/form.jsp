<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    <link href="/static/plugins/jquery-ztree/jquery-ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css">
    <link href="/static/plugins/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css">
    <link href="/static/plugins/wangEditor/wangEditor.min.css" rel="stylesheet" type="text/css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/includes/head-nav.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/includes/left-nav.jsp"></jsp:include>
    <!-- 内容主体 -->
    <div class="content-wrapper">
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
                                    <label for="pname" class="col-sm-1 control-label">栏目</label>

                                    <div class="col-sm-8">
                                        <input type="text" readonly="readonly" class="form-control" value="${content.parent.name}" name="parent.name" id="pname" placeholder="请选择" data-toggle="modal" data-target="#modal-info">
                                        <input type="hidden" name="id" value="${content.id}">
                                        <input type="hidden"  name="parent.id" id="pid" value="${content.parent.id}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="picture1" class="col-sm-1 control-label">图片1</label>
                                    <div class="col-sm-8">
                                        <input type="text" readonly="readonly"   value="${content.pic1}"  class="form-control" id="picture1" name="pic1" placeholder="图片1">
                                        <div class="dropzone" id="pic1upload"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text" class="col-sm-1 control-label">描述</label>

                                    <div class="col-sm-8">
                                        <input type="hidden" id="text" name="text">
                                        <div id="editor">${detail}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="list()" class="btn btn-default">返回</button>
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
    </div>
    <jsp:include page="/WEB-INF/views/includes/copyright.jsp"></jsp:include>
</div>
<!-- 树形选分类 -->
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
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="/static/plugins/jquery-ztree/jquery-ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/static/plugins/dropzone/min/dropzone.min.js"></script>
<script type="text/javascript" src="/static/plugins/wangEditor/wangEditor.min.js"></script>
<script type="text/javascript">
    function list() {
        location.href = "/content/list;";
    }
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
    //new Dropzone一定要放到jquery的外面，不要在里面初始化
    //加载dropzone
    // 默认的 Dropzone 参数
    var defaultDropzoneOpts = {
        url: "",
        paramName: "dropFile",
        maxFiles: 1, // 一次性上传的文件数量上限
        maxFilesize: 2, // 文件大小，单位：MB
        acceptedFiles: ".jpg,.gif,.png,.jpeg", // 上传的类型
        addRemoveLinks: true,
        parallelUploads: 1, // 一次上传的文件数量
        dictDefaultMessage: '拖动文件至此或者点击上传',
        dictMaxFilesExceeded: "您最多只能上传 1 个文件！",
        dictResponseError: '文件上传失败!',
        dictInvalidFileType: "文件类型只能是*.jpg,*.gif,*.png,*.jpeg",
        dictFallbackMessage: "浏览器不受支持",
        dictFileTooBig: "文件过大上传文件最大支持",
        dictRemoveLinks: "删除",
        dictCancelUpload: "取消"
    };


    var opts={
        //id指的放我们 上传控件的那个div的id
        id: "#pic1upload",
        //上传的路径
        url: "/content/upload",
        paramName: "dropFile",//指的是上传到后台，用来获取这个上传文件的表单名
        init: function () {
            //这是当上传完成后回调这个函数
            this.on("success", function (file, data) {
                // $("#pic").val(data.fileName);
                $("#picture1").val(data.path);
            });
        }
    }

    // 关闭 Dropzone 的自动发现功能
    Dropzone.autoDiscover = false;
    // 继承
    //$.extend(）jquery内部的函数，将后面的（opts）覆盖到前面的(defaultDropzoneOpts)
    $.extend(defaultDropzoneOpts, opts);
    //创建一个上传控件
    new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);

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
