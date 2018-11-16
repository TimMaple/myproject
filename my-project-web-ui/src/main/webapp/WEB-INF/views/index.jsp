
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.InetAddress"%>

<%
    InetAddress address = InetAddress.getLocalHost();
    String ip=address .getHostAddress().toString();
    pageContext.setAttribute("ip",ip);
%>
<html>
<!--头部-->
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>

<!--左边导航-->
<div class="dd-inner">
    <%--<c:forEach items="${categoryList}" var="category" varStatus="status">--%>
        <div class="font-item">
            <div class="item fore1 " id="fatherDiv1">
                <h3>
                    <input type="hidden" value="28" id="subDiv1">
                    <a class="da_zhu " href="#">体育</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item1">
                </div>
            </div>
        </div>


        <div class="font-item">
            <div class="item fore1" id="fatherDiv2">
                <h3>
                    <input type="hidden" value="34" id="subDiv2">
                    <a class="da_zhu" href="#">游戏</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item2">
                </div>
            </div>
        </div>


        <div class="font-item">
            <div class="item fore1" id="fatherDiv3">
                <h3>
                    <input type="hidden" value="40" id="subDiv3">
                    <a class="da_zhu" href="#">社会焦点</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item3">
                </div>
            </div>
        </div>


        <div class="font-item">
            <div class="item fore1" id="fatherDiv4">
                <h3>
                    <input type="hidden" value="65" id="subDiv4">
                    <a class="da_zhu " href="#">搞笑</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item4">
                </div>
            </div>
        </div>


        <div class="font-item">
            <div class="item fore1" id="fatherDiv5">
                <h3>
                    <input type="hidden" value="67" id="subDiv5">
                    <a class="da_zhu " href="#">科技</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item5">
                </div>
            </div>
        </div>

        <div class="font-item">
            <div class="item fore1" id="fatherDiv6">
                <h3>
                    <input type="hidden" value="68" id="subDiv6">
                    <a class="da_zhu " href="#">财经</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item6">
                </div>
            </div>
        </div>
        <div class="font-item">
            <div class="item fore1" id="fatherDiv7">
                <h3>
                    <input type="hidden" value="69" id="subDiv7">
                    <a class="da_zhu " href="#">娱乐</a>
                </h3>
                <i>&gt;</i>
            </div>
            <div class="font-item1">
                <div class="subDiv" id="font-item7">
                </div>
            </div>
        </div>
</div>
    <%--</c:forEach>--%>

</div>
</div>
</div>

<!--轮播图-->
<div id="lunbo">
        <ul id="one">
            <c:forEach items="${lunboList}" var="lunbo" varStatus="status">
                    <li><a href="/content/getById?id=${lunbo.id}"><img src="http://localhost:8081/content/getPic?filename=${lunbo.pic1} " style="height: 451px;width: 1920px"></a></li>
            </c:forEach>
        </ul>
        <ul id="two">
            <c:forEach items="${lunboList}" varStatus="status">
                <li>${status.index}</li>
            </c:forEach>
        </ul>
    <!--轮播图左右箭头-->
    <div class="slider-page">
        <a href="javascript:void(0)" id="left"><</a>
        <a href="javascript:void(0)" id="right">></a>
    </div>
</div>


