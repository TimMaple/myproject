<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.InetAddress"%>

<%
    InetAddress address = InetAddress.getLocalHost();
    String ip=address .getHostAddress().toString();
    pageContext.setAttribute("ip",ip);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>猫猫——登录</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <link rel="stylesheet" type="text/css" href="/static/css/ziy.css">
    <!--  <script src="js/jquery-1.11.3.min.js" ></script>
    <script src="js/index.js" ></script>  -->
    <!-- <script type="text/javascript" src="js/jquery1.42.min.js"></script> -->
    <!--
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
     <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.source.js"></script> -->
    <script type="text/javascript" src="/static/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var validate = $("#myform").validate({
                debug: true, //调试模式取消submit的默认提交功能
                //errorClass: "label.error", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                    // alert("提交表单");
                    form.submit();   //提交表单
                },

                rules:{
                    username:{
                        required:true
                    },

                    password:{
                        required:true
                    }
                },
                messages:{
                    username:{
                        required:"不为空"
                    },

                    password:{
                        required:"不为空"
                    }
                }

            });

        });
    </script>
    <script type="text/javascript">
        function codeFlush() {
            document.getElementById("img").src="http://localhost:8081/user/getKaptcha?"+Math.random();
        }
    </script>
</head>
<body>
<!--dengl-->
<div class="beij_center">
    <div class="dengl_logo">
        <img src="/static/images/logo_1.png">
        <h1>欢迎登录</h1>
    </div>
</div>
<div class="dengl_beij">

    <form action="/user/login" method="post" id="myform">
        <div class="banner_xin">
            <img src="/static/images/ss.jpg">
        </div>
        <div class="beij_center dengl_jvz">
            <div class="login_form">
                <div class="login_tab">
                    <span style="font-size:20px;" te>欢迎登录</span>
                    <c:if test="${not empty result.message}">
                        <%--<div class="msg-weak" style="display: inline-block;"> <i></i>--%>
                        <span class="msg-cont">${result.message}</span>
                        <%--</div>--%>
                    </c:if>
                </div>


                <div class="kengl_kuang">
                    <div class="txt_kuang">
                        <input type="text" class="itxt"  placeholder="用户名" id="username" name="userName">
                        <input type="password" class="itxt"  placeholder="密码" id="password" name="password">
                        <input type="text" class="itxt"  placeholder="验证码" id="vCode" name="vCode">
                        <label for="vCode"><a href="javascript:"><img id="img" onclick="codeFlush()" src="http://localhost:8081/user/getKaptcha" alt="加载失败!"></a></label>
                    </div>
                    <input type="submit" tabindex="5" value="登 录" class="btnnuw">
                </div>
                <div class="corp_login">
                    <div class="regist_link"><a href="/user/getRegister" target="_blank">立即注册</a></div>
                </div>
            </div>
        </div>
    </form>
</div>


<div class="jianj_dib">
    <div class="beia_hao">
        <p>京ICP备：123456789号  </p>
        <p class="gonga_bei">京公网安备：123456789号</p>
    </div>
</div>

</body>
</html>
