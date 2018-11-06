<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_鸾翔凤集</title>
    <meta name="keywords" content="尧舜禹_yaoteach_鸾翔凤集_优秀历史文章分享，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/author.css">
</head>
<body class="dark_version" style="background: url(images/main/background.jpg)">
<jsp:include page="header.jsp"></jsp:include>
<div id="preloader"></div>
    <section class="our_advisor_area section_padding_100" id="advisor">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                    <div class="single_advisor_profile">
                        <div class="single_advisor_slide">
                            <div class="advisor_thumb">
                                <img src="${author.image}">
                            </div>
                            <div class="single_advisor_details_info">
                                <h4>${author.nickname}</h4>
                                <p class="designation">${author.moodtxt}</p>
                                <div class="about_advisor">
                                    <p>${author.introduction}</p>
                                </div>
                                <!-- Single advisor social link -->
                                <div class="advisor_social_info" style="margin-top: 20px">
                                    <div class="social_icon">
                                        <a href="#"><i class="glyphicon glyphicon-thumbs-up" title="点赞"></i>点赞</a>
                                        <a href="#"><i class="glyphicon glyphicon-thumbs-down" title="反对"></i>反对</a>
                                        <a href="#"><i class="glyphicon glyphicon-home" title="百科"></i>百科</a>
                                        <a href="#"><i class="glyphicon glyphicon-envelope" title="发邮件"></i>邮件</a>
                                        <a href="#"><i class="glyphicon glyphicon-picture" title="图片"></i>图片</a>
                                        <a href="#"><i class="glyphicon glyphicon-bell" title="关注他"></i>关注</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 nameDiv">
                    <div class="section_heading">
                        <h3>${author.nickname}</h3>
                        <p>${author.comment}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="faq_question_area section_padding_60" data-stellar-background-ratio="0.6" style="background-image: url(images/author/yizhongtian1.jpg)"    >
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="section_heading">
                        <h3>他的文章</h3>
                        <p>兴酣落笔摇五岳，诗成笑傲凌沧洲。</p>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-8 col-sm-offset-4 col-md-6 col-md-offset-6">
                    <div class="faq_area">
                        <div class="accordions" id="accordion" role="tablist" aria-multiselectable="true">

                            <c:if test="${article.size() >= 1}">
                            <div class="panel single-accordion wow fadeInUp" data-wow-delay=".1s">
                                <h5>
                                    <a role="button" class="collapsed" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">${article.get(0).title}
                                        <span class="accor-open"><i class="fa fa-sort-desc" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-sort-asc" aria-hidden="true"></i></span>
                                    </a>
                                </h5>
                                <div id="collapseOne" class="accordion-content collapse">
                                    <p>${article.get(0).introduction}</p>
                                    <a class="watch" href="${pageContext.request.contextPath }/articleDetail/${article.get(0).id}">查看该文章</a>
                                </div>
                            </div>
                             </c:if>

                            <c:if test="${article.size() >= 2}">
                            <div class="panel single-accordion wow fadeInUp" data-wow-delay=".2s">
                                <h5>
                                    <a role="button" class="collapsed" aria-expanded="true" aria-controls="two" data-parent="#accordion" data-toggle="collapse" href="#two">${article.get(1).title}
                                        <span class="accor-open"><i class="fa fa-sort-desc" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-sort-asc" aria-hidden="true"></i></span>
                                    </a>
                                </h5>
                                <div id="two" class="accordion-content collapse">
                                    <p>${article.get(1).introduction}</p>
                                    <a class="watch" href="${pageContext.request.contextPath }/articleDetail/${article.get(1).id}">查看该文章</a>
                                </div>
                            </div>
                            </c:if>

                            <c:if test="${article.size() >= 3}">
                            <div class="panel single-accordion wow fadeInUp" data-wow-delay=".3s">
                                <h5>
                                    <a role="button" aria-expanded="true" aria-controls="three" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#three">${article.get(2).title}
                                        <span class="accor-open"><i class="fa fa-sort-desc" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-sort-asc" aria-hidden="true"></i></span>
                                    </a>
                                </h5>
                                <div id="three" class="accordion-content collapse">
                                    <p>${article.get(2).introduction}</p>
                                    <a class="watch" href="${pageContext.request.contextPath }/articleDetail/${article.get(2).id}">查看该文章</a>
                                </div>
                            </div>
                            </c:if>

                            <div>
                                <a href="${pageContext.request.contextPath }/articlesearch?type=1&value=${author.nickname}">
                                    <button type="button" class="register-tis">他的更多文章</button>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
</body>
</html>
