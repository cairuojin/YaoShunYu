<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹-开卷有益</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link href="/css/classical.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="/css/character.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>

    <div class="banner-bottom pt-section" data-name="about" id="ptsection-two"style="background-image: url(/images/main/leaves2.png);width: 100%;border:1px solid #CCCCCC;">
        <div class="container">
            <div class="about-grids">
                <div class="about-grid1">
                    <div class="col-md-6 about-grid-left">
                        <h3 class="title1">为什么要学习文言文</h3>
                        <p>文言文凝聚了中华民族的智慧和思想，是中华文化的宝藏。学习文言文，能使我们真切触摸到中国的气质。它们的智慧与价值，
                            并没有随着时光的流逝而暗淡，而是愈来愈发出其夺目的光辉，泽被后人。
                        </p>
                        <h4 class="title2">多读 多背 多练</h4>
                    </div>
                    <div class="col-md-6 about-grid-right">
                        <h4 class="title3">继承中华优秀传统文化</h4>
                        <h3 class="title4">文言文的重要性</h3>
                        <p>&nbsp;&nbsp;文言文是教与学的重点，更是高考的重点。在高考试卷中文言文阅读占的比例很大。教材中所选文言文都是文质兼美的经典篇章，
                            不但可以增加我知识，提高文言阅读能力，为写作提供丰富典型的素材，更能滋养我们的生命与灵魂。</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="section_heading myTitle1">
                        <div style="font-family: myFirstFont;font-size: 80px;color: #e67e22;">开卷有益</div>
                        <p style="margin-top: 30px;font-size: 16px;font-family: 微软雅黑;">读书之法，在循序而渐进，熟读而精思。——朱熹</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="background: url(/images/main/background.jpg)">
        <div class="clearfix"></div>
        <c:if test="${classicals.size() > 5}">
            <div style="background-image: url(/images/main/leaves1.png); background-repeat: no-repeat; background-position-x:left; background-position-y:bottom;background-size: 30%">
                <div>
                    <c:forEach items="${classicals}" var="classical" varStatus="i" begin="0" end="5">
                        <div class="classicalItem wow animate fadeInUp">
                            <div class="clearfix"></div>
                            <div class="classicalTitle">
                                <a href="/classicalDetail/${classical.id}">${classical.title}</a>
                            </div>
                            <div style="text-align: center;margin-top: 10px">
                                更新时间：
                                <fmt:formatDate value="${classical.lastupdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                <br>
                                <a><span name="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                                有${classical.simplenum}人认为该文章难度适中
                                <a><span name="nonsupport" class="f_left10 support glyphicon glyphicon-thumbs-down" style="margin-left: 30px"></span></a>
                                有${classical.hardnum}人认为该文章比较难
                            </div>
                            <div class="classicalIntroduce">
                                    ${classical.introduce}
                            </div>
                            <div class="classicalSearch">
                                <a href="/classicalDetail/${classical.id}">查看该文章</a>
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
                                <a>${classical.title}</a>
                            </div>
                            <div style="text-align: center;margin-top: 10px">
                                更新时间：
                                <fmt:formatDate value="${classical.lastupdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                <br>
                                <a><span name="support" id="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                                有${classical.simplenum}人认为该文章难度适中
                                <a><span name="nonsupport" id="nonsupport" class="f_left10 support glyphicon glyphicon-thumbs-down" style="margin-left: 30px"></span></a>
                                有${classical.hardnum}人认为该文章比较难
                            </div>
                            <div class="classicalIntroduce">
                                    ${classical.introduce}
                            </div>
                            <div class="classicalSearch">
                                <a>查看该文章</a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                </div>
                <div class="clearfix"></div>
            </div>
        </c:if>
        <c:if test="${classicals.size() <= 5}">
            <div style="background-image: url(/images/2.png); background-repeat: no-repeat; background-position-x:right; background-position-y:bottom;">
                <div style="margin-bottom: 30px;">
                    <c:forEach items="${classicals}" var="classical">
                        <div class="classicalItem wow animate fadeInUp">
                            <div class="clearfix"></div>
                            <div class="classicalTitle">
                                <a href="/classicalDetail/${classical.id}">${classical.title}</a>
                            </div>
                            <div style="text-align: center;margin-top: 10px">
                                更新时间：
                                <fmt:formatDate value="${classical.lastupdatetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                <br>
                                <a><span name="support" class="f_left10 support glyphicon glyphicon-thumbs-up"></span></a>
                                有${classical.simplenum}人认为该文章难度适中
                                <a><span name="nonsupport" class="f_left10 support glyphicon glyphicon-thumbs-down" style="margin-left: 30px"></span></a>
                                有${classical.hardnum}人认为该文章比较难
                            </div>
                            <div class="classicalIntroduce">
                                    ${classical.introduce}
                            </div>
                            <div class="classicalSearch">
                                <a href="/classicalDetail/${classical.id}">查看该文章</a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- 页码 -->
        <div class="container">
            <div class="col-md-9 product-left leftDiv">
                <div class="section" style="text-align: center">
                    <div class="container">
                        <div class="row">
                            <div id="store" class="col-md-9">
                                <div class="store-filter clearfix">
                                    <c:choose>
                                        <c:when test="${random == 0}">
                                            <span class="store-qty">读书患不多,思义患不明。——韩愈</span>
                                        </c:when>
                                        <c:when test="${random == 1}">
                                            <span class="store-qty">读书破万卷，下笔如有神。——杜甫</span>
                                        </c:when>
                                        <c:when test="${random == 2}">
                                            <span class="store-qty">三更灯火五更鸡，正是男儿读书时。——颜真卿</span>
                                        </c:when>
                                        <c:when test="${random == 3}">
                                            <span class="store-qty">人学始知道，不学非自然。——孟郊</span>
                                        </c:when>
                                        <c:when test="${random == 4}">
                                            <span class="store-qty">问渠那得清如许，为有源头活水来。——朱熹</span>
                                        </c:when>
                                    </c:choose>
                                    <br><br>
                                    <c:if test="${page == null}">
                                        <span aria-hidden="true"> <a href="${pageContext.request.contextPath }/classical?page=1" aria-label="Previous">取消搜索</a></span>
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
                    </div>
                </div>
            </div></div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="/js/jquery-2.2.4.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.singlePageNav.min.js"></script>
    <script src="/js/jquery.fancybox.pack.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.easing.min.js"></script>
    <script src="/js/jquery.slitslider.js"></script>
    <script src="/js/jquery.ba-cond.min.js"></script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>
