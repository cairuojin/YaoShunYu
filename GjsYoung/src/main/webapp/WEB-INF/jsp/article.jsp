<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section_heading myTitle">
                    <div style="font-family: myFirstFont;font-size: 80px;color: #e67e22;"><spring:message code="header.article"></spring:message> </div>
                    <p style="margin-top: 30px;font-size: 16px;color: black;"><spring:message code="atricle.slogan"></spring:message> </p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 searchdiv">
        <div class="header-search">
            <form action="${pageContext.request.contextPath }/articlesearch">
                <select class="input-select" name="type">
                    <c:if test="${empty searchType}">
                        <option value="0" selected="selected"><spring:message code="atricle.article"></spring:message> </option>
                        <option value="1"><spring:message code="atricle.author"></spring:message> </option>
                    </c:if>
                    <c:if test="${searchType == 0}">
                        <option value="0" selected="selected"><spring:message code="atricle.article"></spring:message></option>
                        <option value="1"><spring:message code="atricle.author"></spring:message></option>
                    </c:if>
                    <c:if test="${searchType == 1}">
                        <option value="0"><spring:message code="atricle.article"></spring:message></option>
                        <option value="1" selected="selected"><spring:message code="atricle.author"></spring:message></option>
                    </c:if>
                </select>
                <c:if test="${empty searchHistory}">
                    <input class="input" placeholder="<spring:message code="atricle.searchArticle"></spring:message>" name="value" required>
                </c:if>
                <c:if test="${!empty searchHistory}">
                    <input class="input" placeholder="${searchHistory}" name="value" required>
                </c:if>
                <button class="search-btn"><spring:message code="celebrity.search"></spring:message> </button>
            </form>
        </div>
    </div>

    <div class="products">
        <div class="container">
            <div class="col-md-9 product-left leftDiv">
                <c:if test="${articles.size() == 0}">
                    <div class="prod"><spring:message code="atricle.couldnotfind"></spring:message> <br></div>
                </c:if>

                <c:forEach items="${articles }" var="article">
                    <div class="prod wow animate fadeInUp">
                        <c:if test="${article.status == 1}">
                            <div class="nullDiv">[<spring:message code="atricle.top"></spring:message> ]</div>
                        </c:if>

                        <div class="col-md-3 product-left1">
                            <img src="${article.image}" class="img-responsive articleImg" alt="" />
                        </div>
                        <div class="col-md-5 product-left1">
                            <h4><a href="${pageContext.request.contextPath }/articleDetail?articleId=${article.id}">${article.title}</a></h4>
                            <p>${article.introduction}</p>
                        </div>
                        <div class="col-md-4 product-left1">
                            <a class="more" href="${pageContext.request.contextPath }/articleDetail?articleId=${article.id}"><spring:message code="atricle.enter"></spring:message> </a>
                        </div>
                        <div class="clearfix"> </div>
                        <div class="updateDiv">
                            <spring:message code="atricle.updatetime"></spring:message> ：<fmt:formatDate value="${article.lastupdatetime}" pattern="YYYY-MM-dd HH:mm:ss"/>
                            <div class="authorDiv">
                                <c:if test="${article.authorid == 1}">
                                    [<spring:message code="atricle.Reprint"></spring:message> ]
                                </c:if>
                                <c:if test="${article.authorid != 1}">
                                    <spring:message code="atricle.author"></spring:message> ： <a href="${pageContext.request.contextPath }/author?authorId=${article.authorid}">${article.nickname}</a>
                                </c:if>
                            </div>
                        </div>

                    </div>
                </c:forEach>


                <!-- 页码 -->
                <div class="section">
                    <!-- container -->
                    <div class="container wow animate fadeInUp">
                        <!-- row -->
                        <div class="row">
                            <div id="store" class="col-md-9">
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
                                        <span class="store-qty">  <spring:message code="article.search15"></spring:message> </span>
                                    </c:if>

                                    <c:if test="${page == null}">
                                        <span aria-hidden="true"> <a href="${pageContext.request.contextPath }/atricle?page=1" aria-label="Previous"><spring:message code="celebrity.nosearch"></spring:message> </a></span>
                                    </c:if>

                                    <c:if test="${page != null}">
                                        <ul class="store-pagination">
                                            <c:if test="${page==1 }">
                                                <li class="disabled" ><a href="javascript:void(0)" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span></a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page!=1 }">
                                                <li><a href="${pageContext.request.contextPath }/atricle?page=1" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span></a>
                                                </li>
                                            </c:if>

                                            <c:forEach begin="1" end="${totalPage }" var="current">
                                                <c:if test="${page==current }">
                                                    <li class="active">${current}</li>
                                                </c:if>
                                                <c:if test="${page!=current }">
                                                    <li><a href="${pageContext.request.contextPath }/atricle?page=${current}">${current}</a></li>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${page==totalPage }">
                                                <li class="disabled"><a href="javascript:void(0)" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span></a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page!=totalPage }">
                                                <li><a href="${pageContext.request.contextPath }/atricle?page=${page+1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span></a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 product-right rightDiv">
                <h3><spring:message code="article.Literati"></spring:message><h3>
                <c:forEach items="${authors }" var="author">
                    <div class="product-right1 wow animate fadeInUp">
                        <div class="pro">
                            <img src="${author.image}" class="articleImg" alt="${pageContext.request.contextPath }/author?authorId=${author.id}" />
                        </div>
                        <div class="data">
                            <h5><a href="${pageContext.request.contextPath }/author?authorId=${author.id}">${author.nickname}</a></h5>
                            <h6>${author.moodTxt}</h6>
                            <div class="follow" align="center"><h6><a href="#" style="line-height:30px;color: white"><spring:message code="article.follow"></spring:message> </a></h6></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>