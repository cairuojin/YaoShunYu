<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹(yaoteach)</title>
    <meta name="keywords" content="尧舜禹_yaoteach_让历史学习乐在其中，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link rel="stylesheet" href="css/login.css" />

</head>

<body>
<div class="register-container">
    <div>
        <a href="${pageContext.request.contextPath }/index"><img src="images/main/Logo.png" class="logoRegisterImg"></a>
        <br><br><br>
    </div>
    <h1><spring:message code="index.domain"></spring:message> </h1>

    <div class="connect">
        <c:choose>
            <c:when test="${random == 0}">
                <p><spring:message code="person.slogan1"></spring:message> </p>
            </c:when>
            <c:when test="${random == 1}">
                <p><spring:message code="person.slogan2"></spring:message></p>
            </c:when>
            <c:when test="${random == 2}">
                <p><spring:message code="person.slogan3"></spring:message></p>
            </c:when>
            <c:when test="${random == 3}">
                <p><spring:message code="person.slogan4"></spring:message></p>
            </c:when>
            <c:when test="${random == 4}">
                <p><spring:message code="person.slogan5"></spring:message></p>
            </c:when>
        </c:choose>
    </div>

    <form action="${pageContext.request.contextPath }/register" method="post" id="registerForm">
        <div>
            <input type="text" name="username" class="username" id="username" placeholder="<spring:message code="register.username"></spring:message>" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="<spring:message code="register.password"></spring:message>" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" name="confirm_password" class="confirm_password" placeholder="<spring:message code="register.rePass"></spring:message>" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="text" name="nickname" class="nickname" placeholder="<spring:message code="register.nickname"></spring:message>" autocomplete="off" id="nickname"/>
        </div>
        <div>
            <input type="text" name="phonenum" class="phone_number" placeholder="<spring:message code="register.mobile"></spring:message>" autocomplete="off" id="phonenum"/>
        </div>
        <div>
            <input type="email" name="email" class="email" placeholder="<spring:message code="register.email"></spring:message>" oncontextmenu="return false" onpaste="return false" />
        </div>

        <button id="submit" type="submit"><spring:message code="header.register"></spring:message> </button>
    </form>
    <a href="/toLogin">
        <button type="button" class="register-tis"><spring:message code="register.haveAcc"></spring:message></button>
    </a>

</div>
<div style="height: 100px"></div>
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
