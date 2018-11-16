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

    <jsp:include page="/WEB-INF/views/includes/left-nav.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
            </h1>
            <c:if test="${not empty errorMessage }">
                <br>
                <div class="alert alert-danger alert-dismissible ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${errorMessage}
                </div>
            </c:if>
            <%--<ul id='myTree' class='ztree'>--%>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">用户操作</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="/user/edit" method="post" id="form">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">邮件地址</label>
                                    <input type="email" class="form-control" name="email" value="${user1.email}" id="exampleInputEmail1" placeholder="电子邮件">
                                    <input type="hidden" name="id" value="${user1.id}">
                                </div>
                                <c:if test="${empty user1.id}">
                                    <div class="form-group">
                                        <label for="password">密码</label>
                                        <input type="password" minlength="5" maxlength="20"  required class="form-control" name="password" id="password" placeholder="密码">
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label for="userName">用户名</label>
                                    <input type="text" maxlength="10" minlength="3" required value="${user1.userName}"  class="form-control" id="userName" name="userName" placeholder="用户名">
                                </div>
                                <div class="form-group">
                                    <label for="phone">电话号码</label>
                                    <input type="text"  pattern="/^1\d{10}$/" class="form-control" value="${user1.phone}" id="phone" name="phone" placeholder="电话号码">
                                </div>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->

                </div>

            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>


    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <%--<div class="control-sidebar-bg"></div>--%>
</div>

</div>

<jsp:include page="/WEB-INF/views/includes/copyright.jsp"></jsp:include>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">

    $(function () {
        $("#form").validate();
    });
</script>
<script type="text/javascript">

    function checkPhone(str){
        var re = /^1\d{10}$/;
        if(re.test(str)){
            return true;
        }else{
            return false;
        }
    }
</script>

</body>
</html>