<div class="tes_shnagp_beij">
    <div class="tes_shangp">
        <div class="neir_biaot">
            <p>热点新闻</p>
            <%--<p class="yingw">Top 5</p>--%>
            <%--<a href="#">MORE+</a>--%>
        </div>
        <div>
            <c:forEach items="${allList}" var="content">
                <h3><a href="/content/getById?id=${content.id}" style="color: blue"> ${content.title}</a></h3><br/>
            </c:forEach>
        </div>
    </div>

    <div class="rem_shangp" >
        <div class="neir_biaot">
            <%--<p>个人信息</p>--%>
        </div>
       <span style="font-size: 30px;text-align: center"> 　　 　　　用户:　${sessionScope.frontUser.userName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br/><br/>
        <%--<span style="font-size: 20px">邮箱：${sessionScope.frontUser.email}</span><br/>--%>
        <a href="/content/getForm" style="font-size: 10px;color: blue"><img src="/static/images/write.jpg" width="476px"></a>
        <a href="/content/getByUserName?author=${frontUser.userName}"><img src="/static/images/MyText.jpg" alt="加载失败" style="width: 476px;height: 88px"></a>
    </div>
    <%--&lt;%&ndash;上传文章连接&ndash;%&gt;--%>
    <%--<div class="rem_shangp">--%>
        <%--<a href="/content/getForm" style="font-size: 10px;color: blue"><img src="/static/images/write.jpg" width="476px"></a>--%>
    <%--</div>--%>
    <div class="neir_biaot">
        <p>热搜</p>
        <p class="yingw">top5</p>
        <%--<a href="#">MORE+</a>--%>
    </div>
    <div class="rem_shangp_beij_k">
        <!---->
        <div class="picScroll_left">

            <div>
                <ul>
                    <c:forEach items="${topList}" var="top" >
                        <li>
                            <div class="title"><span><a href="/content/getById?id=${top.id}" target="_blank" style="color: blue">${top.title}</a></span></div></br>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
        <!---->
    </div>
</div>
</div>
<div class="kuanjlan">
    <ul class="clearfix">
        <li>
            <div class="list-li-box">
                <a class="list-img" href="https://www.bilibili.com/read/cv1408011?from=1002&spm_id_from=333.334.chief_recommend.5" data-code="index01004-1" target="_blank">
                    <img src="/static/images/ad1.png">
                    <span class="list-bg"></span>
                    <div class="list-cont">
                        <p class="cont-item"><span></span></p>
                        <p class="cont-tile">S8半决赛总结</p>
                        <p class="cont-info">恭喜IG！</p>
                    </div>
                </a>
            </div>

        </li>
        <li>
            <div class="list-li-box">
                <a class="list-img" href="https://www.bilibili.com/blackboard/2018halloween.html?spm_id_from=333.334.primary_menu.106" data-code="index01004-2" target="_blank">
                    <img src="/static/images/ad2.jpg">
                    <span class="list-bg"></span>
                    <div class="list-cont">
                        <p class="cont-item"><span></span></p>
                        <p class="cont-tile">万圣节</p>
                        <p class="cont-info">trick or treat!</p>
                    </div>
                </a>
            </div>

        </li>
        <li>
            <div class="list-li-box">
                <a class="list-img" href="https://www.bh3.com/" data-code="index01004-3" target="_blank">
                    <img src="/static/images/ad3.jpg">
                    <span class="list-bg"></span>
                    <div class="list-cont">
                        <p class="cont-item"><span></span></p>
                        <p class="cont-tile">崩坏3</p>
                        <p class="cont-info">点燃ACT动作之魂！</p>
                    </div>
                </a>
            </div>

        </li>
        <li>
            <div class="list-li-box">
                <a class="list-img" href="https://www.bilibili.com/blackboard/activity-bigwriter.html?spm_id_from=333.334.chief_recommend.9" data-code="index01004-4" target="_blank">
                    <img src="/static/images/ad4.jpg">
                    <span class="list-bg"></span>
                    <div class="list-cont">
                        <p class="cont-item"><span></span></p>
                        <p class="cont-tile">写专栏</p>
                        <p class="cont-info">瓜分现金大奖</p>
                    </div>
                </a>
            </div>
        </li>
    </ul>
</div>
<div class="guangg_tu">
    <a href="https://spread.izaodao.com/T/Promotion/index/activity/bilibili03-pc/tag/BL-PC-spcs1824-zytl101601"><img src="/static/images/guang_tu1.jpg"></a>
</div>
<script type="text/javascript">
    jQuery(".picScroll_left").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:2 ,trigger:"click"});

    $("#fatherDiv1").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv1").val()}
            ,function(data){
                console.log(data)

                $("#font-item1").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item1").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
    $("#fatherDiv2").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv2").val()}
            ,function(data){
                console.log(data)

                $("#font-item2").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item2").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
    $("#fatherDiv3").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv3").val()}
            ,function(data){
                console.log(data)

                $("#font-item3").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item3").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
    $("#fatherDiv4").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv4").val()}
            ,function(data){
                console.log(data)

                $("#font-item4").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item4").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
    $("#fatherDiv5").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv5").val()}
            ,function(data){
                console.log(data)

                $("#font-item5").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item5").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
    $("#fatherDiv6").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv6").val()}
            ,function(data){
                console.log(data)
                $("#font-item6").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item6").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
    $("#fatherDiv7").hover(function(){
        $.get("/category/getByParentIdAjax",
            {"id":$("#subDiv7").val()}
            ,function(data){
                console.log(data)

                $("#font-item7").children('dl').remove();
                for (let i = 0; i < data.length; i++) {
                    $("#font-item7").append("<dl class='fore1'><dt><a href='/content/getByParentId?id="+data[i].id+"' style='font-size: 20px'>"+data[i].name+"</a></dt><dt><a>&nbsp;</a></dt></dl>")
                }
            },"json");
    })
</script>


<jsp:include page="/WEB-INF/views/includes/foot.jsp"></jsp:include>








</body>
</html>
