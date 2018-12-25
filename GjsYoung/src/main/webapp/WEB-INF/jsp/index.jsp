<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html >
<html>
<head>
    <meta name="baidu-site-verification" content="BgzDAdNjvW"/>
    <meta name="baidu-site-verification" content="P3fhdeuY8D"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <title>尧舜禹(yaoteach)-优秀历史学习平台_启发智能,感动人心</title>
    <meta name="keywords" content="尧舜禹_yaoteach_历史知识_博古通今_开卷有益_鸾翔凤集_觥筹交错_历史知识学习平台">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/animate.css"/>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="banner banner-bg">

    <!-- 大图 -->
    <div class="banner-grids">
        <div class="container">
            <div style="margin:100px auto;width: 400px;height: 400px" class="IndexLogo">
                <img src="images/30.png" id="pic" style="display:none">
            </div>
            <div class="banner-top-grids">
                <div class="top-grids">
                    <div class="col-md-6 banner-grid" style="padding-right: 25px;padding-left: 25px;">
                        <div class="banner-left-grid blue">
                            <div class="banner-left-icon">
                                <div class="services-icon">
                                    <span class="glyphicon glyphicon-glass" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="banner-grid-info">
                                <h3 style="font-family: 微软雅黑;"><spring:message code="index.title1"></spring:message> </h3>
                                <p style="font-family: 微软雅黑;">
                                    <spring:message code="index.content1"></spring:message>
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-6 banner-grid">
                        <div class="banner-left-grid green">
                            <div class="banner-left-icon">
                                <div class="services-icon">
                                    <span class="glyphicon glyphicon-glass glyphicon-cog" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="banner-grid-info">
                                <h3 style="font-family: 微软雅黑;"><spring:message code="index.title2"></spring:message> </h3>
                                <p style="font-family: 微软雅黑;">
                                    <spring:message code="index.content2"></spring:message>
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 树叶部分 -->
<div class="welcome" style="background-size: 500px;background-image: url(images/main/leaves2.png);width: 100%">
    <div class="container wow animate fadeInUp">
        <div class="welcome-info">
            <div class="bigTitle"><spring:message code="index.domain"></spring:message> </div>
            <h5 style="font-family: 微软雅黑;"><spring:message code="index.zhuangzi"></spring:message> </h5>
            <p style="font-family: 微软雅黑;"><spring:message code="index.content3"></spring:message> </p>
        </div>
    </div>
</div>


