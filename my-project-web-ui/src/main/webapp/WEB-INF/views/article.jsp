<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>


<!--头部-->
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<%--</div>--%>
<!--简介-->
<link type="text/css" rel="stylesheet" href="/static/css/demo.css">
<%--<link rel="stylesheet" type="text/css" href="/static/houl/jquery.fancybox-1.3.4.css">
<link rel="stylesheet" type="text/css" href="/static/houl/style.css">--%>

<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/js/maxlength.js"></script>
<script type="text/javascript">
    $(function(){
        $("#praise").click(function(){
            var praise_img = $("#praise-img");
            var text_box = $("#add-num");
            var praise_txt = $("#praise-txt");
            var num=parseInt(praise_txt.text());
            if(praise_img.attr("src") == ("/static/images/yizan.png")){
                $(this).html("<img src='/static/images/zan.png' id='praise-img' class='animation' />");
                praise_txt.removeClass("hover");
                text_box.show().html("<em class='add-animation'>-1</em>");
                $(".add-animation").removeClass("hover");
                num -=1;
                praise_txt.text(num)
                $.post("/contentLike/getExdi",
                    {"userId":"${sessionScope.frontUser.id}","contentId":"${content.id}"},
                    function(data){
                        alert(data);
                    }

                )
            }else{
                $(this).html("<img src='/static/images/yizan.png' id='praise-img' class='animation' />");
                praise_txt.addClass("hover");
                text_box.show().html("<em class='add-animation'>+1</em>");
                $(".add-animation").addClass("hover");
                num +=1;
                praise_txt.text(num)

                $.post("/contentLike/getExdi",
                    {"userId":"${sessionScope.frontUser.id}","contentId":"${content.id}"},
                    function(data){
                        alert(data);
                    }

                )
            }
        });

    })
</script>
<div class="shangj_dianp_jiej">
    <div class="jianj_img" ></div>
    <div class="beij_center fl_01">
        <div class="jianj_text" style="width: 1400px; ">
            <div class="dianp_jianj" >
                <h2>${content.title}</h2>
                <div class="haod_kz" id="content_data" name="content_data"
                     style="height: 400px;width: 1400px;">
                    <div>
                        ${contentFile}
                    </div>
                </div>
                <div class="praise">
                    <span id="praise"><img src="/static/images/zan.png" id="praise-img"/></span>
                    <span id="praise-txt">${likeCount}</span>
                    <span id="add-num"><em>+1</em></span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tab_con">
    <div class="shangp_xiangq_right">
        <!---->
        <div class="slideTxtBox_1">
            <div class="bd">

                <!--商品评价-->
                <ul style="display: block;">
                    <div class="shouh_baoz_2" style="text-align: center">
                        <div class="mt"><h3>用户评论</h3></div>
                        <div class="tab_con" style="text-align: center">

                            <ol class="replyListWrap">
                                <c:forEach items="${commentList}" var="comment">
                                    <li class="oh_de">
                                            <%--<div class="reply-left">--%>
                                            <%--<p><a target="_blank" href="//review.gome.com.cn/P136937461.html">2017-09-22 12:44</a></p>--%>
                                            <%--</div>--%>
                                        <div class="reply-center" >
                                            <p>${comment.text}</p>
                                        </div>
                                        <div class="reply-right">
                                                <%--<div class="reply_avatar">--%>
                                                <%--<span class="reply_avatar_userName">祢夏了夏天</span>--%>
                                                <%--</div>--%>
                                                <%--<p class="profileGrade"><span class="viplevel">V2会员</span><span class="area">石家庄市</span></p>--%>
                                            <p class="profileGrade">${comment.user.userName}</p>
                                        </div>
                                    </li>

                                </c:forEach>
                            </ol>

                        </div>
                        <!---->
                        <div class="jkdhfld">
                            <div class="mt"><h3>发表评论</h3></div>
                            <div class="consult-rt">
                                <form action="/contentComment/getSaveComment" method="post" name="form1">
                                    <table class="consult-form">
                                        <tbody>
                                        <tr class="consul_type_wrap">

                                        </tr>

                                        <tr>
                                            <th>发表评论:&nbsp;</th>
                                            <td>
                                                <div class="txt-area-wrap">
                                                    <input type="hidden" name="user.id"
                                                           value="${sessionScope.frontUser.id}"/>
                                                    <input type="hidden" name="content.id" value="${content.id}"/>
                                                    <textarea name="text" class="txt-area" data-maxsize="200"
                                                              data-output="tips" style="width: 900px;height: 200px"></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th></th>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="consult-smt-btn redlink"
                                                   href="javascript:document.form1.submit();">提交</a><span class="tips"
                                                                                                          id="tips">0</span><span>/200</span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <div class="consult-lt">
                                </div>
                            </div>
                        </div>
                        <!---->
                    </div>
                </ul>
            </div>
        </div>
        <script type="text/javascript">jQuery(".slideTxtBox_1").slide({trigger: "click"});</script>
        <!---->
    </div>
</div>
<jsp:include page="/WEB-INF/views/includes/foot.jsp"></jsp:include>
</body>
</html>