<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头导航</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/jquery.fancybox.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<header id="navigation" class="navbar-inverse navbar-fixed-top animated-header">
    <div class="container">
        <div class="navbar-header">
            <h1 class="navbar-brand">
                <h1 class="navbar-brand"><a href="${pageContext.request.contextPath }/index"><img src="images/main/Logo.png" class="logoHeaderImg"></a></h1>
            </h1>
            <h1 class="navbar-brand">
                <a href="#body" style="font-size: 24px;">读万卷书行万里路</a>
            </h1>
        </div>
        <div class="top-nav">
            <nav class="navbar-right">
                <ul id="nav" class="nav navbar-nav">
                    <c:if test="${pageHeader == 0 }">
                        <li><a href="javascript:0" class="active">首页  </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 0 }">
                        <li><a href="${pageContext.request.contextPath }/index">首页  </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 1 }">
                        <li><a href="${pageContext.request.contextPath }/celebrity?page=1" class="active">博古通今  </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 1 }">
                        <li><a href="${pageContext.request.contextPath }/celebrity?page=1">博古通今  </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 2 }">
                        <li><a href="${pageContext.request.contextPath }/classical?page=1" class="active">开卷有益  </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 2 }">
                        <li><a href="${pageContext.request.contextPath }/classical?page=1">开卷有益  </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 3 }">
                        <li><a href="${pageContext.request.contextPath }/atricle?page=1" class="active">鸾翔凤集  </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 3 }">
                        <li><a href="${pageContext.request.contextPath }/atricle?page=1">鸾翔凤集  </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 4 }">
                        <li><a href="${pageContext.request.contextPath }/entertainment" class="active">觥筹交错  </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 4 }">
                        <li><a href="${pageContext.request.contextPath }/entertainment">觥筹交错  </a></li>
                    </c:if>

                    <c:if test="${user == null }">
                            <li style="margin-right: 0px!important;"><a href="${pageContext.request.contextPath }/toLogin" >登录</a></li>
                            <li style="margin-left: 4px!important;margin-right: 0px!important;"><a>/</a></li>
                            <li style="margin-left: 0px!important;"><a href="${pageContext.request.contextPath }/toRegister">注册  </a></li>
                    </c:if>
                    <c:if test="${user != null }">
                        <c:if test="${pageHeader == 6 }">
                            <li style="margin-right: 0px!important;"><a href="${pageContext.request.contextPath }/personal" class="active">个人中心</a></li>
                            <li style="margin-left: 4px!important;margin-right: 0px!important;"><a>/</a></li>
                            <li style="margin-left: 0px!important;"><a href="${pageContext.request.contextPath }/cancellation">注销  </a></li>
                        </c:if>
                        <c:if test="${pageHeader != 6 }">
                            <li style="margin-right: 0px!important;"><a href="${pageContext.request.contextPath }/personal">个人中心</a></li>
                            <li style="margin-left: 4px!important;margin-right: 0px!important;"><a>/</a></li>
                            <li style="margin-left: 0px!important;"><a href="${pageContext.request.contextPath }/cancellation">注销  </a></li>
                        </c:if>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</header>

</html>
