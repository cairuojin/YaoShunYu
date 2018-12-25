<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_开卷有益</title>
    <meta name="keywords" content="尧舜禹_yaoteach_开卷有益_文言能力提升，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="/images/main/icon.jpg" type="image/x-icon">
    <link href="css/classical.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/character.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>

    <div class="banner-bottom pt-section" data-name="about" id="ptsection-two"style="background-image: url(images/main/leaves2.png);width: 100%;border:1px solid #CCCCCC;">
        <div class="container">
            <div class="about-grids">
                <div class="about-grid1">
                    <div class="col-md-6 about-grid-left">
                        <h3 class="title1"><spring:message code="classical.title1"></spring:message> </h3>
                        <p><spring:message code="classical.title2"></spring:message></p>
                        <h4 class="title2"><spring:message code="classical.title3"></spring:message></h4>
                    </div>
                    <div class="col-md-6 about-grid-right">
                        <h4 class="title3"><spring:message code="classical.title4"></spring:message></h4>
                        <h3 class="title4"><spring:message code="classical.title5"></spring:message></h3>
                        <p>&nbsp;&nbsp;<spring:message code="classical.title6"></spring:message></p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="section_heading myTitle1">
                        <div style="font-family: myFirstFont;font-size: 80px;color: #e67e22;"><spring:message code="header.classical"></spring:message> </div>
                        <p style="margin-top: 30px;font-size: 16px;font-family: 微软雅黑;"><spring:message code="classical.slogan"></spring:message> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="background: url(images/main/background.jpg)">
        <div class="clearfix"></div>
        <c:if test="${classicals.size() > 5}">
            <div style="background-image: url(images/main/leaves1.png); background-repeat: no-repeat; background-position-x:left; background-position-y:bottom;background-size: 30%">
                <div>
                    <c:forEach items="${classicals}" var="classical" varStatus="i" begin="0" end="5">
                        <div class="classicalItem wow animate fadeInUp">
                            <div class="clearfix"></div>
                            <div class="classicalTitle">
                                <a href="${pageContext.request.contextPath }/classicalDetail?classicalId=${classical.id}">${classical.title}</a>
                            </div>
                            <div style="text-align: center;margin-top: 10px">
                                <spring:message code="classical.updatetime"></spring:message> ：
                                <fmt:formatDate value="${classical.lastupdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                <br>
                                <a><span name="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                                ${classical.simplenum}<spring:message code="classical.easy"></spring:message>
                                <a><span name="nonsupport" class="f_left10 support glyphicon glyphicon-thumbs-down" style="margin-left: 30px"></span></a>
                                ${classical.hardnum}<spring:message code="classical.difficult"></spring:message>
                            </div>
                            <div class="classicalIntroduce">
                                    ${classical.introduce}
                            </div>
                            <div class="classicalSearch">
                                <a href="${pageContext.request.contextPath }/classicalDetail?classicalId=${classical.id}"><spring:message code="classical.viewArticle"></spring:message> </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="classicalBackgroound">
                <div style="margin-bottom: 30px;">
                    <c:forEach items="${classicals}" var="classical" varStatus="i" begin="6" end="${classicals.size()}">
                        <div class="classicalItem wow animate fadeInUp">
                            <div class="clearfix"></div>
                            <div class="classicalTitle">
                                <a href="${pageContext.request.contextPath }/classicalDetail?classicalId=${classical.id}">${classical.title}</a>
                            </div>
                            <div style="text-align: center;margin-top: 10px">
                                <spring:message code="classical.updatetime"></spring:message>：
                                <fmt:formatDate value="${classical.lastupdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                <br>
                                <a><span name="support" id="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                                ${classical.simplenum}<spring:message code="classical.easy"></spring:message>
                                <a><span name="nonsupport" id="nonsupport" class="f_left10 support glyphicon glyphicon-thumbs-down" style="margin-left: 30px"></span></a>
                                ${classical.hardnum}<spring:message code="classical.difficult"></spring:message>
                            </div>
                            <div class="classicalIntroduce">
                                    ${classical.introduce}
                            </div>
                            <div class="classicalSearch">
                                <a href="${pageContext.request.contextPath }/classicalDetail?classicalId=${classical.id}"><spring:message code="classical.viewArticle"></spring:message></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                </div>
                <div class="clearfix"></div>
            </div>
        </c:if>
        <c:if test="${classicals.size() <= 5}">
            <div style="background-image: url(images/2.png); background-repeat: no-repeat; background-position-x:right; background-position-y:bottom;">
                <div style="margin-bottom: 30px;">
                    <c:forEach items="${classicals}" var="classical">
                        <div class="classicalItem wow animate fadeInUp">
                            <div class="clearfix"></div>
                            <div class="classicalTitle">
                                <a href="${pageContext.request.contextPath }/classicalDetail?classicalId=${classical.id}">${classical.title}</a>
                            </div>
                            <div style="text-align: center;margin-top: 10px">
                                <spring:message code="classical.updatetime"></spring:message>：
                                <fmt:formatDate value="${classical.lastupdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                <br>
                                <a><span name="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                                ${classical.simplenum}<spring:message code="classical.easy"></spring:message>
                                <a><span name="nonsupport" class="f_left10 support glyphicon glyphicon-thumbs-down" style="margin-left: 30px"></span></a>
                                ${classical.hardnum}<spring:message code="classical.difficult"></spring:message>
                            </div>
                            <div class="classicalIntroduce">
                                    ${classical.introduce}
                            </div>
                            <div class="classicalSearch">
                                <a href="${pageContext.request.contextPath }/classicalDetail?classicalId=${classical.id}"><spring:message code="classical.viewArticle"></spring:message></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 页码 -->
        <div class="container">
            <div class="leftDiv">
                <div class="row section" style="text-align: center">
                            <div id="store">
                                <div class="store-filter clearfix">
                                    <c:choose>
                                        <c:when test="${random == 0}">
                                            <span class="store-qty"><spring:message code="celebrity.slogan2"></spring:message> </span>
                                        </c:when>
                                        <c:when test="${random == 1}">
                                            <span class="store-qty"><spring:message code="celebrity.slogan3"></spring:message></span>
                                        </c:when>
                                        <c:when test="${random == 2}">
                                            <span class="store-qty"><spring:message code="celebrity.slogan4"></spring:message></span>
                                        </c:when>
                                        <c:when test="${random == 3}">
                                            <span class="store-qty"><spring:message code="celebrity.slogan5"></spring:message></span>
                                        </c:when>
                                        <c:when test="${random == 4}">
                                            <span class="store-qty"><spring:message code="celebrity.slogan6"></spring:message></span>
                                        </c:when>
                                    </c:choose>
                                    <br><br>
                                    <c:if test="${page == null}">
                                        <span aria-hidden="true"> <a href="${pageContext.request.contextPath }/classical?page=1" aria-label="Previous"><spring:message code="celebrity.nosearch"></spring:message> </a></span>
                                    </c:if>

                                    <c:if test="${page != null}">
                                        <ul class="store-pagination">
                                            <c:if test="${page==1 }">
                                                <li class="disabled" ><a href="javascript:void(0)" aria-label="Previous">
                                                    <span aria-hidden="true">≙</span></a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page!=1 }">
                                                <li><a href="${pageContext.request.contextPath }/classical?page=1" aria-label="Previous">
                                                    <span aria-hidden="true">≙</span></a>
                                                </li>
                                            </c:if>

                                            <c:forEach begin="1" end="${totalPage }" var="current">
                                                <c:if test="${page==current }">
                                                    <li class="active">${current}&nbsp;</li>
                                                </c:if>
                                                <c:if test="${page!=current }">
                                                    <li><a href="${pageContext.request.contextPath }/classical?page=${current}">${current}&nbsp;</a></li>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${page==totalPage }">
                                                <li class="disabled"><a href="javascript:void(0)" aria-label="Next">
                                                    <span aria-hidden="true">≚</span></a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page!=totalPage }">
                                                <li><a href="${pageContext.request.contextPath }/classical?page=${page+1}" aria-label="Next">
                                                    <span aria-hidden="true">≚</span></a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </c:if>
                            </div>
                    </div>
                </div>
            </div></div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
