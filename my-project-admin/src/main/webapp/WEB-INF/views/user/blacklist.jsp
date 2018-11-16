<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/sys.tld" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <jsp:include page="/WEB-INF/views/includes/head-nav.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/includes/left-nav.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
            </h1>
            <c:if test="${not empty message }">
                <br>
                <div class="alert alert-success alert-dismissible ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${message}
                </div>
            </c:if>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">用户黑名单列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body ">
                            <table class="table table-bordered">
                                <tr>

                                    <th style="width: 10px">用户ID</th>
                                    <th>用户名</th>
                                    <th>邮件地址</th>
                                    <th >电话</th>
                                    <th >拉黑时间</th>
                                </tr>
                              <%--  <!--data 对象 -->
                                <c:set var="data" value="${result.data.list}"></c:set>
                                <c:set var="page" value="${result.data}"></c:set>--%>

                                <c:forEach items="${list}" var="blackUser" varStatus="status">
                                    <tr>

                                        <td>${blackUser.id}.</td>
                                        <td>${blackUser.userName}</td>
                                        <td>
                                                ${blackUser.email}
                                        </td>
                                        <td>${blackUser.phone}</td>
                                        <td><fmt:formatDate value="${blackUser.created}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>

                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">

                            <%--<sys:page count="200" countPerPage="10" current="7"></sys:page>--%>
                            <ul class="pagination pagination-sm no-margin pull-right">
                                <sys:page count="${page.count}" current="${page.current}" pageSize="${page.pageSize}"></sys:page>

                            </ul>
                        </div>
                    </div>
                    <!-- /.box -->


                </div>

            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <%--<div class="control-sidebar-bg"></div>--%>
</div>

</div>

<script type="text/javascript">

    function page(current) {
        $("#current").val(current)
        /*window.location.href="/user/list?current="+current+"&pageSize="+pageSize;*/
        $("#searchForm").submit();
    }

    function toFrom(id) {
        window.location.href="/user/form?id="+id;
    }


    function deleteUser() {
        var id = $("#deleteId").val();
        window.location.href = "/user/delete?id="+id;
    }

    function openModal(id) {
        $("#deleteId").val(id);
    }
</script>

<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>

<script type="text/javascript">
    $(function () {
        $("#searchForm").find("input").change(function () {
            $("#current").val(1);
        });
    });
</script>

</body>
</html>
