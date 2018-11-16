<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    <%--css start--%>

    <script type="text/javascript" src="/static/jquery-1.8.2.js"></script>
    <link href="/static/plugins/jquery-ztree/jquery-ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css">
    <%--css end--%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/includes/head-nav.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/includes/left-nav.jsp"></jsp:include>
    <div class="content-wrapper">
        <%--提示 start--%>
            <c:if test="${not empty message }">
                <br>
                <div class="alert alert-danger alert-dismissible ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${message}

                </div>
            </c:if>


        <%--提示 end--%>

        <%--from start--%>
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">编辑</h3>
            </div>

            <!-- form start -->
            <form role="form" action="/category/edit" method="post" id="form">
                <div class="box-body">
                    <div class="form-group">
                        <label for="pid">父类名</label>
                        <input type="hidden" class="form-control" value="${category.parent.id}" name="parent.id" id="pid" placeholder="父id">
                        <input type="text" readonly="readonly" class="form-control" value="${category.parent.name}" name="parent.name" id="pname" placeholder="父节点" data-toggle="modal" data-target="#modal-info">
                        <input type="hidden" name="id" value="${category.id}">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">类名</label>
                        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="类名" name="name" value="${category.name}">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">序号</label>
                        <input type="text" class="form-control" id="order" placeholder="序号" name="order" value="${category.order}" >
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </form>
        </div>
        <%--from  end--%>
    </div>
    <jsp:include page="/WEB-INF/views/includes/copyright.jsp"></jsp:include>
</div>
<%--不包含插件的js,仅仅是admin的JS--%>

<%--///////////////////////////////////////////////////--%>
<div class="modal modal-info fade in" id="modal-info" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">父节点数据</h4>
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
<%--//////////////////////////////////////////////////////--%>


<!-- js start -->
<script src="/static/plugins/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/static/plugins/adminLTE/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/static/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/static/plugins/adminLTE/dist/js/demo.js"></script>
<%--js end--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>



</body>
</html>
<%--///////////////////////////////////////--%>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="/static/plugins/jquery-ztree/jquery-ztree/js/jquery.ztree.core-3.5.js"></script>
<%--////////////////////////////////////////--%>
<script type="text/javascript">
    $(function () {
        $("#form").validate();
        //加载ztree
        var setting = {
            view: {
                //是否允许多选 不允许多选
                selectedMulti: false
            },
            //异步
            async: {
                enable: true,
                url: "/category/treeData",
                autoParam: ['id']
            }
        };

        $.fn.zTree.init($("#category-tree"), setting);
    });
    function getData() {
        //获取到ztree对象 把控件所在的ul 那个id传进去
        var zTree = $.fn.zTree.getZTreeObj("category-tree");
        //获取到选中的节点
        var nodes = zTree.getSelectedNodes();//因为ztree允许多选，所以getSelectedNodes返回一个json对象数组
        if(nodes.length==0){
            alert("请选择一条数据");
            return;
        }
        var name=nodes[0].name;
        var id=nodes[0].id;

        $("#pid").val(id);
        $("#pname").val(name);
        $("#modal-info").modal("hide");//将model隐藏，这是bootstrap自带的方法
    }
</script>