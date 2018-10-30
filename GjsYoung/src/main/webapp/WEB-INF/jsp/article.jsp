<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹-鸾翔凤集</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <link href="css/article.css" rel="stylesheet" type="text/css" media="all"/>
</head>

<body style="background: url(images/main/background.jpg)">

    <jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section_heading myTitle">
                    <div style="font-family: myFirstFont;font-size: 80px;color: #e67e22;">鸾翔凤集</div>
                    <p style="margin-top: 30px;font-size: 16px;color: black;">学而不思则惘，思而不学则殆。——孔子</p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 searchdiv">
        <div class="header-search">
            <form action="${pageContext.request.contextPath }/articlesearch">
                <select class="input-select" name="type">
                    <c:if test="${empty searchType}">
                        <option value="0" selected="selected">文章</option>
                        <option value="1">作者</option>
                    </c:if>
                    <c:if test="${searchType == 0}">
                        <option value="0" selected="selected">文章</option>
                        <option value="1">作者</option>
                    </c:if>
                    <c:if test="${searchType == 1}">
                        <option value="0">文章</option>
                        <option value="1" selected="selected">作者</option>
                    </c:if>
                </select>
                <c:if test="${empty searchHistory}">
                    <input class="input" placeholder="搜索文章或作者" name="value" required>
                </c:if>
                <c:if test="${!empty searchHistory}">
                    <input class="input" placeholder="${searchHistory}" name="value" required>
                </c:if>
                <button class="search-btn">搜索</button>
            </form>
        </div>
    </div>

    <div class="products">
        <div class="container">
            <div class="col-md-9 product-left leftDiv">
                <c:if test="${articles.size() == 0}">
                    <div class="prod">啊哦好像找不到您要的资料呢！<br></div>
                </c:if>

                <c:forEach items="${articles }" var="article">
                    <div class="prod wow animate fadeInUp">
                        <c:if test="${article.status == 1}">
                            <div class="nullDiv">[置顶]</div>
                        </c:if>

                        <div class="col-md-3 product-left1">
                            <img src="${article.image}" class="img-responsive articleImg" alt="" />
                        </div>
                        <div class="col-md-5 product-left1">
                            <h4><a href="${pageContext.request.contextPath }/articleDetail/${article.id}">${article.title}</a></h4>
                            <p>${article.introduction}</p>
                        </div>
                        <div class="col-md-4 product-left1">
                            <a class="more" href="${pageContext.request.contextPath }/articleDetail/${article.id}">进入</a>
                        </div>
                        <div class="clearfix"> </div>
                        <div class="updateDiv">
                            修改时间：<fmt:formatDate value="${article.lastupdatetime}" pattern="YYYY-MM-dd HH:mm:ss"/>
                            <div class="authorDiv">
                                <c:if test="${article.authorid == 1}">
                                    [转载]
                                </c:if>
                                <c:if test="${article.authorid != 1}">
                                    作者： <a href="${pageContext.request.contextPath }/author/${article.authorid}">${article.nickname}</a>
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
                                        <span class="store-qty">  只能搜索时间倒叙前十五条哦</span>
                                    </c:if>

                                    <c:if test="${page == null}">
                                        <span aria-hidden="true"> <a href="${pageContext.request.contextPath }/atricle?page=1" aria-label="Previous">取消搜索</a></span>
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
                <h3>文人雅士</h3>
                <c:forEach items="${authors }" var="author">
                    <div class="product-right1 wow animate fadeInUp">
                        <div class="pro">
                            <img src="${author.image}" class="articleImg" alt="${pageContext.request.contextPath }/author/${author.id}" />
                        </div>
                        <div class="data">
                            <h5><a href="${pageContext.request.contextPath }/author/${author.id}">${author.nickname}</a></h5>
                            <h6>${author.moodTxt}</h6>
                            <div class="follow" align="center"><h6><a href="#" style="line-height:30px;color: white">关注他</a></h6></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
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