<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>MyShop——个人注册</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <link rel="stylesheet" type="text/css" href="/static/css/ziy.css">
    <!--  <script src="/static/js/jquery-1.11.3.min.js" ></script>
    <script src="/static/js/index.js" ></script>  -->
    <script type="text/javascript" src="/static/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.SuperSlide.2.1.1.source.js"></script>
    <script type="text/javascript" src="/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var validate = $("#myform").validate({
                debug: false, //调试模式取消submit的默认提交功能
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
                    email:{
                        required:true,
                        email:true
                    },
                    phone:{
                        required:true
                    },
                    password:{
                        required:true
                    },
                    confirmPassword:{
                        equalTo:"#password"
                    }
                },
                messages:{
                    username:{
                        required:"请输入用户名"
                    },
                    email:{
                        required:"邮箱不能为空",
                        email:"E-Mail格式不正确"
                    },
                    phone:{
                        required:"手机号码不能为空"
                    },
                    password:{
                        required: "密码不能为空"
                    },
                    confirmPassword:{
                        equalTo:"两次密码输入不一致"
                    }
                }

            });

        });
    </script>
</head>
<body>
<div class="yiny">
    <div class="beij_center">
        <div class="dengl_logo">
            <img src="/static/images/logo_1.png">
            <h1>欢迎注册</h1>
        </div>
    </div>
</div>
<div class="beij_center">
    <div class="ger_zhuc_beij">
        <div class="ger_zhuc_biaot">
            <ul>
                <li class="ger_border_color"><a href="##">注册</a></li>
                <p>我已经注册，现在就<a class="ftx-05 ml10" href="/user/getLogin">登录</a></p>
            </ul>
        </div>
        <form action="/user/register" method="post" id="myform">
        <div class="zhuc_biaod">
            <div class="reg-items" >

                <!--备注————display使用 inline-block-->
                <c:if test="${not empty result.message}">
                    <div class="msg-box">
                        <div class="msg-box" >
                            <div class="msg-weak" style="display: inline-block;"> <i></i>
                                <div class="msg-cont">${result.message}</div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="username">用户名：</label>
              	</span>
                <input   class="i-text" type="text" id="username" name="userName">
                <!--备注————display使用 inline-block-->
                <div class="msg-box">
                    <div class="msg-box" style="display: none;">
                        <div class="msg-weak" style="display: inline-block;"> <i></i>
                            <div class="msg-cont">4-20个字符，支持汉字、字母、数字及“-”、“_”组合</div>
                        </div>
                    </div>
                   <%-- <div class="msg-weak err-tips"  style="display: inline-block;"><div>请输入用户名</div></div>--%>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="password">设置密码：</label>
              	</span>
                <input   class="i-text" type="password" id="password" name="password">
                <!--备注————display使用 inline-block-->
                <div class="msg-box">
                    <div class="msg-box" style="display: none;">
                        <div class="msg-weak" style="display: inline-block;"> <i></i>
                            <div class="msg-cont">键盘大写锁定已打开，请注意大小写!</div>
                        </div>
                    </div>
                    <div class="msg-weak err-tips"  style="display:none;"><div>请输入密码</div></div>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="confirmPassword">确认密码：</label>
              	</span>
                <input   class="i-text" type="password" id="confirmPassword" name="confirmPassword">
                <!--备注————display使用 inline-block-->
                <div class="msg-box">
                    <div class="msg-weak err-tips"  style="display: none;"><div>密码不一样</div></div>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="email">邮箱：</label>
              	</span>
                <input   class="i-text" type="text" id="email" name="email">
                <!--备注————display使用 inline-block-->
                <div class="msg-box">
                    <div class="msg-weak err-tips"  style="display:none;"><div>邮箱不能为空</div></div>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="phone">手机号码：</label>
              	</span>
                <input   class="i-text" type="text" id="phone" name="phone">
                <!--备注————display使用 inline-block-->
                <div class="msg-box">
                    <div class="msg-weak err-tips"  style="display:none;"><div>手机号不能为空</div></div>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="agree"> </label>
              	</span>
                <div class="dag_biaod">
                    <input type="checkbox" value="english" id="agree" checked="checked">
                    阅读并同意
                    <a href="#" class="ftx-05 ml10">《猫猫新闻用户注册协议》</a>
                    <a href="#" class="ftx-05 ml10">《隐私协议》</a>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="submit"> </label>
              	</span>
                <input class="reg-btn" value="立即注册" type="submit" id="submit">
            </div>
        </div>
        </form>
        <div class="xiaogg">
            <img src="/static/images/cdsgfd.jpg">
        </div>
    </div>
</div>


<div class="jianj_dib jianj_dib_1">
    <div class="beia_hao">
        <p>京ICP备：123456789号  </p>
        <p class="gonga_bei">京公网安备：123456789号</p>
    </div>
</div>

</body>
</html>
