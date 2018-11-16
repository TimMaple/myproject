<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%--css start--%>
        <link rel="stylesheet" type="text/css" href="/static/plugins/treeTable/themes/vsStyle/treeTable.min.css">
    <%--css end--%>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
<jsp:include page="/WEB-INF/views/includes/head-nav.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/includes/left-nav.jsp"></jsp:include>
    <div class="content-wrapper">

        <c:if test="${not empty message }">
            <br>
            <div class="alert alert-success alert-dismissible ">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    ${message}

            </div>
        </c:if>

        <%--list  start--%>
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">类表展示</h3>
            </div>
            <div class="box-body">
                <table class="table table-bordered" id="treeTable">
                    <tbody>
                    <tr>
                        <th style="width: 50px">序号</th>
                        <th>类名</th>
                        <th>父类名</th>
                        <%--<th>是否父类</th>--%>
                        <th>排序</th>
                        <th>创建日期</th>
                        <th>修改日期</th>
                        <th>操作</th>
                    </tr>


                    <c:forEach items="${list}" var="category" varStatus="status">
                        <tr>
                        <tr pId="${category.parent.id}" id="${category.id}">
                            <td>${status.index+1}.</td>
                            <td>${category.name}</td>
                            <td>${category.parent.name}</td>
                            <%--<td>${category.isParent==0?"否":"是"}</td>--%>
                            <td>${category.order}</td>
                            <td><fmt:formatDate value="${category.created}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                        <%-- HH:mm:ss--%>
                            <td><fmt:formatDate value="${category.updated}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                            <td>
                                <a href="/category/form?id=${category.id}">
                                    <button type="button" class="btn btn-block btn-default fa fa-edit" style="width: 70px;height: 45px">编辑</button>
                                </a>
                                &nbsp; &nbsp;
                                <button onclick="openModal('${category.id}')" type="button" class="btn btn-block btn-danger fa fa-remove"  style="width: 70px;height: 45px" data-toggle="modal" data-target="#modal-danger">删除</button>
                                &nbsp;&nbsp;
                                <button onclick="toAddSubNode('${category.id}')" type="button" class="btn btn-default" >
                                    <i class="fa fa-plus"></i> 增加子节点
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <%--list  end--%>

    </div>
    <jsp:include page="/WEB-INF/views/includes/copyright.jsp"></jsp:include>

</div>
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>

<!--这是删除前的警告模态框-->
<div class="modal modal-danger fade in" id="modal-danger" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">删除提示</h4>
            </div>
            <div class="modal-body">
                <p>您确定要删除这条数据吗？</p>
                <input type="hidden" id="deleteId" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                <button onclick="deleteCategory()" type="button" class="btn btn-outline">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->


</div>
<script type="text/javascript" src="/static/plugins/treeTable/jquery.treeTable.min.js"></script>
<script type="text/javascript">


    //当页面加载完后，searchForm下面所有的input 输入框都加上一个onchange事件，当内容改变的时候，让当前页码改为1
    $(function () {
        function message() {
            var message = $("#message").val();
            alert(1);
            if(message!="" || message!=''){
                alert(message);
            }
        }

        $("#searchForm").find("input").change(function () {
            $("#current").val(1);
        });

        //treeTable
        $('#treeTable').treeTable({
            column: 1, //在第几列显示这个收缩图标
            expandLevel: 2 //初始化展开多少层
        });



    });
//    增加
    function toAddSubNode(id) {
        window.location.href = "/category/toAddSubNode?id="+id;
    }
//    记录id 并且给 id 付给 id=deleteId 的位置
    function openModal(id) {
        $("#deleteId").val(id);
    }
//    删除
    function deleteCategory() {
        var id=$("#deleteId").val();
        window.location.href="/category/delete?id="+id;
    }

</script>