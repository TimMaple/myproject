<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<!--头部-->
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
</div>
<!---->
<script type="text/javascript" src="/static/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.SuperSlide.2.1.1.source.js"></script>
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
                email:{
                    required:true,
                    email:true
                },
                phone:{
                    required:true
                },
                password:{
                    required:true
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
                }
            }

        });

    });
</script>
<div class="wod_tongc_zhongx">
    <div class="beij_center">
        <div class="myGomeWeb">
            <!--左边内容-->
            <div class="mod_main">
                <div class="jib_xinx_kuang">
                    <div class="wt">
                        <ul>
                            <li class="dangq_hongx"><a href="ger_xinx.html">个人信息</a></li>
                        </ul>
                    </div>
                    <div class="wd">
                        <div class="user_set">
                            <form action="/user/updateUser" method="post" id="myform">
                                <div class="item_meic">
                                    <span class="label_meic"> </span>
                                    <div class="fl_e">
                                        <h2>${result.message}</h2>
                                    </div>
                                </div>


                            <div class="item_meic">

                                <span class="label_meic"><em>*</em> 用户名：</span>
                                <div class="fl_e">
                                    <input type="hidden" value="${result.data.id}" name="id">
                                    <input type="text" class="user_address" name="userName" id="username" readonly="readonly" value="${result.data.userName}">
                                </div>
                            </div>
                            <%--<div class="item_meic">--%>
                                <%--<span class="label_meic"><em>*</em> 密码：</span>--%>
                                <%--<div class="fl_e">--%>
                                    <%--<input type="text"  class="user_address" name="password" id="password" value="${result.data.password}">--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <div class="item_meic">
                                <span class="label_meic"><em>*</em> 邮箱：</span>
                                <div class="fl_e">
                                    <input type="text" class="user_address" name="email" id="email" value="${result.data.email}">
                                </div>
                            </div>
                            <div class="item_meic">
                                <span class="label_meic"><em>*</em> 电话号码：</span>
                                <div class="fl_e">
                                    <input type="text"  class="user_address" name="phone" id="phone" value="${result.data.phone}">
                                </div>
                            </div>
                            <div class="item_meic">
                                <span class="label_meic"> </span>
                                <div class="fl_e">
                                    <input type="submit" value="保存" class="savebtn">
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $("#date").selectDate()

        $("#days").focusout(function(){
            var year = $("#year option:selected").html()
            var month = $("#month option:selected").html()
            var day = $("#days option:selected").html()
            console.log(year+month+day)
        })

    })

</script>
<!--底部-->
<jsp:include page="/WEB-INF/views/includes/foot.jsp"></jsp:include>


</body>
</html>
