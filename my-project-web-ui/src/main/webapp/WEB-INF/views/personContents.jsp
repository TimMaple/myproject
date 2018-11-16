<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.net.InetAddress"%>

<%
    InetAddress address = InetAddress.getLocalHost();
    String ip=address .getHostAddress().toString();
    pageContext.setAttribute("ip",ip);
%>
<html>
<!--头部-->
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
</div>
<div class="chengc_jvz">
    ${result.message}
    <div class="slideTxtBox">
        <div class="hd">
            <h1>
                <%--<p>${category.name}</p>--%>
                <%--<p class="yingw_">${category.name}</p>--%>
            </h1>
        </div>
        <div class="bd">
            <ul>
                <div class="louc_tup_qieh">
                    <div class="js-silder ws-slider">
                        <div class="silder-main-img">
                            <%--<a href="#"><img src="/static/images/liuceng_1.jpg" alt=""></a>--%>
                        </div>

                        <div class="js-silder-ctrl">
                            <span class="silder-ctrl-prev"></span>
                            <span class="silder-ctrl-next"></span>
                        </div>
                    </div>
                </div>
                <div class="you_lirb">
                    <c:choose>
                        <c:when test="${not empty result.data}">
                            <div class="shang_buf">
                                <c:forEach items="${result.data}" begin="0" end="3" var="content">
                                    <div class="you_shangp_lieb ">
                                        <a href="#"><img class="you_tup_k" src="http://localhost:8081/content/getPic?filename=${content.pic1}"></a></br>
                                        <a href="/content/getById?id=${content.id}" class="_you_neir_biaot">${content.title}</a></br></br>
                                        <a href="/content/delete?id=${content.id}&author=${sessionScope.frontUser.userName}">删除文章</a>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h1>你还没有发布过文章哦!!</h1>
                        </c:otherwise>
                    </c:choose>
                    <div class="xia_buf">
                        <c:forEach items="${result.data}" begin="4">
                            <div class="you_shangp_lieb">
                                <a href="#"><img  class="you_tup_k" src="/static/images/yic_001.jpg">${content.pic2}</a>
                                <a href="/content/getById?id=${content.id}" class="_you_neir_biaot">${content.title}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">jQuery(".slideTxtBox").slide();</script>

<jsp:include page="/WEB-INF/views/includes/foot.jsp"></jsp:include>
</body>
</html>