<div style="background: url(images/main/background.jpg);border-top: 1px solid #d4faff">
    <div style="background-color: rgba(49, 204, 251, 0.05);width: 100%;text-align: center">
        <div class="clearfix" style="height: 50px"></div>
        <div class="container">
            <div class="row">
                <div style="height: 50px"></div>
                <div class="sec-title">
                    <h2 class="wow animated bounceInLeft"><spring:message code="index.core"></spring:message> </h2>
                    <p class="wow animated bounceInRight"><a><spring:message code="index.domain"></spring:message></a><spring:message code="index.coreContent"></spring:message> </p>
                </div>
                <div class="sec-title">
                    <h1 class="wow animated bounceInLeft"><spring:message code="index.goal"></spring:message></h1>
                    <h5 style="font-size: 40px">·</h5>
                    <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));">
                </div>
                <div class=" wow animate fadeInUp">
                    <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" style="height: 340px;">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </div>
                            <h3><spring:message code="index.goal1"></spring:message></h3>
                            <p>&nbsp;&nbsp;<spring:message code="index.goalContent1"></spring:message></p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.6s" style="height: 340px;">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="glyphicon glyphicon-th"></i>
                            </div>
                            <h3><spring:message code="index.goal2"></spring:message></h3>
                            <p>&nbsp;&nbsp;<spring:message code="index.goalContent2"></spring:message></p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.3s" style="height: 340px;">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="glyphicon glyphicon-cloud "></i>
                            </div>
                            <h3><spring:message code="index.goal3"></spring:message></h3>
                            <p>&nbsp;&nbsp;<spring:message code="index.goalContent3"></spring:message></p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 text-center wow animated zoomIn" data-wow-delay="0.9s" style="height: 340px;">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="glyphicon glyphicon-home"></i>
                            </div>
                            <h3><spring:message code="index.goal4"></spring:message></h3>
                            <p>&nbsp;&nbsp;<spring:message code="index.goalContent4"></spring:message></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix" style="height: 100px"></div>
    </div>


    <!-- 数字部分 -->
    <div class="numberChange clearfix wow animate fadeInUp">
        <div class="fact-counter">
            <div class="clearfix">
                <div class="inner-column counter-column wow fadeIn" data-wow-delay="10ms">
                    <div class="inner">
                        <div class="count-outer">
                            <a class="count-text" data-speed="2200" data-stop="${celebrityNum}">0</a>
                        </div>
                        <h4 class="counter-title"><spring:message code="index.roll1"></spring:message> </h4>
                    </div>
                </div>

                <div class="inner-column light-bg counter-column wow fadeIn" data-wow-delay="0ms">
                    <div class="inner">
                        <div class="count-outer">
                            <a class="count-text" data-speed="2400" data-stop="${articleNum}">0</a>
                        </div>
                        <h4 class="counter-title"><spring:message code="index.roll2"></spring:message></h4>
                    </div>
                </div>

                <div class="inner-column counter-column wow fadeIn" data-wow-delay="0ms">
                    <div class="inner">
                        <div class="count-outer">
                            <a class="count-text" data-speed="2000" data-stop="${visitNum}">0</a>
                        </div>
                        <h4 class="counter-title"><spring:message code="index.roll3"></spring:message></h4>
                    </div>
                </div>

                <div class="inner-column light-bg counter-column wow fadeIn" data-wow-delay="0ms">
                    <div class="inner">
                        <div class="count-outer">
                            <a class="count-text" data-speed="2600" data-stop="${userNum}">0</a>
                        </div>
                        <h4 class="counter-title"><spring:message code="index.roll4"></spring:message></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="work">
        <div class="container wow animate fadeInUp">
            <div class="work-grids">
                <div class="bigTitle1"><spring:message code="header.celebrity"></spring:message> </div>
                <p style="font-size: 60px;width:30px;height:30px;margin: 0 auto">·</p>
                <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));">
                <div style="height: 50px"></div>
                <div class="work-grids-top">
                    <div class="col-md-4 work-grid-left" style="border-radius: 50px 0px 0px 0px;">
                        <h5><spring:message code="index.celebrity1"></spring:message> </h5>
                        <p><spring:message code="index.celebrityContent1"></spring:message> </p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/1"><spring:message code="index.learnMore"></spring:message> </a>
                    </div>
                    <div class="col-md-4 work-grid-middle" style="padding-right: 0;padding-left: 0;">
                        <a href="#"><img src="images/index/caocao.jpg"></a>
                    </div>
                    <div class="col-md-4 work-grid-left" style="border-radius: 0px 50px 0px 0px;">
                        <h5><spring:message code="index.celebrity2"></spring:message> </h5>
                        <p><spring:message code="index.celebrityContent2"></spring:message></p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/52"><spring:message code="index.learnMore"></spring:message></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="work-grids-top">
                    <div class="col-md-4 work-grid-middle" style="padding-right: 0;padding-left: 0;">
                        <img src="images/index/qinshihuang.jpg">
                    </div>
                    <div class="col-md-4 work-grid-left">
                        <h5><spring:message code="index.celebrity3"></spring:message> </h5>
                        <p><spring:message code="index.celebrityContent3"></spring:message> </p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/40"><spring:message code="index.learnMore"></spring:message></a>
                    </div>
                    <div class="col-md-4 work-grid-middle" style="padding-right:0;padding-left:0;">
                        <img src="images/index/lishiming.jpg">
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="work-grids-top">
                    <div class="col-md-4 work-grid-left" style="border-radius: 0px 0px 0px 50px;">
                        <h5><spring:message code="index.celebrity4"></spring:message> </h5>
                        <p><spring:message code="index.celebrityContent4"></spring:message></p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/18"><spring:message code="index.learnMore"></spring:message></a>
                    </div>
                    <div class="col-md-4 work-grid-middle"
                         style="padding-right: 0;padding-left: 0;border-radius: 0px 0px 100px 0px;">
                        <img src="images/index/wuzetian.jpg" style="height: 348px;">
                    </div>
                    <div class="col-md-4 work-grid-left" style="border-radius: 0px 0px 50px 0px;">
                        <h5><spring:message code="index.celebrity5"></spring:message> </h5>
                        <p><spring:message code="index.celebrityContent5"></spring:message></p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/41"><spring:message code="index.learnMore"></spring:message></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div style="height: 30px"></div>
            <div class="recommend" align="center">
                <a class="recommendFont" href="${pageContext.request.contextPath }/celebrity?page=1"><spring:message code="index.moreCelebrity"></spring:message> </a>
            </div>
        </div>
    </div>
    <div style="height: 200px"></div>
    <div class="news wow animate fadeInUp">
        <div class="bigTitle1"><spring:message code="header.article"></spring:message> </div>
        <p style="font-size: 60px;width:30px;height:30px;margin: 0 auto">·</p>
        <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));">
        <div class="container">
            <div class="news-grids">
                <div class="col-md-6 news-grid">
                    <img src="images/index/yongantuogu.jpg" class="articleImg"/>
                    <div class="news-grid-info">
                        <a href="${pageContext.request.contextPath }/articleDetail/103"><spring:message code="index.article1"></spring:message> </a>
                        <p class="date">2018-09-11 16:26:08</p>
                        <p class="text">&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="index.articleContent2"></spring:message></p>
                    </div>
                </div>
                <div class="col-md-6 news-grid">
                    <img src="images/index/libaihedufu.jpg" class="articleImg"/>
                    <div class="news-grid-info">
                        <a href="${pageContext.request.contextPath }/articleDetail/20"><spring:message code="index.article2"></spring:message></a>
                        <p class="date">2018-09-11 16:42:31</p>
                        <p class="text">&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="index.articleContent2"></spring:message> </p>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div style="height: 30px"></div>
                <div class="recommend" align="center">
                    <a class="recommendFont" href="${pageContext.request.contextPath }/atricle?page=1"><spring:message code="index.moreArticle"></spring:message> </a>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="margin-top: 140px;margin-bottom: 100px;">
        <hr>
        <div class="row text-center">
            <div class="footer-content">
                <div class="wow animated flipInY">
                    <p><spring:message code="index.recommend1"></spring:message> </p>
                    <p><spring:message code="index.recommend2"></spring:message> </p>
                </div>
                <form action="#" method="post" class="subscribe-form wow animated flipInY">
                    <div class="input-field">
                        <input type="text" class="subscribe form-control" placeholder="<spring:message code="index.recommend3"></spring:message>">
                        <button type="submit" class="submit-icon" title="<spring:message code="index.recommend4"></spring:message>">
                            <i class="glyphicon glyphicon-send" ></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="yqlj clear">
        <div class="yqljtitle"><spring:message code="index.FriendshipLink"></spring:message></div>
        <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(45,97,199,0.75), rgba(0, 0, 0, 0));">
        <div class="clear">
            <a href="http://www.lishichunqiu.com" target="_blank">历史春秋网</a>
            <a href="http://www.hxlsw.com/pic/" target="_blank">老照片</a>
            <a href="http://www.lsqn.cn/" target="_blank">历史千年</a>
            <a href="http://www.baijiajiangtan.org" target="_blank">百家讲坛</a>
            <a href="http://www.artx.cn" target="_blank">艺术中国</a>
            <a href="http://www.gpnu.edu.cn/" target="_blank">广东技术师范大学</a>
            <a href="http://jky.gpnu.edu.cn/" target="_blank">教育科学与技术学院</a>
            <a href="http://www.yaoteach.com:8081/GjsYoung-admin">管理系统</a>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clearfix"></div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
    $(function () {
        $("#pic").fadeToggle(3000);
    });

    function fadeOutDisplay() {
        $("#pic").fadeOut(1000);
    }

    function fadeInDisplay() {
        $("#pic").fadeIn(1000);
    }
</script>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>

</html>
