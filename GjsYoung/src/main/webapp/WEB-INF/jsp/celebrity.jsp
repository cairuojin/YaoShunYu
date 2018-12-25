<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_博古通今</title>
    <meta name="keywords" content="尧舜禹_yaoteach_博古通今_古人知识百科大全，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link href="css/character.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/author.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/personal.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/article.css" rel="stylesheet" type="text/css" media="all"/>

</head>

<body style="background: url(images/main/background.jpg)">

<jsp:include page="header.jsp"></jsp:include>


<div class="col-xs-12" style="padding-bottom: 30px">
    <!-- Section Heading Start -->
    <div class="section_heading myTitle">
        <div style="font-family: myFirstFont;font-size: 80px;color: #e67e22;"><spring:message code="header.celebrity"></spring:message> </div>
        <p style="font-family: 微软雅黑;font-size: 16px;"><spring:message code="celebrity.slogan1"></spring:message> </p>
    </div>
</div>


<!-- ************** 变色框 ************** -->
<div class="information" style="padding-bottom: 100px">
    <div class="container">
        <div class="information-main">
            <div class="col-md-4 information-grid">
                <span class="info-icons hovicon effect-4 sub-b"><img src="images/icn1.png" alt=""></span>
                <h4><spring:message code="celebrity.goal1"></spring:message> </h4>
                <p style="width: 60%;margin: 0 auto;"><spring:message code="celebrity.goalContent1"></spring:message> </p>
            </div>
            <div class="col-md-4 information-grid">
                <span class="info-icons hovicon effect-4 sub-b"><img src="images/icn2.png" alt=""></span>
                <h4><spring:message code="celebrity.goal2"></spring:message> </h4>
                <p style="width: 60%;margin: 0 auto;"><spring:message code="celebrity.goalContent2"></spring:message> </p>
            </div>
            <div class="col-md-4 information-grid">
                <span class="info-icons hovicon effect-4 sub-b"><img src="images/icn3.png" alt=""></span>
                <h4><spring:message code="celebrity.goal3"></spring:message> </h4>
                <p style="width: 60%;margin: 0 auto;"><spring:message code="celebrity.goalContent3"></spring:message> </p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- ************** 变色框 End ************** -->

<!-- 搜索框-->
<div class="col-md-6 searchdiv1" style="padding-bottom: 30px">
    <div class="header-search">
        <form action="${pageContext.request.contextPath }/celebritySearch">
            <c:if test="${empty searchHistory}">
                <input class="input" placeholder="<spring:message code="celebrity.searchCelebrity"></spring:message>" name="celebrityName" required>
            </c:if>
            <c:if test="${!empty searchHistory}">
                <input class="input" value="" placeholder="${searchHistory}" name="celebrityName" required>
            </c:if>
            <button class="search-btn"><spring:message code="celebrity.search"></spring:message> </button>
        </form>
    </div>
    <div class="Dynasty">
        <c:forEach items="${dynasties}" var="dynasty">
            <c:if test="${nowDynasty == dynasty.id}">
                <a href="javascript:void(0);" class="DynasttOne" style="color: black">${dynasty.name}</a>
            </c:if>
            <c:if test="${nowDynasty != dynasty.id}">
                <a href="${pageContext.request.contextPath }/celebrityDynasty?dynasty=${dynasty.id}"
                   class="DynasttOne">${dynasty.name}</a>
            </c:if>
        </c:forEach>
    </div>
</div>
<div class="clearfix"></div>
<!-- ************** 主内容 Start ************** -->
<section class="section_padding_100_70" id="service">
    <div class="container">
        <div class="row">
            <c:forEach items="${celebrities}" var="celebritie">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="single_service wow fadeInUp" data-wow-delay=".2s">
                        <a href="${pageContext.request.contextPath }/celebrityDetail?celebrityId=${celebritie.id}">
                        <div class="single_service_img" style="width: 100%">
                            <img src="${celebritie.image}" alt="">
                        </div>
                        <div class="single_service_title">
                            <h4>${celebritie.name}</h4>
                        </div>
                        <div class="single_service_content">
                            <div class="table">
                                <div class="table_cell">
                                    <p style="margin:0 auto">&nbsp;${celebritie.introduction}</p>
                                </div>
                            </div>
                        </div>
                        <div class="learn_more" onclick="goToDetail(${celebritie.id})">
                            <a data-target="#service_details" data-toggle="modal"
                               href="${pageContext.request.contextPath }/celebrityDetail?celebrityId="
                               +${celebritie.id}><h4 style="background: rgb(234, 155, 86);"><spring:message code="index.learnMore"></spring:message> </h4></a>
                        </div>
                        </a>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- 页码 -->
<div class="container">
    <div class="row section">
        <div id="store" style="text-align: center">
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
                        <span aria-hidden="true"> <a href="${pageContext.request.contextPath }/celebrity?page=1"
                                                     aria-label="Previous"><spring:message code="celebrity.nosearch"></spring:message> </a></span>
                </c:if>

                <c:if test="${page != null}">
                    <ul class="store-pagination">
                        <c:if test="${page==1 }">
                            <li class="disabled"><a href="javascript:void(0)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span></a>
                            </li>
                        </c:if>
                        <c:if test="${page!=1 }">
                            <li><a href="${pageContext.request.contextPath }/celebrity?page=1"
                                   aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span></a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${totalPage }" var="current">
                            <c:if test="${page==current }">
                                <li class="active">${current}</li>
                            </c:if>
                            <c:if test="${page!=current }">
                                <li>
                                    <a href="${pageContext.request.contextPath }/celebrity?page=${current}">${current}</a>
                                </li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${page==totalPage }">
                            <li class="disabled"><a href="javascript:void(0)" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </c:if>
                        <c:if test="${page!=totalPage }">
                            <li><a href="${pageContext.request.contextPath }/celebrity?page=${page+1}"
                                   aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </c:if>
                    </ul>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- ************** 主内容 End ************** -->


<jsp:include page="footer.jsp"></jsp:include>


</body>
<script>
    function goToDetail(ids) {
        window.location.href = "${pageContext.request.contextPath }/celebrityDetail?celebrityId=" + ids;
    }
</script>
</html>

