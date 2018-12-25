<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_觥筹交错</title>
    <meta name="keywords" content="尧舜禹_yaoteach_觥筹交错_让历史学习乐在其中，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link href="css/entertainment.css" rel="stylesheet" type="text/css" media="all">


</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="banner-bottom pt-section" data-name="about" id="ptsection-two"
     style="background-size:cover;background-image: url(images/main/entertainment1.png);height: 500px;border:1px solid #CCCCCC;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section_heading">
                    <div class="myTitle">
                        <div class="imabackground"></div>
                        <div><spring:message code="header.entertainment"></spring:message></div>
                        <p style="font-family: 微软雅黑; font-size: 16px; color: black;margin-top: 30px"><spring:message
                                code="entertainment.slogan1"></spring:message></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="background: url(images/main/background.jpg)">
    <div class="singleEntertainment  wow animate fadeInUp">
        <div class="col-grid-left">
            <h3><spring:message code="entertainment.slogan2"></spring:message> </h3>
            <p>
                <spring:message code="entertainment.content"></spring:message>
            </p>
        </div>
        <div class="col-md-6 col-grid-right agile-info-wthree ">
            <div class="col-md-6 col-grid-1">
                <div class="col-1 bottom">
                    <div class="col-1-top">
                        <img src="images/entertainment/module1.png" class="img-responsive" href="">
                    </div>
                    <div class="col-1-bottom">
                        <div class="info-text">
                            <h3 style="color: white"><spring:message code="entertainment.t1"></spring:message> </h3>
                            <p><spring:message code="entertainment.tContent1"></spring:message> </p>
                            <button href="" class="singleButton"><spring:message code="entertainment.experience"></spring:message> </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-grid-1">
                <div class="col-1 bottom">
                    <div class="col-1-top">
                        <a href="${pageContext.request.contextPath }/entertainmentFuse"><img
                                src="images/entertainment/module2.png" class="img-responsive"></a>
                    </div>
                    <div class="col-1-bottom">
                        <div class="info-text">
                            <a href="${pageContext.request.contextPath }/entertainmentFuse">
                                <h3 style="color: white"><spring:message code="entertainment.t2"></spring:message></h3>
                                <p style="color: white"><spring:message code="entertainment.tContent2"></spring:message></p>
                                <button class="singleButton"><spring:message code="entertainment.experience"></spring:message></button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-grid-1">
                <div class="col-1 bottom">
                    <div class="col-1-top">
                        <img src="images/entertainment/module3.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-1-bottom">
                        <div class="info-text">
                            <h3 style="color: white"><spring:message code="entertainment.t3"></spring:message></h3>
                            <p><spring:message code="entertainment.tContent3"></spring:message></p>
                            <button href="" class="singleButton"><spring:message code="entertainment.experience"></spring:message></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-grid-1">
                <div class="col-1 bottom">
                    <div class="col-1-top">
                        <img src="images/entertainment/module4.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-1-bottom">
                        <div class="info-text">
                            <h3 style="color: white"><spring:message code="entertainment.t4"></spring:message></h3>
                            <p><spring:message code="entertainment.tContent4"></spring:message></p>
                            <button class="singleButton"><spring:message code="entertainment.tuned"></spring:message> </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <%--<div class="advert" style="height: 300px;width: 100%;text-align: center;background-color: rgba(255,5,0,0.3)">广告位招租</div>--%>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>!function (i) {
    localStorage.setItem("designId", i);
    if (!localStorage.getItem("referenceTime")) {
        localStorage.setItem("referenceTime", new Date().getTime());
    }
    var w = document.createElement("script");
    w.src = "http://nps.survetchina.com/js/webSurvey.js";
    document.body.appendChild(w);
}("acb28c519619449187813c16d0901d3b");</script>
</body>
</html>
