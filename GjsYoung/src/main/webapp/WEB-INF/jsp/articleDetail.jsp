<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹-鸾翔凤集</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <script src="/js/jquery-1.11.1.min.js"></script>

    <%--<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">--%>
    <link href="/css/article.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">

    <!-- 引入socket -->
    <!--<script src="/webjars/jquery/jquery.min.js"></script>-->
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/js/socketApp.js"></script>
</head>

<body style="background: url(/images/main/background.jpg)">

<jsp:include page="header.jsp"></jsp:include>
<div id="content">
    <div id="mainContent">
        <section>
            <article class="blogPost">
                <header>
                    <h2>${data.title}</h2>
                </header>
                <div>
                    <p>${data.content}</p>
                </div>
            </article>
        </section>
        <div class="articleInfo clearfix">
            <div class="f_left">
                <a><span name="support" id="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                支持数${data.support}
                <a><span name="nonsupport" id="nonsupport"
                         class="f_left10 support glyphicon glyphicon-thumbs-down"></span></a>
                反对数${data.nonsupport}
            </div>
            <div class="f_right">
                <span name="createTime" id="createTime">发布于<fmt:formatDate value="${data.createTime}"
                                                                           pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span><br/>
            </div>
        </div>
        <hr/>
    </div>

    <div class="myTitle1" style="text-align: center">
        论今评古
    </div>

    <!-- 聊天室 -->
    <div class="interaction" style="margin-top: 30px">
        <div id="main-content" class="container">
            <div class="row">
                <div class="col-md-12 addBorder">
                    <table id="conversation" class="table table-striped">
                        <div style="margin-top: 30px;margin-bottom: 30px">
                            <c:if test="${empty  user}">
                                <span class="glyphicon glyphicon-user f_left10 articleSpan"></span>
                                <a>当前用户:游客</a>
                            </c:if>
                            <c:if test="${not empty  user}">
                                <span class="glyphicon glyphicon-user articleSpan"></span>
                                <a>当前用户:${user.nickname }</a>
                            </c:if>
                            <span class="glyphicon glyphicon-time f_left10 articleSpan"></span>
                            <a id="time"></a>
                            <span class="glyphicon glyphicon-globe f_left10 articleSpan"></span>
                            <a>在线人数:5</a>
                            <a style="float:right;color: #4D4DF9;">欢迎来到论今评古，请大家文明发言，营造绿色环境。</a>
                        </div>
                        <tbody id="greetings">
                        <c:forEach items="${ChatHistory}" var="chat">
                            <tr>
                                <td>
                                   ${chat}<br>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-12">
                <form class="form-inline" style="margin-left: 550px;margin-bottom: 30px;float: right;">
                    <div class="form-group">
                        <input type="text" id="message" class="form-control" placeholder="输入消息" style="width: 300px;height:30px;margin-right: 20px;padding-left: 20px;border: 1px solid #CCCCD0">
                    </div>
                    <button id="send" class="btn btn-default" type="submit" style="float: right;margin-right: 30px;height:30px;width: 60px;font-size: 6px;border: 1px solid #CCCCD0">发送</button>
                </form>
            </div>
        </div>
        <hr/>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
    $(function () {
        // alert("dfsd");
        // $("#greetings").append();
        <%--<c:forEach items="${ChatHistory}" var="chat">--%>
        <%--$("#greetings").append("<tr><td>" + chat.content.message + "</td></tr>");--%>
        <%--</c:forEach>--%>

    });

    function showTime() {
        nowtime = new Date();
        year = nowtime.getFullYear();
        month = nowtime.getMonth() + 1;
        date = nowtime.getDate();
        $("#time").html(nowtime.toLocaleTimeString('chinese',{hour12:false}));
    }

    setInterval("showTime()", 1);


</script>
</html>