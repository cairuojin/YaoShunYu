<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>头导航</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/jquery.fancybox.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <style type="text/css">



    </style>
</head>

<header id="navigation" class="navbar-inverse navbar-fixed-top animated-header">
    <div class="container">
        <div class="navbar-header">
            <h1 class="navbar-brand"><a href="${pageContext.request.contextPath }/index"><img src="images/main/Logo.png"
                                                                                              class="logoHeaderImg"></a>
            </h1>
            <h1 class="navbar-brand">
                <a href="#body" style="font-size: 24px;"><spring:message code="header.reading"></spring:message> </a>
            </h1>
        </div>
        <div class="top-nav">
            <nav class="navbar-right">
                <ul id="nav" class="nav navbar-nav">
                    <c:if test="${pageHeader == 0 }">
                        <li><a href="javascript:0" class="active"><spring:message
                                code="header.index"></spring:message> </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 0 }">
                        <li><a href="${pageContext.request.contextPath }/index"><spring:message
                                code="header.index"></spring:message> </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 1 }">
                        <li><a href="${pageContext.request.contextPath }/celebrity?page=1"
                               class="active"><spring:message code="header.celebrity"></spring:message> </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 1 }">
                        <li><a href="${pageContext.request.contextPath }/celebrity?page=1"><spring:message
                                code="header.celebrity"></spring:message> </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 2 }">
                        <li><a href="${pageContext.request.contextPath }/classical?page=1"
                               class="active"><spring:message code="header.classical"></spring:message> </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 2 }">
                        <li><a href="${pageContext.request.contextPath }/classical?page=1"><spring:message
                                code="header.classical"></spring:message> </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 3 }">
                        <li><a href="${pageContext.request.contextPath }/atricle?page=1" class="active"><spring:message
                                code="header.article"></spring:message> </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 3 }">
                        <li><a href="${pageContext.request.contextPath }/atricle?page=1"><spring:message
                                code="header.article"></spring:message> </a></li>
                    </c:if>

                    <c:if test="${pageHeader == 4 }">
                        <li><a href="${pageContext.request.contextPath }/entertainment" class="active"><spring:message
                                code="header.entertainment"></spring:message> </a></li>
                    </c:if>
                    <c:if test="${pageHeader != 4 }">
                        <li><a href="${pageContext.request.contextPath }/entertainment"><spring:message
                                code="header.entertainment"></spring:message> </a></li>
                    </c:if>

                    <c:if test="${user == null }">
                        <li style="margin-right: 0px!important;"><a
                                href="${pageContext.request.contextPath }/toLogin"><spring:message
                                code="header.login"></spring:message></a></li>
                        <li style="margin-left: 4px!important;margin-right: 0px!important;"><a>/</a></li>
                        <li style="margin-left: 0px!important;"><a
                                href="${pageContext.request.contextPath }/toRegister"><spring:message
                                code="header.register"></spring:message> </a></li>
                    </c:if>
                    <c:if test="${user != null }">
                        <c:if test="${pageHeader == 6 }">
                            <li style="margin-right: 0px!important;"><a
                                    href="${pageContext.request.contextPath }/personal" class="active"><spring:message
                                    code="header.personal"></spring:message> </a></li>
                            <li style="margin-left: 4px!important;margin-right: 0px!important;"><a>/</a></li>
                            <li style="margin-left: 0px!important;"><a
                                    href="${pageContext.request.contextPath }/cancellation"><spring:message
                                    code="header.cancel"></spring:message> </a></li>
                        </c:if>
                        <c:if test="${pageHeader != 6 }">
                            <li style="margin-right: 0px!important;"><a
                                    href="${pageContext.request.contextPath }/personal"><spring:message
                                    code="header.personal"></spring:message></a></li>
                            <li style="margin-left: 4px!important;margin-right: 0px!important;"><a>/</a></li>
                            <li style="margin-left: 0px!important;"><a
                                    href="${pageContext.request.contextPath }/cancellation"><spring:message
                                    code="header.cancel"></spring:message> </a></li>
                        </c:if>
                    </c:if>
                    <div style="float: right">
                        <dl id="sample" class="dropdown" style="float: right;margin-bottom: 0px">
                            <dt onclick="showLanguage()"><a href="javascript:0">&nbsp;<spring:message code="header.language"></spring:message>  </a></dt>
                            <dd>
                                <ul id="languageul" hidden="hidden">
                                    <li onclick="changeLanguage(0)"><a href="#">简体中文<img class="flag" src="images/main/zh.jpg"/></a></li>
                                    <li onclick="changeLanguage(1)"><a href="#">English<img class="flag" src="images/main/gb.jpg"/></a></li>
                                    <li onclick="changeLanguage(2)"><a href="#">español<img class="flag" src="images/main/es.jpg"/></a></li>
                                    <li onclick="changeLanguage(3)"><a href="#">Francese<img class="flag" src="images/main/fr.jpg"/></a></li>
                                    <li onclick="changeLanguage(4)"><a href="#">Italiano<img class="flag" src="images/main/it.jpg"/></a></li>
                                    <li onclick="changeLanguage(5)"><a href="#">日本語<img class="flag" src="images/main/jp.jpg"/></a></li>
                                    <li onclick="changeLanguage(6)"><a href="#">한글<img class="flag" src="images/main/ko.jpg"/></a></li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                </ul>
            </nav>
        </div>

    </div>
</header>
<script type="text/javascript">
    function showLanguage() {
        $("#languageul").fadeToggle(500);   //点击显示语言框
    }

    $(document).on('mousewheel DOMMouseScroll', hideLanguage);  //滚轮隐藏框
    function hideLanguage() {
        $("#languageul").fadeOut(500);
    }

    function changeLanguage(L) {
        var language;
        if(L == 0)
            language = "zh_CN";
        else if(L == 1){
            language = "en_US"
        }else if(L == 2){
            language = "es_ES"
        }else if(L == 3){
            language = "fr_FR"
        }else if(L == 4){
            language = "it_IT"
        }else if(L == 5){
            language = "ja_JP"
        }else if(L == 6){
            language = "ko_KR"
        }

        var hasLanguage = false;
        var url = window.location.href; //当前路径
        var arrObj = url.split("?");
        var params = arrObj[1];         //参数部分
        var shortUrl = arrObj[0];       //路径部分


        if (arrObj.length > 1) {        //有参数
            var arrPara = params.split("&"); //参数数组
            var arr;

            for (var i = 0; i < arrPara.length; i++) {
                arr = arrPara[i].split("=");

                if (arr != null && arr[0] == "language") {
                    params = params.replace(arr[1],language);       //如果有则replace
                    hasLanguage = true;
                }
            }
            if(hasLanguage == false){   //有参数无语言，直接添加参数
                params += "&language=" + language;
            }
            window.location.href = shortUrl + "?" + params;
        }
        else {  //无参数
            url += "?language=" + language;
            window.location.href = url;
        }
    }
</script>
</html>
