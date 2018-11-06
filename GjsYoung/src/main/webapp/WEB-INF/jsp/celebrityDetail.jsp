<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_博古通今</title>
    <meta name="keywords" content="尧舜禹_yaoteach_博古通今_古人知识百科大全，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <link href="css/characterDetail.css" rel="stylesheet" type="text/css" media="all"/>

</head>

<body style="background: url(images/main/background.jpg)">

    <jsp:include page="header.jsp"></jsp:include>

    <div id="main" style="padding-top: 90px;padding-bottom: 67px">
        <div class="container">
            <div class="row">
                <div id="content">
                    <section>
                        <div>
                            <h1 class="celebrityTitle">${celebrity.name}</h1>
                        </div>
                        <div style="padding-top: 30px;">
                            <img src="${celebrity.bigimage}" class="detailImg"/>
                        </div>
                        <div>
                            <div class="col-sm-6 col-md-3 detailLeftTxt">
                                <div class="single_feature wow fadeInUp" data-wow-delay=".2s">
                                    <div class="feature_text">
                                        <h5>生卒日</h5>
                                        <p>${celebrity.birthanddeath}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 detailLeftTxt">
                                <div class="single_feature wow fadeInUp" data-wow-delay=".2s">
                                    <div class="feature_text">
                                        <h5>别称</h5>
                                        <p>${celebrity.alias}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 detailLeftTxt">
                                <div class="single_feature wow fadeInUp" data-wow-delay=".2s">
                                    <div class="feature_text">
                                        <h5>简介</h5>
                                        <p>${celebrity.assess}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 detailLeftTxt">
                                <div class="single_feature wow fadeInUp" data-wow-delay=".2s">
                                    <div class="feature_text">
                                        <h5>出生地</h5>
                                        <p>${celebrity.homeplace}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <p>${celebrity.content}</p>
                        </div>
                    </section>
                </div>


            </div>
        </div>
    </div>

    <div class="features">
    <div class="container">
        <h3 class="head" style="font-family: 微软雅黑"><span aria-hidden="true"><img src="images/main/menu.png"></span>${celebrity.evaluate}</h3>
        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active" style="margin-left: 20px"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">${celebrityDetails.get(0).title}</a></li>
                <c:forEach items="${celebrityDetails}" var="s" begin="1" end="${celebrityDetails.size()}" varStatus="i">
                    <li role="presentation" style="margin-left: 20px"><a href="#Feature${i.index}" role="tab" id="Feature1-tab" data-toggle="tab" aria-controls="Feature${i.index}">${s.title}</a></li>
                </c:forEach>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                    <div class="w3agile_tabs">
                        <div class="col-md-7 w3agile_tab_left">
                            ${celebrityDetails.get(0).content}
                        </div>
                        <div class="col-md-5 w3agile_tab_right w3agile_tab_right1">
                            <img src="${celebrityDetails.get(0).image}" alt=" " class="img-responsive" />
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <c:forEach items="${celebrityDetails}" var="single" begin="1" end="${celebrityDetails.size()}" varStatus="i">
                    <c:if test="${i.index %2 != 0}">
                        <div role="tabpanel" class="tab-pane fade" id="Feature${i.index}" aria-labelledby="Feature${i.index}-tab">
                            <div class="w3agile_tabs">
                                <div class="col-md-5 w3agile_tab_right w3agile_tab_right2">
                                    <img src="${single.image}" alt=" " class="img-responsive" />
                                </div>
                                <div class="col-md-7 w3agile_tab_left">
                                    ${single.content}
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${i.index %2 == 0}">
                        <div role="tabpanel" class="tab-pane fade" id="Feature${i.index}" aria-labelledby="Feature${i.index}-tab">
                            <div class="w3agile_tabs">
                                <div class="col-md-7 w3agile_tab_left">
                                    ${single.content}
                                </div>
                                <div class="col-md-5 w3agile_tab_right w3agile_tab_right1">
                                    <img src="${single.image}" alt=" " class="img-responsive" />
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
