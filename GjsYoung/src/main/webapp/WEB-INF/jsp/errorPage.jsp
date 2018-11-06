<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹(yaoteach)</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link rel="stylesheet" href="css/login.css" />


</head>
<body>
<div class="register-container">
    <div>
        <a href="${pageContext.request.contextPath }/index"><img src="images/main/icon.png" class="logoErrorImg"></a>
        <br>
    </div>
    <h1>尧舜禹</h1>

    <div class="connect">
        <p>${errorMessage.message}</p>
    </div>
    <br>
    <a href="/index">
        <button type="button" class="register-tis">返回首页</button>
    </a>

</div>

<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
