<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_鸾翔凤集</title>
    <meta name="keywords" content="尧舜禹_yaoteach_鸾翔凤集_优秀历史文章分享，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <link href="css/article.css" rel="stylesheet" type="text/css" media="all"/>


</head>

<body style="background: url(images/main/background.jpg)">

<jsp:include page="header.jsp"></jsp:include>
<div id="content">
    <div class="mainContent">
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
                <spring:message code="articleDetail.suppot"></spring:message> ${data.support}
                <a><span name="nonsupport" id="nonsupport"
                         class="f_left10 support glyphicon glyphicon-thumbs-down"></span></a>
                <spring:message code="articleDetail.Objection"></spring:message> ${data.nonsupport}
            </div>
            <div class="f_right">
                <span name="createTime" id="createTime"><spring:message code="articleDetail.pulish"></spring:message>
                    <fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span><br/>
            </div>
        </div>
        <hr/>
    </div>


    <!-- 聊天室 -->
    <div class="wow animate fadeInUp mainContent">
        <div>
            <h1><spring:message code="articleDetail.comment"></spring:message> </h1>
        </div>
        <div class="interaction" style="margin-top: 30px">
            <div id="main-content" class="conta iner">
                <div class="row">
                    <div class="col-md-12 addBorder">
                        <table id="conversation"  style="width: 98%;margin: 0 auto;" class="table table-striped">
                            <div style="margin-top: 30px;margin-bottom: 30px">
                                <c:if test="${empty  user}">
                                    <span class="glyphicon glyphicon-user f_left10 articleSpan"></span>
                                    <a><spring:message code="articleDetail.current"></spring:message> :游客</a>
                                </c:if>
                                <c:if test="${not empty  user}">
                                    <span class="glyphicon glyphicon-user articleSpan"></span>
                                    <a><spring:message code="articleDetail.current"></spring:message> :${user.nickname }</a>
                                </c:if>
                                <span class="glyphicon glyphicon-time f_left10 articleSpan"></span>
                                <a id="time"></a>
                                <span class="glyphicon glyphicon-globe f_left10 articleSpan"></span>
                                <a><spring:message code="articleDetail.population"></spring:message> :5</a>
                                <a style="float:right;color: #4D4DF9;"><spring:message code="articleDetail.welcome"></spring:message> </a>
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
                    <form class="form-inline" style="margin-bottom: 30px;float: right;">
                        <div class="form-group">
                            <input type="text" id="message" class="form-control" placeholder="<spring:message code="articleDetail.input"></spring:message>" style="width: 300px;height:30px;margin-right: 20px;padding-left: 20px;border: 1px solid #CCCCD0">
                        </div>
                        <button id="send" class="btn btn-default" type="submit" style="float: right;margin-right: 30px;height:30px;width: 80px;font-size: 6px;border: 1px solid #CCCCD0"><spring:message code="articleDetail.send"></spring:message> </button>
                    </form>
                </div>
            </div>
        </div>
        <div style="height: 100px"></div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<!-- 引入socket -->
<!--<script src="/webjars/jquery/jquery.min.js"></script>-->
<script src="webjars/sockjs-client/sockjs.min.js"></script>
<script src="webjars/stomp-websocket/stomp.min.js"></script>
<script src="js/socketApp.js"></script>
</body>
<script>
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