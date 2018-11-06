<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹(yaoteach)</title>
    <meta name="keywords" content="尧舜禹_yaoteach_让历史学习乐在其中，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link rel="stylesheet" href="css/login.css" />

    <span style="font-size:18px;">   </span><span style="font-size:24px;"><meta http-equiv="refresh" content="5;URL=/toLogin"> </span>

</head>
<body>
<div class="register-container">
    <div>
        <a href="${pageContext.request.contextPath }/index"><img src="images/main/Logo.png" class="logoRegisterImg"></a>
        <br><br><br>
    </div>
    <h1>尧舜禹</h1>

    <div class="connect">
        <p>恭喜您激活成功，请点击登录按钮或在五秒后自动返回 ！</p>
    </div>
    <br>
    <a href="/toLogin">
        <button type="button" class="register-tis">开始登录</button>
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
